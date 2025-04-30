import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
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
import 'ProductWishlistScreen.dart';
import 'ServiceWishlistScreen.dart';

class CollectionDetailsScreen extends ConsumerStatefulWidget {
  final String? collectionId;
  final String? collectionName;
  const CollectionDetailsScreen({
    super.key,
    this.collectionId,
    this.collectionName,
  });

  @override
  ConsumerState<CollectionDetailsScreen> createState() =>
      _CollectionDetailsScreenState();
}

class _CollectionDetailsScreenState
    extends ConsumerState<CollectionDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  String? searchForProductData = null;
  String? searchForServiceData = null;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (ref.read(clientStateProvider.notifier).checkIfUserExist() != null) {
        fetchFavoriteProducts();
        fetchFavoriteReadyGiftsProducts();
        fetchFavoriteUnReadyGiftsProducts();
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
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);
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
          child: Stack(children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: AppTheme.appGrey8.withOpacity(0.6), // Shadow color
                      blurRadius: .5, // Blur effect
                      spreadRadius: .1, // Spread effect
                      offset: const Offset(0, .5), // Shadow position
                    ),
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                          Text(
                            widget.collectionName ?? "",
                            textAlign: TextAlign.center,
                            style: AppTheme.darkTheme.textTheme.displayLarge
                                ?.copyWith(fontSize: 22, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          SVGIcons.localSVG(menuIcon,width: 10,height: 10, fit: BoxFit.none)
                        ],
                      ),
                      TabBar(
                        isScrollable: true,
                        indicatorWeight: 5,
                        labelColor: Colors.transparent,
                        unselectedLabelColor: Colors.transparent,
                        indicatorPadding: EdgeInsets.zero,
                        indicatorColor: AppTheme.appRedColor,
                        tabs: [
                          Tab(
                              child: Text("All",
                                  style: activeTabIndex == 0
                                      ? AppTheme
                                      .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                      : AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w400)),
                          Tab(
                            child: Text("Ready Gifts",
                                style: activeTabIndex == 1
                                    ? AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                          ),
                          Tab(
                            child: Text("Unready Gifts",
                                style: activeTabIndex == 2
                                    ? AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                          ),
                          Tab(
                            child: Text("Service",
                                style: activeTabIndex == 3
                                    ? AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    ProductWishlistScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.All,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ProductWishlistScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.Ready,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ProductWishlistScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.UnReady,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ServiceWishlistScreen(
                        type: CategoryType.Search,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                  ],
                ))
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void fetchFavoriteProducts() {
    ref
        .read(getWishListProductsStateNotifier.notifier)
        .fetchAllProductsInWishlist(
            type: "product", collectionId: widget.collectionId);
  }

  void fetchFavoriteReadyGiftsProducts() {
    ref
        .read(getWishListReadyGiftsProductsStateNotifier.notifier)
        .fetchAllProductsInWishlist(
            type: "product",
            shipmentType: ProductType.ready_made_gifts.name,
            collectionId: widget.collectionId);
  }

  void fetchFavoriteUnReadyGiftsProducts() {
    ref
        .read(getWishListUnReadyGiftsProductsStateNotifier.notifier)
        .fetchAllProductsInWishlist(
            type: "product",
            shipmentType: ProductType.various_gifts.name,
            collectionId: widget.collectionId);
  }

  void fetchFavoriteServices() {
    ref
        .read(getWishListServicesStateNotifier.notifier)
        .fetchAllServicesInWishlist(
            type: "service", collectionId: widget.collectionId);
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
