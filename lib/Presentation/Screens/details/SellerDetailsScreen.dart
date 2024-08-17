import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/SliderView.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';

import '../../Widgets/CircleImage.dart';
import '../../Widgets/SvgIcons.dart';

class SellerDetailsScreen extends StatefulWidget {
  final int sellerId;
  const SellerDetailsScreen({super.key, required this.sellerId});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen>
    with SingleTickerProviderStateMixin{
  late TabController tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(
        length:  3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverToBoxAdapter(
            child: Column(
              children: [
                SliderView(
                    images: [
                      "https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww",
                      "https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww"
                    ],
                    withIndicator: true,
                    height: 206,
                    width: double.infinity,
                    showLoading: false),
                SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageView(
                        isCircle: true,
                        initialImg:
                        "https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww"),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Name",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts18w700,
                        ),
                        SizedBox(
                          height:8,
                        ),
                        Row(
                          children: [
                            SVGIcons.smallStarIcon(),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "5",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(500)",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400,
                            )
                          ],
                        ),

                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ExpandedText(textValue: "A bouquet of pink lilies is a collection of delicate and fragrant flowers that are bound together to create a stunning floral arrangement. Pink lilies ar... Read More", textStyle: AppTheme.styleWithTextAppGrey15AdelleSansExtendedFonts14w400.copyWith(height: 1.4), maxLength: 150),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          SliverPersistentHeader(delegate: _SliverTabsDelegate(
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
          ),pinned: true,),
          SliverFillRemaining(
            child:Column(
              children: [
                Expanded(child: Center(
                  child: Text("aklsdf"),
                ))
                // Expanded(
                //     child: TabBarView(
                //       controller: tabController,
                //       children: [
                //         productsState.state == DataState.EMPTY
                //             ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                //           icon: SVGIcons.searchGifIcon(),
                //           title: "No Data Found",
                //           description:
                //           "Please refine your search using common words to get accurate results",
                //         )
                //             : DataListView<ProviderProduct>(
                //             dataList: productsState.data?.data?.products?.data ??
                //                 (productsState.state == DataState.LOADING
                //                     ? [
                //                   ...List.generate(
                //                       5, (index) => ProviderProduct())
                //                 ]
                //                     : []),
                //             paginated: true,
                //             pageLoading:
                //             productsState.state == DataState.MORE_LOADING,
                //             onBottomReached: () {
                //               fetchProducts(++currentPageForProducts);
                //             },
                //             builder: (item) => Skeletonizer(
                //               enabled: productsState.state == DataState.LOADING,
                //               child: Padding(
                //                 padding: EdgeInsetsDirectional.symmetric(
                //                     horizontal: 16, vertical: 6),
                //                 child: ServiceAndProductItemCardHorizontal(
                //                   type: ItemType.Products,
                //                   product: item,
                //                   onAddItemToCart: (id) {
                //                     // widget.onAddItemToCart.call(id);
                //                   },
                //                   onAddItemToWishList: (id) {
                //                     // widget.onAddItemToWishList.call(id);
                //                   },
                //                   onItemClick: (id,name,categoriesIds) {
                //                     navigateToItemDetails(ItemType.Products, id, name, categoriesIds);
                //                   },
                //                 ),
                //               ),
                //             )),
                //         servicesState.state == DataState.EMPTY
                //             ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                //           icon: SVGIcons.searchGifIcon(),
                //           title: "No Data Found",
                //           description:
                //           "Please refine your search using common words to get accurate results",
                //         )
                //             : DataListView<ServiceShowData>(
                //             dataList: servicesState.data?.data?.services?.data ??
                //                 (servicesState.state == DataState.LOADING
                //                     ? [
                //                   ...List.generate(
                //                       5, (index) => ServiceShowData())
                //                 ]
                //                     : []),
                //             paginated: true,
                //             pageLoading:
                //             servicesState.state == DataState.MORE_LOADING,
                //             onBottomReached: () {
                //               if (currentPageForServices <
                //                   (servicesState.data?.data?.services?.lastPage ??
                //                       0)) {
                //                 fetchServices(++currentPageForServices);
                //               }
                //             },
                //             builder: (item) => Skeletonizer(
                //               enabled: servicesState.state == DataState.LOADING,
                //               child: Padding(
                //                 padding: EdgeInsetsDirectional.symmetric(
                //                     horizontal: 16, vertical: 6),
                //                 child: ServiceAndProductItemCardHorizontal(
                //                   service: item,
                //                   type: ItemType.Services,
                //                   onAddItemToCart: (id) {
                //                     // widget.onAddItemToCart.call(id);
                //                   },
                //                   onAddItemToWishList: (id) {
                //                     // widget.onAddItemToWishList.call(id);
                //                   },
                //                   onItemClick: (id,name,categoriesIds) {
                //                     navigateToItemDetails(ItemType.Services, id, name, categoriesIds);
                //                   },
                //                 ),
                //               ),
                //             )),
                //         if (widget.type == CategoryType.Search)
                //           sellersState.state == DataState.EMPTY
                //               ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                //             icon: SVGIcons.searchGifIcon(),
                //             title: "No Data Found",
                //             description:
                //             "Please refine your search using common words to get accurate results",
                //           )
                //               : DataListView<ProviderData>(
                //               dataList: sellersState.data?.data?.data ??
                //                   (sellersState.state == DataState.LOADING
                //                       ? [
                //                     ...List.generate(
                //                         5, (index) => ProviderData())
                //                   ]
                //                       : []),
                //               paginated: true,
                //               pageLoading:
                //               sellersState.state == DataState.MORE_LOADING,
                //               onBottomReached: () {
                //                 if (currentPageForSellers <
                //                     (sellersState.data?.data?.lastPage ?? 0)) {
                //                   fetchSellers(++currentPageForSellers);
                //                 }
                //               },
                //               builder: (item) => Skeletonizer(
                //                 enabled:
                //                 sellersState.state == DataState.LOADING,
                //                 child: Padding(
                //                   padding: EdgeInsetsDirectional.symmetric(
                //                       horizontal: 16, vertical: 6),
                //                   child: SellerItemCard(providerData: item),
                //                 ),
                //               )),
                //       ],
                //     ))
              ],
            ),
          )
          ,
        ]

      ),
    );
  }
}


class _SliverTabsDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabsDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 35.0), // Adjust the space above the TabBar
        child: _tabBar,
      ),
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height + 35.0; // Add space above the TabBar

  @override
  double get minExtent => _tabBar.preferredSize.height + 35.0; // Add space above the TabBar

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return _tabBar != (oldDelegate as _SliverTabsDelegate)._tabBar;
  }
}