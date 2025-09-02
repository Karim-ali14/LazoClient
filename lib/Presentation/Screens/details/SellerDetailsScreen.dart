import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Models/UpdateDataModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/BottomSheets/RatingBottomSheet.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/CategoryTabs.dart';

import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopProductListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopServiceListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/ProductGridListView.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceGridListView.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Localization/Keys.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../BottomSheets/CategoriesBottomSheet.dart';
import '../../BottomSheets/DescriptionBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/AppScaffold.dart';
import '../../Widgets/CircleImage.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TextWithoutPadding.dart';

class SellerDetailsScreen extends ConsumerStatefulWidget {
  final int sellerId;
  const SellerDetailsScreen({super.key, required this.sellerId});

  @override
  ConsumerState<SellerDetailsScreen> createState() =>
      _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends ConsumerState<SellerDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TabController? categoryForProductTabController;
  late TabController? categoryForServiceTabController;

  List<Tab> productCategoryTabs = [];
  List<Tab> serviceCategoryTabs = [];

  int activeCategoryForProductTabIndex = 0;
  int activeCategoryTabForServiceIndex = 0;

  late ScrollController _scrollController;

  bool defaultExpandedValue = false;
  List<GlobalKey> _categoryForProductKeys = [];
  List<GlobalKey> _categoryForServiceKeys = [];
  final ValueNotifier<bool> appBarTitleVisible = ValueNotifier(true);
  final ValueNotifier<int> activeTabIndex = ValueNotifier(0);

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (activeTabIndex.value == 0) {
          handleProductScroll();
        } else if (activeTabIndex.value == 1) {
          handleServiceScroll();
        }
        appBarTitleVisible.value = !(_scrollController.offset > 280);
      }
    });
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      // setState(() {
      activeTabIndex.value = tabController.index;
      // });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProducts();
      getServices();
      getReviews();
    });
    super.initState();
  }

  void scrollToCategory(int index, FilterScreenTypes type) {
    final RenderBox renderBox = (type == FilterScreenTypes.Products
            ? _categoryForProductKeys[index].currentContext
            : _categoryForServiceKeys[index].currentContext)
        ?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());
    final offset = position.dy + _scrollController.offset - 158;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(defaultExpandedValue);
    final client = ref.watch(clientStateProvider);
    final sellerProducts = ref.watch(getSellerDetailsWithProductStateNotifier);
    final sellerServices = ref.watch(getSellerDetailsWithServicesStateNotifier);
    final sellerReview = ref.watch(getSellerDetailsWithReviewsStateNotifier);

    handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var productId = res.data?.data?.productId;
      print("product id : $productId");
      if (productId != null) {
        ref.read(getProductDetails.notifier).handelAddProductToCart(productId);
        ref
            .read(getSellerDetailsWithProductStateNotifier.notifier)
            .handleAddProductToCart(
                productId, res.data?.data?.categoriesIds ?? []);
        ref
            .read(homeDataStateNotifiers.notifier)
            .handleAddProductToCart(productId);
        ref
            .read(getProductsStateNotifiers.notifier)
            .handleAddProductToCart(productId);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.serviceId;
      if (id != null) {
        ref
            .read(getSellerDetailsWithServicesStateNotifier.notifier)
            .handleAddServiceToCart(id, res.data?.data?.categoriesIds ?? []);
        ref.read(getServiceDetails.notifier).handelAddServiceToCart(id);
        ref.read(homeDataStateNotifiers.notifier).handelAddServiceToCart(id);
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      print(
          "product details after toggle : ${sellerProducts.data?.data?.categories}");
      ref
          .read(getSellerDetailsWithProductStateNotifier.notifier)
          .handleAddProductToWishList(
              res.data?.data?.productId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false,
              res.data?.data?.collectionId);

      ref.read(getProductDetails.notifier).handelAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);

      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);

      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);
    });

    return AppScaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * .28,
          titleSpacing:
              0, // Set spacing between leading and title// Adjust based on your needs
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(
                start: 55, end: 0.0), // Adjust padding around the title
            title: ValueListenableBuilder<bool>(
              valueListenable: appBarTitleVisible,
              builder: (context, value, child) {
                return AnimatedOpacity(
                  opacity: value ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                        height: MediaQuery.of(context).size.height * .07,
                      ),
                      TextWithoutPadding(
                        sellerProducts.data?.data?.name?.ellipsize(20) ?? '',
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      ),
                    ],
                  ),
                );
              },
            ),
            background: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    child: ImageView(
                      initialImg:
                          sellerProducts.data?.data?.coverImagePath ?? "",
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .215,
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.appGrey11
                                    .withOpacity(0.6), // Shadow color
                                blurRadius: .5, // Blur effect
                                spreadRadius: .1, // Spread effect
                                offset: const Offset(0, .5), // Shadow position
                              ),
                            ]),
                        margin:
                            const EdgeInsets.only(right: 16, left: 16,bottom: 12),
                        padding: const EdgeInsetsDirectional.only(
                            top: 16, start: 16, end: 16),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 77,
                                  height: 77,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: ImageView(
                                    initialImg:
                                        sellerProducts.data?.data?.imagePath,
                                    placeHolder: defaultUseIconSvg,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWithoutPadding(
                                      sellerProducts.data?.data?.name
                                              ?.ellipsize(28) ??
                                          "",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w500,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        RatingBar(
                                          initialRating: (sellerProducts
                                                      .data?.data?.overallRating ??
                                                  0)
                                              .toDouble(),
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 11,
                                          ratingWidget: RatingWidget(
                                            full: SVGIcons.localSVG(fullStarSvg),
                                            half:
                                                SVGIcons.localSVG(smallHalfStarSvg),
                                            empty: SVGIcons.localSVG(
                                                smallStarEmptySvg),
                                          ),
                                          itemPadding:
                                              EdgeInsets.symmetric(horizontal: 1.0),
                                          onRatingUpdate: (rating) {},
                                          ignoreGestures: true,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        TextWithoutPadding(
                                          "${sellerProducts.data?.data?.overallRating ?? 0}",
                                          style: AppTheme
                                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        TextWithoutPadding(
                                          "(${sellerProducts.data?.data?.ratingsCount ?? 0})",
                                          style: AppTheme
                                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showReviewsBottomSheet();
                                      },
                                      child: Row(
                                        children: [
                                          SVGIcons.localSVG(reviewsIcon,
                                              width: 13, height: 15),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          TextWithoutPadding(
                                            "Reviews (${(sellerProducts.data?.data?.ratingsCount ?? 0)})",
                                            style: AppTheme
                                                .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                                .copyWith(
                                                    decoration:
                                                        TextDecoration.underline),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                TextWithoutPadding(
                                  (sellerProducts.data?.data?.bio ?? "")
                                      .ellipsize(30),
                                  style: AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                ),
                                (sellerProducts.data?.data?.bio?.length ?? 0) > 30
                                    ? InkWell(
                                        onTap: () {
                                          showAllDescriptionBottomSheet();
                                        },
                                        child: TextWithoutPadding(
                                          "See more",
                                          style: AppTheme
                                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                              .copyWith(
                                                  decoration:
                                                      TextDecoration.underline),
                                        ))
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ValueListenableBuilder(
                              valueListenable: activeTabIndex,
                              builder: (context, value, child) {
                                return sellerProducts.state == DataState.SUCCESS &&
                                        sellerServices.state == DataState.SUCCESS
                                    ? TabBar(
                                        indicatorWeight: 1,
                                        labelColor: Colors.transparent,
                                        unselectedLabelColor: Colors.transparent,
                                        indicatorPadding: EdgeInsets.zero,
                                        indicatorColor: AppTheme.appRedColor,
                                        tabs: [
                                          if (sellerProducts.data?.data?.categories
                                                  ?.isNotEmpty ==
                                              true)
                                            Tab(
                                              child: TextWithoutPadding(
                                                context.tr(productsKey),
                                                style: value == 0
                                                    ? AppTheme
                                                        .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                                    : AppTheme
                                                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                                        .copyWith(
                                                            color:
                                                                AppTheme.appGrey19),
                                              ),
                                            ),
                                          if (sellerServices.data?.data?.categories
                                                  ?.isNotEmpty ==
                                              true)
                                            Tab(
                                              child: TextWithoutPadding(
                                                context.tr(servicesKey),
                                                style: (sellerProducts
                                                                .data
                                                                ?.data
                                                                ?.categories
                                                                ?.isNotEmpty ==
                                                            false
                                                        ? value == 0
                                                        : value == 1)
                                                    ? AppTheme
                                                        .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                                    : AppTheme
                                                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                                        .copyWith(
                                                            color:
                                                                AppTheme.appGrey19),
                                              ),
                                            ),
                                        ],
                                        controller: tabController,
                                      )
                                    : SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: SVGIcons.localSVG(backWithDarkBackgroundIcon,
                  width: 20, height: 20, fit: BoxFit.scaleDown)),
        ),
        ValueListenableBuilder<int>(
          valueListenable: activeTabIndex,
          builder: (context, value, child) {
            return value == 0 &&
                    sellerProducts.data?.data?.categories?.isNotEmpty == true
                ? Consumer(builder: (context, ref, child) {
                    if (sellerProducts.state == DataState.SUCCESS) {
                      categoryForProductTabController = TabController(
                          length:
                              sellerProducts.data!.data!.categories?.length ??
                                  0,
                          vsync: this);
                      productCategoryTabs =
                          sellerProducts.data!.data!.categories!
                              .map((e) => Tab(
                                      child: TextWithoutPadding(
                                    e.name ?? "",
                                    style: AppTheme
                                        .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                                  )))
                              .toList();
                      return SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverTabBarDelegate(
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showCategoriesBottomSheet(
                                      FilterScreenTypes.Products);
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 12.0, end: 6),
                                  child: SVGIcons.localSVG(categoryMenuIcon,
                                      width: 24, height: 24),
                                ),
                              ),
                              Expanded(
                                child: TabBar(
                                  isScrollable: true,
                                  onTap: (index) {
                                    scrollToCategory(
                                        index, FilterScreenTypes.Products);
                                    // categoryTabController?.animateTo(index);
                                  },
                                  controller: categoryForProductTabController,
                                  tabs: [...productCategoryTabs],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return SliverToBoxAdapter(child: SizedBox());
                  })
                : SliverToBoxAdapter(
                    child: SizedBox(),
                  );
          },
        ),
        ValueListenableBuilder<int>(
            valueListenable: activeTabIndex,
            builder: (context, value, child) {
              return value == 1 &&
                      sellerProducts.data?.data?.categories?.isNotEmpty == true
                  ? Consumer(builder: (context, ref, child) {
                      if (sellerServices.state == DataState.SUCCESS) {
                        categoryForServiceTabController = TabController(
                            length:
                                sellerServices.data!.data!.categories?.length ??
                                    0,
                            vsync: this);
                        serviceCategoryTabs =
                            sellerServices.data!.data!.categories!
                                .map((e) => Tab(
                                        child: TextWithoutPadding(
                                      e.name ?? "",
                                      style: AppTheme
                                          .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                                    )))
                                .toList();
                        return SliverPersistentHeader(
                          pinned: true,
                          delegate: _SliverTabBarDelegate(
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showCategoriesBottomSheet(
                                        FilterScreenTypes.Services);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 12.0, end: 6),
                                    child: SVGIcons.localSVG(categoryMenuIcon,
                                        width: 24, height: 24),
                                  ),
                                ),
                                Expanded(
                                  child: TabBar(
                                    isScrollable: true,
                                    onTap: (index) {
                                      scrollToCategory(
                                          index, FilterScreenTypes.Services);
                                      // categoryTabController?.animateTo(index);
                                    },
                                    controller: categoryForServiceTabController,
                                    tabs: [...serviceCategoryTabs],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return SliverToBoxAdapter(child: SizedBox());
                    })
                  : SliverToBoxAdapter(
                      child: SizedBox(),
                    );
            }),
        ValueListenableBuilder<int>(
            valueListenable: activeTabIndex,
            builder: (context, value, child) {
              return value == 0 &&
                      sellerProducts.data?.data?.categories?.isNotEmpty == true
                  ? Consumer(builder: (context, ref, child) {
                      if (_categoryForProductKeys.isEmpty &&
                          sellerProducts.data?.data?.categories != null) {
                        _categoryForProductKeys = sellerProducts
                            .data!.data!.categories!
                            .map((e) => GlobalKey())
                            .toList();
                      }
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            children: List.generate(
                              sellerProducts.state == DataState.LOADING
                                  ? 5
                                  : sellerProducts
                                          .data?.data?.categories?.length ??
                                      0,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 0),
                                child: ProductGridListviewWithCategoryName(
                                  showSeeMore: false,
                                  key: sellerProducts.state == DataState.LOADING
                                      ? GlobalKey()
                                      : _categoryForProductKeys[index],
                                  title: sellerProducts
                                          .data?.data?.categories?[index].name ??
                                      "",
                                  rootId: sellerProducts
                                      .data?.data?.categories?[index].id
                                      ?.toInt(),
                                  list: sellerProducts.state == DataState.LOADING
                                      ? [
                                          ProviderProduct(),
                                          ProviderProduct(),
                                          ProviderProduct(),
                                          ProviderProduct(),
                                          ProviderProduct(),
                                        ]
                                      : sellerProducts.data?.data
                                              ?.categories?[index].products ??
                                          [],
                                  showLoading:
                                      sellerProducts.state == DataState.LOADING,
                                  onAddItemToCart: (id) => addProductToCart(id),
                                  onAddItemToWishList:
                                      (id, collectionId, inWishlist) {
                                    if (client != null) {
                                      if (inWishlist) {
                                        productWishlistToggle(id);
                                      }else{
                                        ref.read(handelAddItemToWishListStateNotifier.notifier).addItemToWishList(
                                            itemId: id,
                                            collectionId: int.tryParse(collectionId ?? "0"),
                                            type: OrderItemType.Product);
                                      }
                                    }else
                                    {
                                      showAuthenticated();
                                    }
                                  },
                                  onItemClick: (itemId, itemName, categoryIds) {
                                    navigateToItemDetails(ItemType.Products,
                                        itemId, itemName, categoryIds);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  : Consumer(builder: (context, ref, child) {
                      if (_categoryForServiceKeys.isEmpty &&
                          sellerServices.data?.data?.categories != null) {
                        _categoryForServiceKeys = sellerServices
                            .data!.data!.categories!
                            .map((e) => GlobalKey())
                            .toList();
                      }
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            children: List.generate(
                              sellerServices.state == DataState.LOADING
                                  ? 5
                                  : sellerServices
                                          .data?.data?.categories?.length ??
                                      0,
                              (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 0),
                                  child: ServiceGridListviewWithCategoryName(
                                    showSeeMore: false,
                                    key: sellerServices.state == DataState.LOADING
                                        ? GlobalKey()
                                        : _categoryForServiceKeys[index],
                                    list:
                                        sellerServices.state == DataState.LOADING
                                            ? [
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData(),
                                                ServiceShowData(),
                                              ]
                                            : sellerServices
                                                    .data
                                                    ?.data
                                                    ?.categories?[index]
                                                    .services ??
                                                [],
                                    showLoading:
                                        sellerServices.state == DataState.LOADING,
                                    onItemClick: (itemId, itemName, categoryIds) {
                                      navigateToItemDetails(ItemType.Services,
                                          itemId, itemName, categoryIds);
                                    },
                                    onAddItemToCart: (id) {
                                      addServiceToCart(id);
                                    },
                                    onAddItemToWishList:
                                        (id, collectionId, inWishlist) {
                                      if (client != null) {
                                        if(inWishlist) {
                                          serviceWishlistToggle(id.toString());
                                        }else{
                                          ref.read(handelAddItemToWishListStateNotifier.notifier).addItemToWishList(
                                              itemId: id,
                                              collectionId: int.tryParse(collectionId ?? "0"),
                                              type: OrderItemType.Service);
                                        }
                                      } else {
                                        showAuthenticated();
                                      }
                                    },
                                    title: sellerServices.data?.data
                                            ?.categories?[index].name ??
                                        "",
                                    rootId: sellerServices
                                            .data?.data?.categories?[index].id
                                            ?.toInt() ??
                                        0,
                                  )),
                            ),
                          ),
                        ),
                      );
                    });
            }),
      ]),
    );
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

  void scrollToProductCategory(int index) {
    final RenderBox renderBox = _categoryForProductKeys[index]
        .currentContext
        ?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());
    final offset = position.dy + _scrollController.offset - 130;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void scrollToServiceCategory(int index) {
    final RenderBox renderBox = _categoryForServiceKeys[index]
        .currentContext
        ?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());
    final offset = position.dy + _scrollController.offset - 130;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
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

  void navigateToItemDetails(ItemType itemType, int itemId, String itemName,
      List<int> categoriesIds) async {
    var updateData = await context
        .push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    }) as UpdateDataModel?;
    if (updateData != null && updateData.updateNormalData == true) {
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
              onSignUpClicked: () {
                navigateToSignUp();
              },
            ));
  }

  void navigateToSignUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.ViewMode});
  }

  void showReviewsBottomSheet() {
    print(
        "${ref.watch(getSellerDetailsWithReviewsStateNotifier).data?.data?.name}");
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => RatingBottomSheet(
              providerRatingsList: ref
                      .watch(getSellerDetailsWithReviewsStateNotifier)
                      .data
                      ?.data
                      ?.ratings ??
                  [],
              type: FilterScreenTypes.Sellers,
            ));
  }

  void showCategoriesBottomSheet(FilterScreenTypes type) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => CategoriesBottomSheet(
              categories: type == FilterScreenTypes.Products
                  ? ref
                          .watch(getSellerDetailsWithProductStateNotifier)
                          .data
                          ?.data
                          ?.categories ??
                      []
                  : ref
                      .watch(getSellerDetailsWithServicesStateNotifier)
                      .data
                      ?.data
                      ?.categories,
              type: type,
              initSelected: type == FilterScreenTypes.Products
                  ? categoryForProductTabController?.index ?? 0
                  : categoryForServiceTabController?.index ?? 0,
              onSelected: (index) {
                scrollToCategory(index, type);
              },
            ));
  }

  void navigateToLogin() async {
    var makeRefresh =
        await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if (makeRefresh == true) {
      getProducts();
      getServices();
    }
  }

  void getReviews() {
    ref
        .read(getSellerDetailsWithReviewsStateNotifier.notifier)
        .getSellerDetails(providerId: widget.sellerId);
  }

  void handleProductScroll() {
    for (int i = 0; i < _categoryForProductKeys.length; i++) {
      final keyContext = _categoryForProductKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final position =
            box.localToGlobal(Offset.zero); // مكان الكاتيجوري على الشاشة

        double y = position.dy;

        if (y <= 160 && y >= -box.size.height / 2) {
          if (activeCategoryForProductTabIndex != i) {
            activeCategoryForProductTabIndex = i;
          }
          categoryForProductTabController
              ?.animateTo(activeCategoryForProductTabIndex);
          break;
        }
      }
    }
  }

  void handleServiceScroll() {
    for (int i = 0; i < _categoryForServiceKeys.length; i++) {
      final keyContext = _categoryForServiceKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final position =
            box.localToGlobal(Offset.zero); // مكان الكاتيجوري على الشاشة

        double y = position.dy;

        if (y <= 160 && y >= -box.size.height / 2) {
          if (activeCategoryTabForServiceIndex != i) {
            activeCategoryTabForServiceIndex = i;
          }
          categoryForServiceTabController
              ?.animateTo(activeCategoryTabForServiceIndex);
          break;
        }
      }
    }
  }

  void showAllDescriptionBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => DescriptionBottomSheet(
              description: ref
                      .watch(getSellerDetailsWithProductStateNotifier)
                      .data
                      ?.data
                      ?.bio ??
                  "",
            ));
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: tabBar,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2), // Shadow color
          blurRadius: .9, // Blur effect
          spreadRadius: .1, // Spread effect
          offset: const Offset(0, .5), // Shadow position
        )
      ]),
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}
