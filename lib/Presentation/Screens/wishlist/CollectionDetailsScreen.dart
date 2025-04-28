import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Models/UpdateDataModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataPlaceHolder.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';

class CollectionDetailsScreen extends ConsumerStatefulWidget {
  const CollectionDetailsScreen({super.key});

  @override
  ConsumerState<CollectionDetailsScreen> createState() => _CollectionDetailsScreenState();
}

class _CollectionDetailsScreenState extends ConsumerState<CollectionDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  String? searchForProductData = null;
  String? searchForServiceData = null;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(ref.read(clientStateProvider.notifier).checkIfUserExist() != null) {
        fetchFavoriteProducts();
        fetchFavoriteServices();
      }
    });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    // Your custom logic here
    print('Back button pressed!');
    context.pop(true);
    return false; // Return true to allow the pop action, false to prevent it
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(clientStateProvider.notifier).checkIfUserExist();

    final productsState = ref.watch(getWishListProductsStateNotifier);
    final servicesState = ref.watch(getWishListServicesStateNotifier);

    handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
          var id = res.data?.data?.productId;
          print("product id : $id");
          if (id != null) {
            ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
          }
        });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          print(
              "object ${res.data?.data?.id.toString()} ${res.data?.data?.productId.toString()}");
          ref
              .read(getWishListProductsStateNotifier.notifier)
              .deleteProductItem(res.data?.data?.productId.toString() ?? "");
          ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
              res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
          // refreshHomeData();
        });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref
              .read(getWishListServicesStateNotifier.notifier)
              .deleteServiceItem(res.data?.data?.serviceId.toString() ?? "");
          ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
              res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
          // refreshHomeData();
        });

    handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
          var id = res.data?.data?.serviceId;
          if (id != null) {
            ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
          }
        });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              TabBar(
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsetsDirectional.only(end: 0),
                physics: const ClampingScrollPhysics(),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Tab(
                      child: Container(
                        width: 167,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: activeTabIndex == 0
                                ? AppTheme.mainAppColor
                                : AppTheme.appGrey8,
                          ),
                          color: activeTabIndex == 0
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey9,
                        ),
                        child: Center(
                          child: Text(
                            context.tr(productsKey),
                            style: activeTabIndex == 0
                                ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 16),
                      child: Container(
                        width: 167,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: activeTabIndex == 1
                                ? AppTheme.mainAppColor
                                : AppTheme.appGrey8,
                          ),
                          color: activeTabIndex == 1
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey9,
                        ),
                        child: Center(
                          child: Text(
                            "Services",
                            style: activeTabIndex == 1
                                ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                controller: tabController,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      user == null
                          ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {
                          navigateToLogin();
                        },
                        icon: SVGIcons.existGifIcon(),
                        title: context.tr(youNeedYouLoginFirstKey),
                        description:
                        context.tr(youCanSeeYourWishlistWhenYouLoginKey),
                        showButton: true,
                      )
                          : productsState.state == DataState.EMPTY
                          ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                        icon: SVGIcons.wishlistGifIcon(),
                        title: context.tr(noProductsFoundKey),
                        description:
                        context.tr(whenYouAddAnyProductToYourWishlistItWillAppearHereKey),
                      )
                          : DataListView<ProviderProduct>(
                          dataList: productsState.data?.data?.products ??
                              (productsState.state == DataState.LOADING
                                  ? [
                                ...List.generate(
                                    5, (index) => ProviderProduct())
                              ]
                                  : []),
                          paginated: true,
                          pageLoading:
                          productsState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            // fetchFavoriteProducts(++currentPageForProducts);
                          },
                          builder: (item) => Skeletonizer(
                            enabled: productsState.state ==
                                DataState.LOADING,
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 16, vertical: 6),
                              child:
                              ServiceAndProductItemCardHorizontal(
                                type: ItemType.Products,
                                product: item,
                                onAddItemToCart: (id) {},
                                onAddItemToWishList: (id) {
                                  if (user != null) {
                                    productWishlistToggle(id);
                                  } else {
                                    showAuthenticated();
                                  }
                                },
                                onItemClick: (id, name, categoriesIds) {
                                  navigateToItemDetails(
                                      ItemType.Products,
                                      id,
                                      name,
                                      categoriesIds);
                                },
                              ),
                            ),
                          )),
                      user == null
                          ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {
                          navigateToLogin();
                        },
                        icon: SVGIcons.existGifIcon(),
                        title: context.tr(youNeedYouLoginFirstKey),
                        description:
                        context.tr(youCanSeeYourWishlistWhenYouLoginKey),
                        showButton: true,
                      )
                          : servicesState.state == DataState.EMPTY
                          ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                        icon: SVGIcons.wishlistGifIcon(),
                        title: context.tr(noServicesFoundKey),
                        description:
                        context.tr(whenYouAddAnyServiceToYourWishlistItWillAppearHereKey),
                      )
                          : DataListView<ServiceShowData>(
                          dataList: servicesState.data?.data?.services ??
                              (servicesState.state == DataState.LOADING
                                  ? [
                                ...List.generate(
                                    5, (index) => ServiceShowData())
                              ]
                                  : []),
                          paginated: true,
                          pageLoading:
                          servicesState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            // if (currentPageForServices <
                            //     (servicesState.data?.data?.services ??
                            //         0)) {
                            //   fetchFavoriteServices(++currentPageForServices);
                            // }
                          },
                          builder: (item) => Skeletonizer(
                            enabled: servicesState.state ==
                                DataState.LOADING,
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 16, vertical: 6),
                              child:
                              ServiceAndProductItemCardHorizontal(
                                service: item,
                                type: ItemType.Services,
                                onAddItemToCart: (id) {},
                                onAddItemToWishList: (id) {
                                  if (user != null) {
                                    serviceWishlistToggle(
                                        id.toString());
                                  } else {
                                    showAuthenticated();
                                  }
                                },
                                onItemClick: (id, name, categoriesIds) {
                                  navigateToItemDetails(
                                      ItemType.Services,
                                      id,
                                      name,
                                      categoriesIds);
                                },
                              ),
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void fetchFavoriteProducts() {
    ref
        .read(getWishListProductsStateNotifier.notifier)
        .fetchAllProductsInWishlist(
        type: "product",
        searchByName: searchForProductData == null ||
            searchForProductData?.isEmpty == true
            ? null
            : searchForProductData);
  }

  void fetchFavoriteServices() {
    ref
        .read(getWishListServicesStateNotifier.notifier)
        .fetchAllServicesInWishlist(
        type: "service",
        searchByName: searchForServiceData == null ||
            searchForServiceData?.isEmpty == true
            ? null
            : searchForServiceData);
  }

  void navigateToItemDetails(ItemType itemType, int itemId, String itemName,
      List<int> categoriesIds) async {
    var updateData = await context
        .push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    }) as UpdateDataModel?;
    if (updateData != null && updateData.updateNormalData == true) {
      fetchFavoriteProducts();
      fetchFavoriteServices();
    }
  }

  void productWishlistToggle(int id) {
    ref
        .read(productToggleStateNotifier.notifier)
        .toggle(productId: id.toString());
  }

  void serviceWishlistToggle(String serviceId) {
    ref.read(serviceToggleStateNotifier.notifier).toggle(serviceId: serviceId);
  }

  void showAuthenticated() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => AuthenticateBottomSheet(
          onLoginClicked: () {
            navigateToLogin();
          },
        ));
  }

  void navigateToLogin() async {
    var makeRefresh =
    await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});

    if (makeRefresh == true) {
      fetchFavoriteProducts();
      fetchFavoriteServices();
      refreshHomeData();
    }
  }

  void refreshHomeData() {
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
  }
}
