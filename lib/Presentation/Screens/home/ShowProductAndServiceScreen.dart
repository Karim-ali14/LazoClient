import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Eunms.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';

class ShowProductAndServiceScreen extends ConsumerStatefulWidget {
  final String title;
  final CategoryType type;
  final int id;
  const ShowProductAndServiceScreen(this.title, this.type, this.id,
      {super.key});

  @override
  ConsumerState<ShowProductAndServiceScreen> createState() =>
      _ShowProductAndServiceScreenState();
}

class _ShowProductAndServiceScreenState
    extends ConsumerState<ShowProductAndServiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForProducts = 1;
  var currentPageForServices = 1;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getProductsStateNotifiers.notifier).getProductsData(
          page: currentPageForProducts,
          type: ItemType.Products.name.toLowerCase());
      ref.read(getServicesStateNotifiers.notifier).getServicesData(
          page: currentPageForServices,
          type: ItemType.Services.name.toLowerCase());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(getProductsStateNotifiers);
    final servicesState = ref.watch(getServicesStateNotifiers);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.title,
        navigated: true,
        isCenter: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                hasFilter: true,
                onFilterClick: () {},
                delay: 1,
                onTextChangeListener: (value) {
                  if(activeTabIndex == 0){
                    currentPageForProducts = 1;
                    ref.read(getProductsStateNotifiers.notifier).getProductsData(
                        page: currentPageForProducts,
                        type: ItemType.Products.name.toLowerCase(),
                        searchByName: value.isNotEmpty ? value : null);
                  }else {
                    currentPageForServices = 1;
                    ref.read(getServicesStateNotifiers.notifier)
                        .getServicesData(
                        page: currentPageForServices,
                        type: ItemType.Services.name.toLowerCase(),
                        searchByName: value.isNotEmpty ? value : null);
                  }
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TabBar(
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsetsDirectional.only(end: 0),
              physics: const ClampingScrollPhysics(),
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Tab(
                    child: Container(
                      // width: 150,
                      // height: 40,
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
                      // width: 150,
                      // height: 40,
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
                )
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
                productsState.state == DataState.EMPTY
                    ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ SizedBox()
                    : DataListView<ProviderProduct>(
                        dataList: productsState.data?.data?.products?.data ??
                            (productsState.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderProduct())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForProducts <
                            (productsState.data?.data?.products?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForProducts <
                              (productsState.data?.data?.products?.lastPage ??
                                  0)) {
                            ref
                                .read(getProductsStateNotifiers.notifier)
                                .getProductsData(
                                    page: ++currentPageForProducts,
                                    type: ItemType.Products.name.toLowerCase());
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: productsState.state == DataState.LOADING,
                              child: Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 16, vertical: 6),
                                child: ServiceAndProductItemCardHorizontal(
                                  type: ItemType.Products,
                                  product: item,
                                  onAddItemToCart: (id) {
                                    // widget.onAddItemToCart.call(id);
                                  },
                                  onAddItemToWishList: (id) {
                                    // widget.onAddItemToWishList.call(id);
                                  },
                                  onItemClick: (id) {
                                    // widget.itemClick.call(id);
                                  },
                                ),
                              ),
                            )),
                servicesState.state == DataState.EMPTY
                    ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ SizedBox()
                    : DataListView<ServiceShowData>(
                        dataList: servicesState.data?.data?.services?.data ??
                            (servicesState.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ServiceShowData())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForServices <
                            (servicesState.data?.data?.services?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForServices <
                              (servicesState.data?.data?.services?.lastPage ??
                                  0)) {
                            ref
                                .read(getServicesStateNotifiers.notifier)
                                .getServicesData(
                                    page: ++currentPageForServices,
                                    type: ItemType.Services.name.toLowerCase());
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: servicesState.state == DataState.LOADING,
                              child: Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 16, vertical: 6),
                                child: ServiceAndProductItemCardHorizontal(
                                  service: item,
                                  type: ItemType.Services,
                                  onAddItemToCart: (id) {
                                    // widget.onAddItemToCart.call(id);
                                  },
                                  onAddItemToWishList: (id) {
                                    // widget.onAddItemToWishList.call(id);
                                  },
                                  onItemClick: (id) {
                                    // widget.itemClick.call(id);
                                  },
                                ),
                              ),
                            )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
