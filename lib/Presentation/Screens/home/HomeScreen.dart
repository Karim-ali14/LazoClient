import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/BottomSheets/AuthenticateBottomSheet.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalCategoryListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopServiceListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/BannerCardItems.dart';
import 'package:lazo_client/Presentation/Widgets/SearchWithFilter.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Utils/UtilsExts.dart';
import '../../BottomSheets/CollectionsBottomSheet.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import 'Componants/HorizontalOccasionsListViewWithTitleSeeAll.dart';
import 'Componants/HorizontalTopProductListViewWithTitleSeeAll.dart';
import 'Componants/HorizontalTopSellersListViewWithTitleSeeAll.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double _opacity = 0.8;
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getHomeData();
    });
    super.initState();
  }

  int? collectionIdAfterAddedNewCollection;
  int? itemIdAfterAddedNewCollection;

  @override
  Widget build(BuildContext context) {
    final homeDataState = ref.watch(homeDataStateNotifiers);
    var client = ref.watch(clientStateProvider);

    handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.productId;
      print("product id : $id");
      if (id != null) {
        ref.read(homeDataStateNotifiers.notifier).handleAddProductToCart(id);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.serviceId;
      if (id != null) {
        ref.read(homeDataStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      collectionIdAfterAddedNewCollection = null;
      itemIdAfterAddedNewCollection = null;
      showSnackBar(
          isFavorite: res.data?.data?.inWishlist ?? false,
          productId: res.data?.data?.productId?.toInt() ?? 0,
          collectionId: res.data?.data?.collectionId ?? 0,
          collectionName: res.data?.data?.collectionName);
      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);
      updateCollectionList();
    });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      showSnackBar(
          isFavorite: res.data?.data?.inWishlist ?? false,
          productId: res.data?.data?.serviceId?.toInt() ?? 0,
          collectionId: res.data?.data?.collectionId ?? 0,
          collectionName: res.data?.data?.collectionName);
      ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
      updateCollectionList();
      makeRefreshForWishListServices();
    });

    handleState(createWishlistFromBottomSheetCollectionStateNotifier,
        showLoading: true, onSuccess: (res) {
      showCollectionsBottomSheet(
          collectionId: collectionIdAfterAddedNewCollection,
          itemId: itemIdAfterAddedNewCollection);
      updateCollectionList();
    });

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () {
            getHomeData();
            return Future.delayed(const Duration(seconds: 1));
          },
          child: Stack(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 125,
                        ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState.data?.data?.banners.isEmpty ==
                                    true)
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BannerCardItems(
                                    list:
                                        homeDataState.state != DataState.LOADING
                                            ? homeDataState.data?.data?.banners
                                                    .map((item) =>
                                                        item.imagePath ?? "")
                                                    .toList() ??
                                                []
                                            : [""],
                                    height: 156,
                                    width: MediaQuery.of(context).size.width,
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    showIndicator: homeDataState.state !=
                                        DataState.LOADING,
                                  ),
                                  SizedBox(
                                    height: defaultPaddingHorizontal,
                                  )
                                ],
                              ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState.data?.data?.occasions.isEmpty ==
                                    true)
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalOccasionsListViewWithTitleSeeAll(
                                    list: homeDataState.state !=
                                            DataState.LOADING
                                        ? homeDataState.data?.data?.occasions
                                                .toList() ??
                                            []
                                        : [
                                            Occasion(),
                                            Occasion(),
                                            Occasion(),
                                            Occasion()
                                          ],
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    itemClick: (occasionItem) {
                                      // navigateToSeeAllBestProductAndService(
                                      //     occasionItem.name ?? "",
                                      //     ItemType.Products,
                                      //     occasionId: occasionItem.id?.toInt());
                                      navigateToOccasion(
                                          occasionItem.id,
                                          occasionItem.name,
                                          occasionItem.imagePath);
                                    },
                                    onSeeAllClickListener: (id, name) {
                                      navigateToSeeAllOccasions();
                                    },
                                  ),
                                  SizedBox(
                                    height: defaultPaddingHorizontal,
                                  ),
                                ],
                              ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState.data?.data?.topRatedProviders
                                        .isEmpty ==
                                    true)
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalTopSellersListViewWithTitleSeeAll(
                                    list:
                                        homeDataState.state != DataState.LOADING
                                            ? homeDataState.data?.data
                                                    ?.topRatedProviders
                                                    .toList() ??
                                                []
                                            : [
                                                ProviderData(),
                                                ProviderData(),
                                                ProviderData(),
                                                ProviderData()
                                              ],
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    itemClick: (itemId) {
                                      print("seller $itemId");
                                      navigateToSellerDetails(itemId);
                                    },
                                    onSeeAllClickListener: (id, name) {
                                      navigateToSeeAllTopSeller(
                                          context.tr(topSellersKey),
                                          CategoryType.Search);
                                    },
                                  ),
                                  SizedBox(
                                    height: defaultPaddingHorizontal,
                                  ),
                                ],
                              ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState.data?.data?.categories.isEmpty ==
                                    true)
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalCategoryListViewWithTitleSeeAll(
                                    isGrid: true,
                                    list: homeDataState.state !=
                                            DataState.LOADING
                                        ? homeDataState.data?.data?.categories
                                                .toList() ??
                                            []
                                        : [
                                            Category(),
                                            Category(),
                                            Category(),
                                            Category(),
                                            Category(),
                                            Category()
                                          ],
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    itemClick: (item) {
                                      navigateToSeeAllTopSeller("${item.name}",
                                          CategoryType.Categories,
                                          categoryId: item.id?.toInt() ?? 0);
                                    },
                                    onSeeAllClickListener: (id, name) {
                                      navigateToSeeAllCategories();
                                    },
                                  ),
                                  SizedBox(
                                    height: defaultPaddingHorizontal,
                                  )
                                ],
                              ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState
                                        .data?.data?.topRatedProducts.isEmpty ==
                                    true)
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalTopProductListViewWithTitleSeeAll(
                                    list:
                                        homeDataState.state != DataState.LOADING
                                            ? homeDataState.data?.data
                                                    ?.topRatedProducts
                                                    .toList() ??
                                                []
                                            : [
                                                ProviderProduct(),
                                                ProviderProduct(),
                                                ProviderProduct(),
                                                ProviderProduct(),
                                              ],
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    itemClick: (itemId, itemName, categoryIds) {
                                      navigateToItemDetails(ItemType.Products,
                                          itemId, itemName, categoryIds);
                                    },
                                    onAddItemToCart: (id) {
                                      addProductToCart(id);
                                    },
                                    onAddItemToWishList: (id, collectionId) {
                                      if (client != null) {
                                        productWishlistToggle(id, collectionId);
                                      } else {
                                        showAuthenticated();
                                      }
                                    },
                                    onSeeAllClickListener: (id, name) {
                                      navigateToSeeAllBestProductAndService(
                                          context.tr(bestProductsKey),
                                          ItemType.Products);
                                    },
                                    itemWidth: 160,
                                    title: context.tr(bestProductsKey),
                                  ),
                                  SizedBox(
                                    height: defaultPaddingHorizontal,
                                  )
                                ],
                              ),
                        (homeDataState.state == DataState.SUCCESS &&
                                homeDataState
                                        .data?.data?.topRatedServices.isEmpty ==
                                    true)
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalTopServiceListViewWithTitleSeeAll(
                                    list:
                                        homeDataState.state != DataState.LOADING
                                            ? homeDataState.data?.data
                                                    ?.topRatedServices
                                                    .toList() ??
                                                []
                                            : [
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData()
                                              ],
                                    showLoading: homeDataState.state ==
                                        DataState.LOADING,
                                    itemClick: (itemId, itemName, categoryIds) {
                                      navigateToItemDetails(ItemType.Services,
                                          itemId, itemName, categoryIds);
                                    },
                                    onAddItemToCart: (id) {
                                      addServiceToCart(id);
                                    },
                                    onAddItemToWishList: (id, collectionId) {
                                      print("object");
                                      if (client != null) {
                                        serviceWishlistToggle(id.toString(),collectionId);
                                      } else {
                                        showAuthenticated();
                                      }
                                    },
                                    onSeeAllClickListener: (id, name) {
                                      navigateToSeeAllBestProductAndService(
                                          context.tr(bestServicesKey),
                                          ItemType.Services);
                                    },
                                    itemWidth: 160,
                                    title: context.tr(bestServicesKey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Container(
                  color: Colors.white.withOpacity(_opacity),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SVGIcons.localSVG(lazoLogoSvg, width: 27, height: 30),
                          const SizedBox(
                            width: 6,
                          ),
                          SVGIcons.localSVG(lazoKeywordSvg,
                              width: 64, height: 18),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                navigateToProductsAndServices(
                                    CategoryType.Search,
                                    context.tr(searchKey),
                                    null);
                              },
                              child: SVGIcons.localSVG(
                                  searchIconWithPinkBackgroundSvg)),
                          const SizedBox(
                            width: 6,
                          ),
                          SVGIcons.localSVG(
                              notificationIconWithPinkBackgroundSvg),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPaddingHorizontal,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery To",
                            style: AppTheme
                                .styleWithTextAppGrey17AdelleSansFonts14w350,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Riyadh",
                            style: AppTheme
                                .styleWithTextBlackColor2AdelleSansExtendedFonts14w500,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SVGIcons.localSVG(downArrowImg,
                              color: AppTheme.blackColor2,
                              width: 16,
                              height: 16)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSeeAllCategories() {
    context.push(R_SeeAllCategoryOrOccasion,
        extra: {"type": CategoryType.Categories});
  }

  void navigateToSeeAllOccasions() {
    context.push(R_SeeAllCategoryOrOccasion,
        extra: {"type": CategoryType.Occasions});
  }

  void navigateToProductsAndServices(
      CategoryType type, String title, int? id) async {
    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
    print("occasionId : $id");
    var makeRefresh = await context.push(R_SeeAllProductOrService,
        extra: {"type": type, "title": title, "id": id});

    if (makeRefresh == true) {
      getHomeData();
    }
    print(
        "filter data -> ${ref.watch(filterForProductStateNotifiers).priceToSelected}");
  }

  void navigateToSeeAllTopSeller(String title, CategoryType type,
      {int? categoryId}) async {
    await context.push(R_SeeAllSeller,
        extra: {"type": type, "title": title, "categoryId": categoryId});

    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
  }

  void navigateToSeeAllBestProductAndService(String title, ItemType type,
      {int? occasionId}) async {
    await context.push(R_ShowBestProductOrService,
        extra: {"type": type, "title": title, "occasionId": occasionId});

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
  }

  void navigateToItemDetails(
      ItemType itemType, int itemId, String itemName, List<int> categoriesIds) {
    context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    });
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }

  void addProductToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString(), sessionId: sessionId);
    } else {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString());
    }
  }

  void productWishlistToggle(int id, String? collectionId) {
    ref
        .read(productToggleStateNotifier.notifier)
        .toggle(productId: id.toString(), collectionId: collectionId);
  }

  void serviceWishlistToggle(String serviceId, String? collectionId) {
    ref.read(serviceToggleStateNotifier.notifier).toggle(serviceId: serviceId,collectionId: collectionId);
  }

  void addServiceToCart(int id) {
    print("service id : $id");
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
      getHomeData();
    }
  }

  void getHomeData() {
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
  }

  void makeRefreshForWishListProducts() {
    ref
        .read(getWishListProductsStateNotifier.notifier)
        .fetchAllProductsInWishlist();
  }

  void makeRefreshForWishListServices() {
    ref
        .read(getWishListServicesStateNotifier.notifier)
        .fetchAllServicesInWishlist();
  }

  void navigateToOccasion(num? id, String? name, String? image) {
    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref
        .read(filterForReadyGiftProductStateNotifiers.notifier)
        .resetDataFilter();
    ref
        .read(filterForUnReadyGiftProductStateNotifiers.notifier)
        .resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
    context.push(R_OccasionResultScreen,
        extra: {"occasionId": id, "title": name, "image": image});
  }

  void showSnackBar(
      {bool? isFavorite,
      int? productId,
      int? collectionId,
      String? collectionName}) {
    final snackBar = SnackBar(
      backgroundColor: AppTheme.blackColor3,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVGIcons.localSVG(
                (isFavorite ?? false)
                    ? snackBarHeartFullIcon
                    : snackBarHeartEmptyIcon,
                width: 12,
                height: 12),
            SizedBox(
              width: 3.5,
            ),
            Text(
              (isFavorite ?? false)
                  ? "Added to $collectionName"
                  : "Removed from $collectionName",
              style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                showCollectionsBottomSheet(
                    collectionId: collectionId, itemId: productId);
              },
              child: Text(
                "Edit",
                style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts12w400,
              ),
            )
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showCollectionsBottomSheet({int? collectionId, int? itemId,OrderItemType? type}) {
    print("asdfasdfasdf2 $itemId $collectionId");

    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => CollectionsBottomSheet(
              selectedCollectionId: collectionId,
              onCreateCollection: () {
                collectionIdAfterAddedNewCollection = collectionId;
                itemIdAfterAddedNewCollection = itemId;
                showCreateNewCollection(
                    context: context,
                    controller: controller,
                    onCreateCollection: (collectionName) {
                      createCollection(collectionName ?? "");
                    });
              },
              onChangeCollection: (selectedCollectionId) {
                if(type == OrderItemType.Product) {
                  productWishlistToggle(itemId ?? 0, selectedCollectionId);
                }else{
                  serviceWishlistToggle((itemId ?? 0).toString(),selectedCollectionId);
                }
              },
            ));
  }

  void updateCollectionList() {
    ref
        .read(showWishlistCollectionsStateNotifier.notifier)
        .fetchWishlistCollections();
  }

  void createCollection(String collectionName) {
    ref
        .read(createWishlistFromBottomSheetCollectionStateNotifier.notifier)
        .createCollection(name: collectionName);
  }
}
