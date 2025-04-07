import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/FilterUtils.dart';
import '../../../Utils/SearchStorage.dart';
import '../../../main.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/SearchLocalStoragStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/RecentScreen.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import 'ProductSearchScreen.dart';

class ServiceSearchScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final int? id;
  final TextEditingController? controller;
  final VoidCallback? showAuthenticated;
  final NavigateToItemDetails? navigateToItemDetails;
  const ServiceSearchScreen({
    super.key,
    this.type,
    this.id,
    this.controller,
    this.showAuthenticated,
    this.navigateToItemDetails,
  });

  @override
  ConsumerState<ServiceSearchScreen> createState() =>
      _ServiceSearchScreenState();
}

class _ServiceSearchScreenState extends ConsumerState<ServiceSearchScreen> {
  FilterData? filterForServicesData;
  var currentPageForServices = 1;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecentSearches();
    });
    super.initState();
  }

  Future<void> _loadRecentSearches() async {
    ref
        .read(serviceSearchLocalStorageStateNotifier.notifier)
        .updateList(prefs.getStringList(SearchStorage.service_key) ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    final recentSearches = ref.watch(serviceSearchLocalStorageStateNotifier);
    filterForServicesData = ref.watch(filterForServiceStateNotifiers);

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref
          .read(getSellerDetailsWithServicesStateNotifier.notifier)
          .handleAddServiceToWishList(
              res.data?.data?.serviceId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false);

      ref.read(getServiceDetails.notifier).handelAddServiceToWishList(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);

      ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);

      ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
    });

    handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.serviceId;
      if (id != null) {
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    final servicesState = ref.watch(getServicesStateNotifiers);

    currentPageForServices =
        servicesState.data?.data?.services?.currentPage?.toInt() ?? 1;

    return widget.controller?.text.toString().isNotEmpty == true || getNumberOfFilterItems(filterForServicesData) > 0
        ? servicesState.state == DataState.EMPTY
            ? EmptyDataView(
                icon: SVGIcons.localSVG(searchIconNoDataSvg,
                    width: 114, height: 97),
                btuName: "View our best services Items",
                description:
                    "Oops! Use different keywords to see more results.",
                btuAction: () {
                  navigateToSeeAllBestProductAndService(
                      context.tr(bestServicesKey), ItemType.Services);
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: AppTheme.appGrey12, width: 1)),
                ),
                child: DataListView<ServiceShowData>(
                    dataList: servicesState.data?.data?.services?.data ??
                        (servicesState.state == DataState.LOADING
                            ? [
                                ...List.generate(
                                    8, (index) => ServiceShowData())
                              ]
                            : []),
                    paginated: true,
                    gridView: true,
                    childAspectRatio: .78,
                    heightPresent: 0.81,
                    loadingHeightPresent: 0.73,
                    crossAxisSpacing: 12,
                    pageLoading: servicesState.state == DataState.MORE_LOADING,
                    onBottomReached: () {
                      if (currentPageForServices <
                          (servicesState.data?.data?.services?.lastPage ?? 0)) {
                        fetchServices(++currentPageForServices);
                      }
                    },
                    builder: (item) => Skeletonizer(
                          enabled: servicesState.state == DataState.LOADING,
                          child: Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 0, vertical: 0),
                            child: ServiceAndProductItemCardHorizontal(
                              service: item,
                              width: 165,
                              type: ItemType.Services,
                              onAddItemToCart: (id) {
                                addServiceToCart(id);
                              },
                              onAddItemToWishList: (id) {
                                if (client != null) {
                                  serviceWishlistToggle(id.toString());
                                } else {
                                  widget.showAuthenticated?.call();
                                }
                              },
                              onItemClick: (id, name, categoriesIds) {
                                widget.navigateToItemDetails?.call(
                                    ItemType.Services, id, name, categoriesIds);
                              },
                            ),
                          ),
                        )),
              )
        : RecentScreen(
            recentSearches: recentSearches,
            itemSearchClick: (result) {
              widget.controller?.text = result;
              SearchStorage.saveSearch(
                  key: SearchStorage.service_key, query: result);
              widget.controller?.text = result;
              fetchServices(1);
            },
            onClearBtuClick: () {
              ref
                  .read(serviceSearchLocalStorageStateNotifier.notifier)
                  .clearData();
            },
          );
  }

  void fetchServices(int page) {
    ref.read(getServicesStateNotifiers.notifier).getServicesData(
        page: page,
        categoriesIds: widget.type == CategoryType.Categories ||
                widget.type == CategoryType.Search
            ? widget.type == CategoryType.Categories
                ? [widget.id ?? 0]
                : filterForServicesData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions ||
                widget.type == CategoryType.Search
            ? widget.type == CategoryType.Occasions
                ? [widget.id ?? 0]
                : filterForServicesData?.occasionsIdsSelected
            : null,
        ratings: filterForServicesData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForServicesData?.priceToSelected.toString(),
        priceFrom: filterForServicesData?.priceFromSelected.toString(),
        type: ItemType.Services.name.toLowerCase(),
        searchByName: widget.controller?.text.isEmpty == true
            ? null
            : widget.controller?.text);
  }

  void serviceWishlistToggle(String serviceId) {
    ref.read(serviceToggleStateNotifier.notifier).toggle(serviceId: serviceId);
  }

  void addServiceToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString(), sessionId: sessionId);
    } else {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString());
    }
  }

  void navigateToSeeAllBestProductAndService(String title, ItemType type,
      {int? occasionId}) async {
    await context.push(R_ShowBestProductOrService,
        extra: {"type": type, "title": title, "occasionId": occasionId});

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
  }
}
