import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/SliderView.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopProductListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopServiceListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Constants.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/CircleImage.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
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
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Update visibility based on scroll offset
        setState(() {
          print(_scrollController.offset);
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
      ref
          .read(getSellerDetailsWithProductStateNotifier.notifier)
          .getSellerDetails(providerId: widget.sellerId);
      ref
          .read(getSellerDetailsWithServicesStateNotifier.notifier)
          .getSellerDetails(providerId: widget.sellerId);
      ref
          .read(getSellerDetailsWithReviewsStateNotifier.notifier)
          .getSellerDetails(providerId: widget.sellerId); // to get reviews
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sellerProducts = ref.watch(getSellerDetailsWithProductStateNotifier);
    final sellerServices = ref.watch(getSellerDetailsWithServicesStateNotifier);
    final sellerReview = ref.watch(getSellerDetailsWithReviewsStateNotifier);



    return Scaffold(
      body: CustomScrollView(
          controller: _scrollController,
          slivers: [
        SliverAppBar(
        expandedHeight: 250, titleSpacing: 0, // Set spacing between leading and title// Adjust based on your needs
        pinned: true,
          floating: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(start: 55, end: 0.0), // Adjust padding around the title
            title: AnimatedOpacity(
              opacity: _appBarTitleVisible ? 0.0 : 1.0, // Fade in/out based on scroll
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
                      sellerProducts.data?.data?.name ?? "Store Name",
                      style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                    ),
                  ],
                ),
              )

            ),
          background: Stack(
            children: [
              Positioned(
                child:
                SizedBox(
                  child: Image.network(
                    sellerProducts.data?.data?.coverImagePath ?? "",
                    fit: BoxFit.cover,
                  ),
                  width: double.infinity,
                  height: 206,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageView(
                            isCircle: true,
                            initialImg: sellerProducts.data?.data?.imagePath),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sellerProducts.data?.data?.name ??"",
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
              ),
            ],
          ),
        ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: _appBarTitleVisible ? Colors.white : Colors.black,),
            onPressed: () {
              Navigator.of(context).pop(); // Go back to the previous screen
            },
          ),
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
                          "Products",
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
                          "Sellers",
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
        SliverFillRemaining(
          child: Column(
            children: [
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: [
                  sellerProducts.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.searchGifIcon(),
                          title: "No Data Found",
                          description:
                              "Please refine your search using common words to get accurate results",
                        )
                      : ListView.builder(
                          itemCount: sellerProducts.state == DataState.LOADING
                              ? 5
                              : sellerProducts.data?.data?.categories?.length ??
                                  0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 9),
                              child: HorizontalTopProductListViewWithTitleSeeAll(
                                list:  sellerProducts.state == DataState.LOADING ? [
                                  ProviderProduct(),
                                  ProviderProduct(),
                                  ProviderProduct(),
                                  ProviderProduct(),
                                ] :
                                sellerProducts.data?.data
                                        ?.categories?[index].products ??
                                    [],
                                showLoading:
                                    sellerProducts.state == DataState.LOADING,
                                itemClick: (itemId, itemName, categoryIds) {
                                  navigateToItemDetails(ItemType.Products, itemId,
                                      itemName, categoryIds);
                                },
                                onAddItemToCart: (int) {},
                                onAddItemToWishList: (int) {},
                                onSeeAllClickListener: () {
                                  // navigateToSeeAllBestProductAndService(
                                  //     "Best Products", ItemType.Products);
                                },
                                itemWidth: 163, title: sellerProducts.data?.data
                                  ?.categories?[index].name ??"",
                              ),
                            );
                          }),
                  sellerServices.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.searchGifIcon(),
                          title: "No Data Found",
                          description:
                              "Please refine your search using common words to get accurate results",
                        )
                      : ListView.builder(
                          itemCount: sellerServices.state == DataState.LOADING
                              ? 5
                              : sellerServices.data?.data?.categories?.length ??
                                  0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 9),
                              child: HorizontalTopServiceListViewWithTitleSeeAll(
                                list:  sellerServices.state == DataState.LOADING ? [
                                  ServiceShowData(),
                                  ServiceShowData(),
                                  ServiceShowData(),
                                  ServiceShowData(),
                                  ServiceShowData(),
                                ] :
                                sellerServices.data?.data
                                        ?.categories?[index].services ??
                                    [],
                                showLoading:
                                    sellerServices.state == DataState.LOADING,
                                itemClick: (itemId, itemName, categoryIds) {
                                  navigateToItemDetails(ItemType.Services, itemId,
                                      itemName, categoryIds);
                                },
                                onAddItemToCart: (int) {},
                                onAddItemToWishList: (int) {},
                                onSeeAllClickListener: () {
                                  // navigateToSeeAllBestProductAndService(
                                  //     "Best Products", ItemType.Products);
                                },
                                itemWidth: 163, title: sellerServices.data?.data
                                  ?.categories?[index].name ??"",
                              ),
                            );
                          }),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
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
                                          "Based on ${sellerReview.data?.data?.ratingsCount ?? 0} ratings",
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
                          SizedBox(
                            height: 16,
                          ),
                          ...(List.generate(
                              sellerReview.data?.data?.reviews?.length ?? 0,
                                  (index) => Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                    vertical: 8),
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
                                            "${sellerReview.data?.data?.reviews?[index].userName}",
                                            style: AppTheme
                                                .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                                          ),
                                          Spacer(),
                                          Text(
                                            sellerReview
                                                .data
                                                ?.data
                                                ?.reviews?[index]
                                                .date
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
                                            "${sellerReview.data?.data?.reviews?[index].rating ?? 0}",
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
                                        "${sellerReview.data?.data?.reviews?[index].ratingComment ?? 0}",
                                        textStyle: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts14w500
                                            .copyWith(height: 1.5),
                                        maxLength: 70,
                                        showLessText: "Read Less",
                                        showMoreText: "Read More",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // servicesState.state == DataState.EMPTY
                  //     ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                  //   icon: SVGIcons.searchGifIcon(),
                  //   title: "No Data Found",
                  //   description:
                  //   "Please refine your search using common words to get accurate results",
                  // )
                  //     : DataListView<ServiceShowData>(
                  //     dataList: servicesState.data?.data?.services?.data ??
                  //         (servicesState.state == DataState.LOADING
                  //             ? [
                  //           ...List.generate(
                  //               5, (index) => ServiceShowData())
                  //         ]
                  //             : []),
                  //     paginated: true,
                  //     pageLoading:
                  //     servicesState.state == DataState.MORE_LOADING,
                  //     onBottomReached: () {
                  //       if (currentPageForServices <
                  //           (servicesState.data?.data?.services?.lastPage ??
                  //               0)) {
                  //         fetchServices(++currentPageForServices);
                  //       }
                  //     },
                  //     builder: (item) => Skeletonizer(
                  //       enabled: servicesState.state == DataState.LOADING,
                  //       child: Padding(
                  //         padding: EdgeInsetsDirectional.symmetric(
                  //             horizontal: 16, vertical: 6),
                  //         child: ServiceAndProductItemCardHorizontal(
                  //           service: item,
                  //           type: ItemType.Services,
                  //           onAddItemToCart: (id) {
                  //             // widget.onAddItemToCart.call(id);
                  //           },
                  //           onAddItemToWishList: (id) {
                  //             // widget.onAddItemToWishList.call(id);
                  //           },
                  //           onItemClick: (id,name,categoriesIds) {
                  //             navigateToItemDetails(ItemType.Services, id, name, categoriesIds);
                  //           },
                  //         ),
                  //       ),
                  //     )),
                  // if (widget.type == CategoryType.Search)
                  //   sellersState.state == DataState.EMPTY
                  //       ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                  //     icon: SVGIcons.searchGifIcon(),
                  //     title: "No Data Found",
                  //     description:
                  //     "Please refine your search using common words to get accurate results",
                  //   )
                  //       : DataListView<ProviderData>(
                  //       dataList: sellersState.data?.data?.data ??
                  //           (sellersState.state == DataState.LOADING
                  //               ? [
                  //             ...List.generate(
                  //                 5, (index) => ProviderData())
                  //           ]
                  //               : []),
                  //       paginated: true,
                  //       pageLoading:
                  //       sellersState.state == DataState.MORE_LOADING,
                  //       onBottomReached: () {
                  //         if (currentPageForSellers <
                  //             (sellersState.data?.data?.lastPage ?? 0)) {
                  //           fetchSellers(++currentPageForSellers);
                  //         }
                  //       },
                  //       builder: (item) => Skeletonizer(
                  //         enabled:
                  //         sellersState.state == DataState.LOADING,
                  //         child: Padding(
                  //           padding: EdgeInsetsDirectional.symmetric(
                  //               horizontal: 16, vertical: 6),
                  //           child: SellerItemCard(providerData: item),
                  //         ),
                  //       )),
                ],
              ))
            ],
          ),
        ),
      ]),
    );
  }

  void navigateToItemDetails(
      ItemType itemType, int itemId, String itemName, List<int> categoriesIds) {
    context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    });
  }
}

class _SliverTabsDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  final double paddingTop = 15;
  _SliverTabsDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            top: paddingTop), // Adjust the space above the TabBar
        child: _tabBar,
      ),
    );
  }

  @override
  double get maxExtent =>
      _tabBar.preferredSize.height + paddingTop; // Add space above the TabBar

  @override
  double get minExtent =>
      _tabBar.preferredSize.height + paddingTop; // Add space above the TabBar

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return _tabBar != (oldDelegate as _SliverTabsDelegate)._tabBar;
  }
}
