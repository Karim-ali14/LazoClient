import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/CircleImage.dart';
import '../../Widgets/SvgIcons.dart';

class SellerDetailsScreen3 extends ConsumerStatefulWidget {
  final int sellerId;
  const SellerDetailsScreen3({super.key, required this.sellerId});

  @override
  ConsumerState<SellerDetailsScreen3> createState() =>
      _SellerDetailsScreenState2();
}

class _SellerDetailsScreenState2 extends ConsumerState<SellerDetailsScreen3>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TabController? categoryTabController;
  List<Tab> tabs = [];
  int activeTabIndex = 0;
  int activeCategoryTabIndex = 0;

  late ScrollController _scrollController;
  ScrollController _scrollProductCategoriesController = ScrollController();

  bool _appBarTitleVisible = true;
  bool defaultExpandedValue = false;
  List<GlobalKey> _categoryKeys = []; // List of global keys for each category>
  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Update visibility based on scroll offset
        // setState(() {
        //   _appBarTitleVisible = _scrollController.offset < 280;
        // });

        print("sdfas ${_scrollController.offset}");
        print("sdfas sdfasdf${_categoryKeys.length}");
        for (int i = 0; i < _categoryKeys.length; i++) {
          final keyContext = _categoryKeys[i].currentContext;
          if (keyContext != null) {
            final box = keyContext.findRenderObject() as RenderBox;
            final position =
            box.localToGlobal(Offset.zero); // مكان الكاتيجوري على الشاشة

            double y = position.dy;

            if (y <= 160 && y >= -box.size.height / 2) {
              if (activeCategoryTabIndex != i) {
                activeCategoryTabIndex = i;
              }
              categoryTabController?.animateTo(activeCategoryTabIndex);
              break;
            }
          }
        }
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
    });
    super.initState();
  }

  void scrollToCategory(int index) {
    final RenderBox renderBox = _categoryKeys[index].currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
    final offset = position.dy + _scrollController.offset - 130;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(defaultExpandedValue);
    final client = ref.watch(clientStateProvider);
    final sellerProducts = ref.watch(getSellerDetailsWithProductStateNotifier);

    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * .41,
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
                    child: ImageView(
                      initialImg:
                      sellerProducts.data?.data?.coverImagePath ?? "",
                    ),
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                SizedBox(
                  child: Container(
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
                    margin: EdgeInsets.only(right: 16, left: 16, top: 120),
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
                                Text(
                                  sellerProducts.data?.data?.name
                                      ?.ellipsize(25) ??
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
                                    Text(
                                      "${sellerProducts.data?.data?.overallRating ?? 0}",
                                      style: AppTheme
                                          .styleWithTextBlackColor2AdelleSansExtendedFonts14w400,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
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
                                    // showReviewsBottomSheet();
                                  },
                                  child: Row(
                                    children: [
                                      SVGIcons.localSVG(reviewsIcon,
                                          width: 13, height: 15),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
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
                        ExpandedText(
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
                        SizedBox(
                          height: 8,
                        ),
                        TabBar(
                          indicatorWeight: 1,
                          labelColor: Colors.transparent,
                          unselectedLabelColor: Colors.transparent,
                          indicatorPadding: EdgeInsets.zero,
                          indicatorColor: AppTheme.appRedColor,
                          tabs: [
                            Tab(
                              child: Text(
                                context.tr(productsKey),
                                style: activeTabIndex == 0
                                    ? AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                    .copyWith(color: AppTheme.appGrey19),
                              ),
                            ),
                            Tab(
                              child: Text(
                                context.tr(servicesKey),
                                style: activeTabIndex == 1
                                    ? AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                    .copyWith(color: AppTheme.appGrey19),
                              ),
                            ),
                          ],
                          controller: tabController,
                        ),
                      ],
                    ),
                  ),
                ),
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
        Consumer(builder: (context, ref, child) {
          if (sellerProducts.state == DataState.SUCCESS) {
            categoryTabController = TabController(
                length: sellerProducts.data!.data!.categories?.length ?? 0,
                vsync: this);
            tabs = sellerProducts.data!.data!.categories!
                .map((e) => Tab(text: e.name ?? ""))
                .toList();
            return SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  isScrollable: true,
                  onTap: (index){
                    scrollToCategory(index);
                    // categoryTabController?.animateTo(index);
                  },
                  controller: categoryTabController,
                  tabs: [...tabs],
                ),
              ),
            );
          }
          return SliverToBoxAdapter(child: SizedBox());
        }),
        if(activeTabIndex == 0)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Consumer(builder: (context, ref, child) {
                  if (sellerProducts.state == DataState.SUCCESS) {
                    if (_categoryKeys.isEmpty &&
                        sellerProducts.data?.data?.categories != null) {
                      _categoryKeys = sellerProducts.data!.data!.categories!
                          .map((e) => GlobalKey())
                          .toList();
                    }
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 9),
                        child: ProductGridListviewWithCategoryName(
                          key: _categoryKeys[index],
                          scrollProductCategoriesController:
                          _scrollProductCategoriesController,
                          title: sellerProducts
                              .data?.data?.categories?[index].name ??
                              "",
                          rootId: sellerProducts.data?.data?.categories?[index].id
                              ?.toInt(),
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
                          onAddItemToCart: (id) {},
                          onAddItemToWishList: (id) {},
                          onItemClick: (itemId, itemName, categoryIds) {},
                        ));
                  } else {
                    return SizedBox();
                  }
                });
              },
              childCount: sellerProducts.state == DataState.LOADING
                  ? 5
                  : sellerProducts.data?.data?.categories?.length ?? 0,
            ),
            ),
        if(activeTabIndex == 1)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Consumer(builder: (context, ref, child) {
                  if (sellerProducts.state == DataState.SUCCESS) {
                    if (_categoryKeys.isEmpty &&
                        sellerProducts.data?.data?.categories != null) {
                      _categoryKeys = sellerProducts.data!.data!.categories!
                          .map((e) => GlobalKey())
                          .toList();
                    }
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 9),
                        child: ProductGridListviewWithCategoryName(
                          key: _categoryKeys[index],
                          scrollProductCategoriesController:
                          _scrollProductCategoriesController,
                          title: sellerProducts
                              .data?.data?.categories?[index].name ??
                              "",
                          rootId: sellerProducts.data?.data?.categories?[index].id
                              ?.toInt(),
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
                          onAddItemToCart: (id) {},
                          onAddItemToWishList: (id) {},
                          onItemClick: (itemId, itemName, categoryIds) {},
                        ));
                  } else {
                    return SizedBox();
                  }
                });
              },
              childCount: sellerProducts.state == DataState.LOADING
                  ? 5
                  : sellerProducts.data?.data?.categories?.length ?? 0,
            ),
          ),
      ]),
    );
  }

  void getProducts() {
    ref
        .read(getSellerDetailsWithProductStateNotifier.notifier)
        .getSellerDetails(providerId: widget.sellerId);
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
