import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../home/Componants/CategoryFilterItemCard.dart';
import '../search/ProductSearchScreen.dart';

class ServiceWishlistScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final int? id;
  final VoidCallback? showAuthenticated;
  final NavigateToItemDetails? navigateToItemDetails;
  const ServiceWishlistScreen({
    super.key,
    this.type,
    this.id,
    this.showAuthenticated,
    this.navigateToItemDetails,
  });

  @override
  ConsumerState<ServiceWishlistScreen> createState() =>
      _ServiceOccasionScreenState();
}

class _ServiceOccasionScreenState extends ConsumerState<ServiceWishlistScreen> {

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);

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

    final servicesState = ref.watch(getWishListServicesStateNotifier);

    return Column(
      children: [
         servicesState.state == DataState.EMPTY
            ? EmptyDataView(
           icon: SVGIcons.localSVG(noFavoriteDataIcon,
               width: 79.w, height: 88.h),
           btuName: null,
           description:
           "Looks like this collection has no gifts saved yet.",
           btuAction: () {},
         )
            : Container(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(color: AppTheme.appGrey12, width: 1)),
          ),
          child: DataListView<ServiceShowData>(
              dataList: servicesState.data?.data?.services ??
                  (servicesState.state == DataState.LOADING
                      ? [
                    ...List.generate(
                        8, (index) => ServiceShowData())
                  ]
                      : []),
              paginated: true,
              gridView: true,
              childAspectRatio: .78,
              heightPresent: .828,
              loadingHeightPresent: .828,
              crossAxisSpacing: 12,
              pageLoading: servicesState.state == DataState.MORE_LOADING,
              onBottomReached: () {

              },
              builder: (item) => Skeletonizer(
                enabled: servicesState.state == DataState.LOADING,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 0, vertical: 0),
                  child: ServiceAndProductItemCardHorizontal(
                    service: item,
                    height: 160,
                    type: ItemType.Services,
                    onAddItemToCart: (id) {
                      addServiceToCart(id);
                    },
                    onAddItemToWishList: (id,collectionId) {
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
      ],
    )
      ;
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

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }
}
