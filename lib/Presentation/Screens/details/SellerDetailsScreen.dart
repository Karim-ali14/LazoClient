import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Models/UpdateDataModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopProductListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopServiceListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Constants.dart';
import '../../../Localization/Keys.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/CircleImage.dart';
import '../../Widgets/SvgIcons.dart';

class SellerDetailsScreen extends ConsumerStatefulWidget {
  final int sellerId;
  const SellerDetailsScreen({super.key, required this.sellerId});

  @override
  ConsumerState<SellerDetailsScreen> createState() =>
      _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends ConsumerState<SellerDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;
  late ScrollController _scrollController;
  bool _appBarTitleVisible = true;
  bool defaultExpandedValue = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Update visibility based on scroll offset
        setState(() {
          _appBarTitleVisible = _scrollController.offset < 100;
        });
      }
    });
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProducts();
      getServices();
      getReviews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(defaultExpandedValue);
    final client = ref.watch(clientStateProvider);
    final sellerProducts = ref.watch(getSellerDetailsWithProductStateNotifier);
    final sellerServices = ref.watch(getSellerDetailsWithServicesStateNotifier);
    final sellerReview = ref.watch(getSellerDetailsWithReviewsStateNotifier);

    handleState(addProductToCartUseCaseStateNotifier , showLoading: true ,onSuccess: (res){
      var id = res.data?.data?.productId;
      print("product id : $id");
      if(id != null){
        ref.read(getProductDetails.notifier).handelAddProductToCart(id);
        ref.read(getSellerDetailsWithProductStateNotifier.notifier).handleAddProductToCart(id,res.data?.data?.categoriesIds ?? []);
        ref.read(homeDataStateNotifiers.notifier).handleAddProductToCart(id);
        ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier , showLoading: true ,onSuccess: (res){
      var id = res.data?.data?.serviceId;
      if(id != null){
        ref.read(getSellerDetailsWithServicesStateNotifier.notifier).handleAddServiceToCart(id,res.data?.data?.categoriesIds ?? []);
        ref.read(getServiceDetails.notifier).handelAddServiceToCart(id);
        ref.read(homeDataStateNotifiers.notifier).handelAddServiceToCart(id);
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(getSellerDetailsWithProductStateNotifier.notifier).handleAddProductToWishList(
              res.data?.data?.productId?.toInt() ?? 0,res.data?.data?.categoriesIds ?? [],res.data?.data?.inWishlist ?? false);

          ref.read(getProductDetails.notifier).handelAddProductToWishList(res.data?.data?.productId ?? 0,res.data?.data?.inWishlist ?? false);

          ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
              res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);

          ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
              res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);

        });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(getSellerDetailsWithServicesStateNotifier.notifier).handleAddServiceToWishList(
              res.data?.data?.serviceId?.toInt() ?? 0,res.data?.data?.categoriesIds ?? [],res.data?.data?.inWishlist ?? false);

          ref.read(getServiceDetails.notifier).handelAddServiceToWishList(res.data?.data?.serviceId ?? 0,res.data?.data?.inWishlist ?? false);

          ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
              res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);

          ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
              res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);

        });

    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          expandedHeight: 250,
          titleSpacing:
              0, // Set spacing between leading and title// Adjust based on your needs
          pinned: true,
          floating: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(
                start: 55, end: 0.0), // Adjust padding around the title
            title: AnimatedOpacity(
                opacity: _appBarTitleVisible
                    ? 0.0
                    : 1.0, // Fade in/out based on scroll
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageView(
                        isCircle: true,
                        initialImg: sellerProducts.data?.data?.imagePath,
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        sellerProducts.data?.data?.name?.ellipsize(20) ??
                            context.tr(storeNameKey),
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      ),
                    ],
                  ),
                )),
            background: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    child: Image.network(
                      sellerProducts.data?.data?.coverImagePath ?? "",
                      fit: BoxFit.cover,
                    ),
                    width: double.infinity,
                    height: 206,
                  ),
                ),
                _appBarTitleVisible
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageView(
                                    isCircle: true,
                                    initialImg:
                                        sellerProducts.data?.data?.imagePath),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sellerProducts.data?.data?.name
                                              ?.ellipsize(25) ??
                                          "",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        SVGIcons.smallStarIcon(),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${sellerProducts.data?.data?.overallRating ?? 0}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "(${sellerProducts.data?.data?.ratingsCount ?? 0})",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: _appBarTitleVisible ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Go back to the previous screen
            },
          ),
        ),
        SliverToBoxAdapter(
          child: _appBarTitleVisible
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: ExpandedText(
                      defaultExpandedValue: defaultExpandedValue,
                      maxLength: 165,
                      textStyle: AppTheme
                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                          .copyWith(height: 1.5),
                      onExpandChangeStatus: (value) {
                        defaultExpandedValue = value;
                        print(defaultExpandedValue);
                      },
                      textValue: sellerProducts.data?.data?.bio ?? ""),
                )
              : SizedBox(),
        ),
        SliverPersistentHeader(
          delegate: _SliverTabsDelegate(
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
                      width: 140,
                      height: 40,
                      padding: const EdgeInsets.all(10),
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
                      width: 140,
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
                          context.tr(servicesKey),
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
                Tab(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 16),
                    child: Container(
                      width: 140,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: activeTabIndex == 2
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey8,
                        ),
                        color: activeTabIndex == 2
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey9,
                      ),
                      child: Center(
                        child: Text(
                          context.tr(reviewsKey),
                          style: activeTabIndex == 2
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
          ),
          pinned: true,
        ),
        if (activeTabIndex == 0)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
                  child: HorizontalTopProductListViewWithTitleSeeAll(
                    list: sellerProducts.state == DataState.LOADING
                        ? [
                            ProviderProduct(),
                            ProviderProduct(),
                            ProviderProduct(),
                            ProviderProduct(),
                          ]
                        : sellerProducts
                                .data?.data?.categories?[index].products ??
                            [],
                    showLoading: sellerProducts.state == DataState.LOADING,
                    itemClick: (itemId, itemName, categoryIds) {
                      navigateToItemDetails(
                          ItemType.Products, itemId, itemName, categoryIds);
                    },
                    onAddItemToCart: (id) {
                      addProductToCart(id);
                    },
                    onAddItemToWishList: (id) {
                      if(client != null) {
                        productWishlistToggle(id);
                      }else{
                        showAuthenticated();
                      }
                    },
                    onSeeAllClickListener: (id, name) {
                      navigateToSeeAllBestProductAndService(
                          categoryId: id,
                          name,
                          ItemType.Products,
                          providerId: widget.sellerId);
                    },
                    itemWidth: 163,
                    title: sellerProducts.data?.data?.categories?[index].name ??
                        "",
                    rootId: sellerProducts.data?.data?.categories?[index].id
                        ?.toInt(),
                  ),
                );
              },
              childCount: sellerProducts.state == DataState.LOADING
                  ? 5
                  : sellerProducts.data?.data?.categories?.length ?? 0,
            ),
          ),
        if (activeTabIndex == 1)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
                  child: HorizontalTopServiceListViewWithTitleSeeAll(
                    list: sellerServices.state == DataState.LOADING
                        ? [
                            ServiceShowData(),
                            ServiceShowData(),
                            ServiceShowData(),
                            ServiceShowData(),
                            ServiceShowData(),
                          ]
                        : sellerServices
                                .data?.data?.categories?[index].services ??
                            [],
                    showLoading: sellerServices.state == DataState.LOADING,
                    itemClick: (itemId, itemName, categoryIds) {
                      navigateToItemDetails(
                          ItemType.Services, itemId, itemName, categoryIds);
                    },
                    onAddItemToCart: (id) {
                      addServiceToCart(id);
                    },
                    onAddItemToWishList: (id) {
                      if(client != null){
                        serviceWishlistToggle(id.toString());
                      }else{
                        showAuthenticated();
                      }
                    },
                    onSeeAllClickListener: (id, name) {
                      print("$id $name");
                      navigateToSeeAllBestProductAndService(
                          categoryId: id,
                          name,
                          ItemType.Services,
                          providerId: widget.sellerId);
                    },
                    itemWidth: 163,
                    title: sellerServices.data?.data?.categories?[index].name ??
                        "",
                    rootId: sellerServices.data?.data?.categories?[index].id
                            ?.toInt() ??
                        0,
                  ),
                );
              },
              childCount: sellerProducts.state == DataState.LOADING
                  ? 5
                  : sellerServices.data?.data?.categories?.length ?? 0,
            ),
          ),
        if (activeTabIndex == 2)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.appGrey8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(children: [
                    Row(
                      children: [
                        SVGIcons.smallStarIcon(size: 24),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${sellerReview.data?.data?.overallRating ?? 0}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts24w700,
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${context.tr(basedOnKey)} ${sellerReview.data?.data?.ratingsCount ?? 0} ${context.tr(ratingsKey)}",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        if (activeTabIndex == 2)
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.appGrey8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${sellerReview.data?.data?.ratings?[index].userName}",
                            style: AppTheme
                                .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                          ),
                          Spacer(),
                          Text(
                            sellerReview.data?.data?.ratings?[index].date
                                    ?.convertDateToDdMmmYyyy ??
                                "",
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SVGIcons.smallStarIcon(),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${sellerReview.data?.data?.ratings?[index].rating ?? 0}",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts14w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ExpandedText(
                        textValue:
                            "${sellerReview.data?.data?.ratings?[index].ratingComment ?? 0}",
                        textStyle: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts14w500
                            .copyWith(height: 1.5),
                        maxLength: 70,
                        showLessText: context.tr(readLessKey),
                        showMoreText: context.tr(readMoreKey),
                      )
                    ],
                  ),
                ),
              );
            }, childCount: sellerReview.data?.data?.ratings?.length ?? 0),
          )
      ]),
    );
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

  void productWishlistToggle(int id) {
    ref
        .read(productToggleStateNotifier.notifier)
        .toggle(productId: id.toString());
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
      {int? categoryId, num? providerId}) async {
    await context.push(R_ShowBestProductOrService, extra: {
      "type": type,
      "title": title,
      "categoryId": categoryId,
      "providerId": providerId
    });

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
  }

  void navigateToItemDetails(
      ItemType itemType, int itemId, String itemName, List<int> categoriesIds) async {
    var updateData = await context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    }) as UpdateDataModel?;
    if(updateData != null && updateData.updateNormalData == true){
      getProducts();
      getServices();
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
    var makeRefresh = await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if(makeRefresh == true){
      getProducts();
      getServices();
    }
  }

  void getProducts() {
    ref
        .read(getSellerDetailsWithProductStateNotifier.notifier)
        .getSellerDetails(providerId: widget.sellerId);
  }

  void getServices() {
    ref
        .read(getSellerDetailsWithServicesStateNotifier.notifier)
        .getSellerDetails(providerId: widget.sellerId);
  }

  void getReviews() {
    ref
        .read(getSellerDetailsWithReviewsStateNotifier.notifier)
        .getSellerDetails(providerId: widget.sellerId);
  }

}

class _SliverTabsDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  final double paddingTop = 15;
  final double paddingBottom = 10;
  _SliverTabsDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            top: paddingTop,
          bottom: paddingBottom
        ), // Adjust the space above the TabBar
        child: _tabBar,
      ),
    );
  }

  @override
  double get maxExtent =>
      _tabBar.preferredSize.height + paddingTop + paddingBottom; // Add space above the TabBar

  @override
  double get minExtent =>
      _tabBar.preferredSize.height + paddingTop + paddingBottom; // Add space above the TabBar

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return _tabBar != (oldDelegate as _SliverTabsDelegate)._tabBar;
  }

}
