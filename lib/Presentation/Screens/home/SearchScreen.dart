import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final String title;
  final CategoryType type;
  final int? id;
  const SearchScreen(
      {required this.title, required this.type, required this.id, super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForProducts = 1;
  var currentPageForServices = 1;
  var currentPageForSellers = 1;

  FilterData? filterForProductData = null;
  FilterData? filterForServicesData = null;
  FilterData? filterForSellersData = null;

  String? searchForProductData = null;
  String? searchForServiceData = null;
  String? searchForSellersData = null;

  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    tabController = TabController(
        length: widget.type == CategoryType.Search ? 3 : 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
        if (activeTabIndex == 0) {
          controller.text = searchForProductData ?? "";
        } else if (activeTabIndex == 1) {
          controller.text = searchForServiceData ?? "";
        } else if (activeTabIndex == 2) {
          controller.text = searchForSellersData ?? "";
        }
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchProducts(currentPageForProducts);
      fetchServices(currentPageForServices);
      if (widget.type == CategoryType.Search) {
        fetchSellers(currentPageForSellers);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    filterForProductData = ref.watch(filterForProductStateNotifiers);

    filterForServicesData = ref.watch(filterForServiceStateNotifiers);

    filterForSellersData = ref.watch(filterForSellerStateNotifiers);
    print("filter data ->${filterForProductData?.categoriesIdsSelected} ${filterForProductData?.occasionsIdsSelected} , ${filterForProductData?.ratingValueSelected} ${filterForProductData?.priceToSelected}");

    final productsState = ref.watch(getProductsStateNotifiers);
    final servicesState = ref.watch(getServicesStateNotifiers);
    final sellersState = ref.watch(getTopSellersDataStateNotifiers);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.title,
        navigated: true,
        isCenter: false,
        customCallBack: (){
          context.pop("Data");
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                controller: controller,
                hasFilter: true,
                onFilterClick: () {
                  openFilterScreen(activeTabIndex);
                },
                delay: 1,
                onTextChangeListener: (value) {
                  if (activeTabIndex == 0) {
                    currentPageForProducts = 1;
                    searchForProductData = value;
                    fetchProducts(currentPageForProducts);
                  } else if (activeTabIndex == 1) {
                    currentPageForServices = 1;
                    searchForServiceData = value;
                    fetchServices(currentPageForServices);
                  } else if (activeTabIndex == 2) {
                    currentPageForSellers = 1;
                    searchForSellersData = value;
                    fetchSellers(currentPageForSellers);
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
                if (widget.type == CategoryType.Search)
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
                        pageLoading: productsState.state == DataState.MORE_LOADING,
                        onBottomReached: () {

                            fetchProducts(++currentPageForProducts);

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
                        pageLoading: servicesState.state == DataState.MORE_LOADING,
                        onBottomReached: () {
                          if (currentPageForServices <
                              (servicesState.data?.data?.services?.lastPage ??
                                  0)) {
                            fetchServices(++currentPageForServices);
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
                if (widget.type == CategoryType.Search)
                  sellersState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ SizedBox()
                      : DataListView<ProviderData>(
                          dataList: sellersState.data?.data?.data ??
                              (sellersState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          5, (index) => ProviderData())
                                    ]
                                  : []),
                          paginated: true,
                          pageLoading: sellersState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            if (currentPageForSellers <
                                (sellersState.data?.data?.lastPage ?? 0)) {
                              fetchSellers(++currentPageForSellers);
                            }
                          },
                          builder: (item) => Skeletonizer(
                                enabled:
                                    sellersState.state == DataState.LOADING,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 16, vertical: 6),
                                  child: SellerItemCard(providerData: item),
                                ),
                              )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  void fetchProducts(int page) {
    ref.read(getProductsStateNotifiers.notifier).getProductsData(
        page: page,
        categoriesIds: widget.type == CategoryType.Categories
                ? [widget.id ?? 0]
                : filterForProductData?.categoriesIdsSelected
            ,
        occasionsIds: widget.type == CategoryType.Occasions
                ? [widget.id ?? 0]
                : filterForProductData?.occasionsIdsSelected
            ,
        ratings: filterForProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        type: ItemType.Products.name.toLowerCase(),
        priceTo: filterForProductData?.priceToSelected.toString(),
        priceFrom: filterForProductData?.priceFromSelected.toString(),
        searchByName: searchForProductData == null ||
                searchForProductData?.isEmpty == true
            ? null
            : searchForProductData);
  }

  void fetchServices(int page) {
    ref.read(getServicesStateNotifiers.notifier).getServicesData(
        page: page,
        categoriesIds: widget.type == CategoryType.Categories ||
                widget.type == CategoryType.Search
            ? widget.type == CategoryType.Categories
                ? [widget.id??0]
                : filterForServicesData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions ||
                widget.type == CategoryType.Search
            ? widget.type == CategoryType.Occasions
                ? [widget.id??0]
                : filterForServicesData?.occasionsIdsSelected
            : null,
        ratings: filterForServicesData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForServicesData?.priceToSelected.toString(),
        priceFrom: filterForServicesData?.priceFromSelected.toString(),
        type: ItemType.Services.name.toLowerCase(),
        searchByName: searchForServiceData == null ||
                searchForServiceData?.isEmpty == true
            ? null
            : searchForServiceData);
  }

  void fetchSellers(int page) {
    ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
        page: page,
        isPromoted: filterForSellersData?.promotionSelected,
        categoriesIds: widget.type == CategoryType.Categories
            ? filterForSellersData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions
            ? filterForSellersData?.occasionsIdsSelected
            : null,
        ratings: filterForSellersData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        searchByName: searchForSellersData == null ||
                searchForSellersData?.isEmpty == true
            ? null
            : searchForSellersData);
  }

  void openFilterScreen(int activeTabIndex) async{
    switch (activeTabIndex) {
      case 0:
        {
          var filterData = await context.push(R_FilterScreen,
              extra: {"type": FilterScreenTypes.Products,"searchValue" : controller.text,"occasionId":widget.id});
          currentPageForProducts = 1;
          filterForProductData = filterData as FilterData;
          fetchProducts(currentPageForServices);
        }
        break;
      case 1:
        {
          var filterData = await context.push(R_FilterScreen,
              extra: {"type": FilterScreenTypes.Services});
          currentPageForServices = 1;
          filterForServicesData = filterData as FilterData;
          fetchServices(currentPageForServices);
        }
        break;
      case 2:
        {
          var filterData = await context
              .push(R_FilterScreen, extra: {"type": FilterScreenTypes.Sellers});
          currentPageForSellers = 1;
          filterForSellersData = filterData as FilterData;
          fetchSellers(currentPageForSellers);
        }
        break;
    }
  }

}
