import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/widgets/item_menu.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Models/UpdateDataModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/UtilsExts.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/data_list_view/DataListView.dart';
import '../../Widgets/EmptyDataPlaceHolder.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import 'ProductWishlistScreen.dart';
import 'ServiceWishlistScreen.dart';
import 'package:flutter/cupertino.dart' as cupertinoSize;

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
  final TextEditingController editCollectionController = TextEditingController();
  late TabController tabController;
  int activeTabIndex = 0;

  String? searchForProductData = null;
  String? searchForServiceData = null;

  String collectionName = "";

  @override
  void initState() {
    collectionName = widget.collectionName??"";
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

  OverlayEntry? _overlayEntry;


  final GlobalKey _menuKey = GlobalKey();
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

    handleState(editWishlistCollectionStateNotifier, showLoading: true,
        onSuccess: (res) {
      updateCollectionList();
      setState(() {
        collectionName = res.data?.data?.name ?? "";
      });
    });

    handleState(deleteWishlistCollectionStateNotifier, showLoading: true,
        onSuccess: (res) {
      updateCollectionList();
      context.pop();
    });

    handleState(resetCollectionStateNotifier, showLoading: true,
        onSuccess: (res) {
      updateCollectionList();
      context.pop();
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      print(
          "object ${res.data?.data?.id.toString()} ${res.data?.data?.productId.toString()}");
      ref
          .read(getWishListItemsStateNotifier.notifier)
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
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);
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
                  height: 101.h,
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
                            collectionName ?? "",
                            textAlign: TextAlign.center,
                            style: AppTheme.darkTheme.textTheme.displayLarge
                                ?.copyWith(fontSize: 22.sp, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              print("object");
                              _showMenu(context, _menuKey);
                            },
                            child: Container(
                              color: Colors.white,
                              width: 50.w,
                              height: 50.h,
                              key: _menuKey,
                              child: SVGIcons.localSVG(menuIcon,
                                  width: 10.w, height: 10.h, fit: BoxFit.none),
                            ),
                          ),
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

  void _showMenu(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
    key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final cupertinoSize.Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () => _removeOverlay(),
            child: Container(
              color: Colors.black.withOpacity(0.3), // تعتيم الخلفية
            ),
          ),
          Positioned(
            top: offset.dy + size.height,
            right: 16,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemMenu(
                      text: 'Delete Collection',
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts14w400
                          .copyWith(color: AppTheme.appRedColor),
                      action: () {
                        _removeOverlay();
                        deleteCollection();
                      }),
                  Container(
                    height: 1,
                    width: 180,
                    color: AppTheme.appGrey19.withOpacity(.5),
                  ),
                  ItemMenu(
                      text: 'Edit',
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts14w400
                          .copyWith(color: AppTheme.appRedColor),
                      action: () {
                        _removeOverlay();
                        showEditCollectionBottomSheet();
                      }
                  ),
                  Container(
                    height: 1,
                    width: 180,
                    color: AppTheme.appGrey19.withOpacity(.5),
                  ),
                  ItemMenu(
                      text: 'Empty Collection',
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts14w400,
                      action: () {
                        _removeOverlay();
                        resetCollection();
                      }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
  void fetchFavoriteProducts() {
    ref
        .read(getWishListItemsStateNotifier.notifier)
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
              }, onSignUpClicked: () {
                navigateToSignUp();
        },
            ));
  }
  void navigateToSignUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.ViewMode});
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

  void deleteCollection() {
    showMakeSureDialog(context: context,title:  "Are you sure you want to delete ${widget.collectionName} ?" ?? "",action: (){
      ref.read(deleteWishlistCollectionStateNotifier.notifier).deleteCollection(
        collectionId: widget.collectionId
      );
    });
  }

  void resetCollection(){
    ref.read(resetCollectionStateNotifier.notifier).resetCollection(
      collectionId: widget.collectionId
    );
  }
  void showEditCollectionBottomSheet() {
    showCreateNewCollection(
      controller: editCollectionController,
      type: CollectionProcess.EditCollection,
        context: context,
        onCreateCollection: (collectionName){
          editCollection(collectionName??"");
        },
      onDeleteCollection: (){
          deleteCollection();
        },
    );
    editCollectionController.text = collectionName;
  }

  void updateCollectionList() {
    ref.read(showWishlistCollectionsStateNotifier.notifier).fetchWishlistCollections();
  }

  void editCollection(String newCollectionName) {
    ref.read(editWishlistCollectionStateNotifier.notifier).updateCollection(collectionId: widget.collectionId,name: newCollectionName);
  }
}
