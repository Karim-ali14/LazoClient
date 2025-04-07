import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Models/UpdateDataModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/BottomSheets/FilterBottomSheet.dart';
import 'package:lazo_client/Presentation/Screens/search/ProductSearchScreen.dart';
import 'package:lazo_client/Presentation/Screens/search/SellerSearchScreen.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Utils/SearchStorage.dart';
import 'package:lazo_client/main.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/ItemSelector.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/FilterUtils.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/SearchLocalStoragStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import 'ServiceSearchScreen.dart';

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
         updateNumberOfSelectedItems(filterForProductData);
        } else if (activeTabIndex == 1) {
          controller.text = searchForServiceData ?? "";
          updateNumberOfSelectedItems(filterForServicesData);
        } else if (activeTabIndex == 2) {
          controller.text = searchForSellersData ?? "";
          updateNumberOfSelectedItems(filterForSellersData);
        }
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // fetchProducts(currentPageForProducts);
      // fetchServices(currentPageForServices);
      // if (widget.type == CategoryType.Search) {
      //   fetchSellers(currentPageForSellers);
      // }
    });
    super.initState();
  }

  void clearFilterData(){
    ref.read(filterNumberCountStateNotifiers.notifier).updateNumber(number: 0);
    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
  }

  Future<bool> _onWillPop() async {
    // Your custom logic here
    print('Back button pressed! ${ref.watch(filterNumberCountStateNotifiers)}');
    clearFilterData();
    print('Back button pressed! ${ref.watch(filterNumberCountStateNotifiers)}');
    context.pop(false);
    return false; // Return true to allow the pop action, false to prevent it
  }

  @override
  Widget build(BuildContext context) {
    filterForProductData = ref.watch(filterForProductStateNotifiers);
    filterForServicesData = ref.watch(filterForServiceStateNotifiers);
    filterForSellersData = ref.watch(filterForSellerStateNotifiers);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  AppSearchBarWithFilter(
                    controller: controller,
                    prefixIcon: InkWell(
                        onTap: () {
                          clearFilterData();
                          context.pop();
                        },
                        child: SVGIcons.backArrowIcon()),
                    hasFilter: true,
                    numberOfFilterItems: ref.watch(filterNumberCountStateNotifiers),
                    onFilterClick: () {
                      openFilterBottomSheet();
                    },
                    delay: 1,
                    onTextChangeListener: (value) {
                      if (activeTabIndex == 0) {
                        currentPageForProducts = 1;
                        searchForProductData = value;
                        if(value.isNotEmpty || getNumberOfFilterItems(filterForProductData) > 0) {
                          fetchProducts(currentPageForProducts);
                        }
                        if (value.isNotEmpty) {
                          SearchStorage.saveSearch(
                              key: SearchStorage.product_key, query: value);
                        }
                        else {
                          ref
                              .read(productSearchLocalStorageStateNotifier.notifier)
                              .updateList(
                                  prefs.getStringList(SearchStorage.product_key) ??
                                      []);
                        }
                      }
                      else if (activeTabIndex == 1) {
                        currentPageForServices = 1;
                        searchForServiceData = value;
                        if(value.isNotEmpty || getNumberOfFilterItems(filterForServicesData) > 0) {
                          fetchServices(currentPageForServices);
                        }
                        if (value.isNotEmpty) {
                          SearchStorage.saveSearch(
                              key: SearchStorage.service_key, query: value);
                        } else {
                          ref
                              .read(serviceSearchLocalStorageStateNotifier.notifier)
                              .updateList(
                                  prefs.getStringList(SearchStorage.service_key) ??
                                      []);
                        }
                      }
                      else if (activeTabIndex == 2) {
                        currentPageForSellers = 1;
                        searchForSellersData = value;
                        if(value.isNotEmpty || getNumberOfFilterItems(filterForSellersData) > 0) {
                          fetchSellers(currentPageForSellers);
                        }
                        if (value.isNotEmpty) {
                          SearchStorage.saveSearch(
                              key: SearchStorage.seller_key, query: value);
                        } else {
                          ref
                              .read(sellerSearchLocalStorageStateNotifier.notifier)
                              .updateList(
                                  prefs.getStringList(SearchStorage.seller_key) ??
                                      []);
                        }
                      }
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: AppTheme.appGrey8.withOpacity(0.6), // Shadow color
                        blurRadius: .5, // Blur effect
                        spreadRadius: .1, // Spread effect
                        offset: const Offset(0, .5), // Shadow position
                      ),
                    ]),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorColor: AppTheme.appRedColor,
                      tabs: [
                        Tab(
                            child: Text("Products",
                                style: activeTabIndex == 0
                                    ? AppTheme
                                        .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400)),
                        Tab(
                          child: Text("Services",
                              style: activeTabIndex == 1
                                  ? AppTheme
                                      .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                  : AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                        ),
                        if (widget.type == CategoryType.Search)
                          Tab(
                            child: Text("Sellers",
                                style: activeTabIndex == 2
                                    ? AppTheme
                                        .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                    : AppTheme
                                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                          ),
                      ],
                      controller: tabController,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ProductSearchScreen(
                            type: CategoryType.Search,
                            showData: controller.text.isNotEmpty,
                            controller: controller,
                            id: widget.id,
                            showAuthenticated: showAuthenticated,
                            navigateToItemDetails: navigateToItemDetails),
                        ServiceSearchScreen(
                            type: CategoryType.Search,
                            controller: controller,
                            id: widget.id,
                            showAuthenticated: showAuthenticated,
                            navigateToItemDetails: navigateToItemDetails),
                        if (widget.type == CategoryType.Search)
                          SellerSearchScreen(
                            type: CategoryType.Search,
                            controller: controller,
                            id: widget.id,
                            showAuthenticated: showAuthenticated,
                          ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void fetchProducts(int page) {
    ref.read(getProductsStateNotifiers.notifier).getProductsData(
        page: page,
        shipmentType: filterForProductData?.shipmentTypeSelected != null
            ? filterForProductData?.shipmentTypeSelected == 1
                ? "various_gifts"
                : "ready_made_gifts"
            : null,
        categoriesIds: widget.type == CategoryType.Categories
            ? [widget.id ?? 0]
            : filterForProductData?.categoriesIdsSelected,
        occasionsIds: widget.type == CategoryType.Occasions
            ? [widget.id ?? 0]
            : filterForProductData?.occasionsIdsSelected,
        ratings: filterForProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        type: ItemType.Products.name.toLowerCase(),
        priceTo: filterForProductData?.priceToSelected,
        priceFrom: filterForProductData?.priceFromSelected,
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
                ? [widget.id ?? 0]
                : filterForServicesData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions ||
                widget.type == CategoryType.Search
            ? widget.type == CategoryType.Occasions
                ? [widget.id ?? 0]
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
    print(filterForSellersData?.occasionsIdsSelected);
    ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
        page: page,
        isPromoted: filterForSellersData?.promotionSelected,
        categoriesIds: widget.type == CategoryType.Categories ||
                widget.type == CategoryType.Search
            ? filterForSellersData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions ||
                widget.type == CategoryType.Search
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

  void openFilterScreen(int activeTabIndex) async {
    switch (activeTabIndex) {
      case 0:
        {
          var filterData = await context.push(R_FilterScreen, extra: {
            "type": FilterScreenTypes.Products,
            "searchValue": controller.text,
            "occasionId": widget.id
          });
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

  void openFilterBottomSheet() {
    FilterData? filterData;
    FilterScreenTypes type;
    final currentIndex  = activeTabIndex;
    if (currentIndex == 0) {
      filterData = filterForProductData;
      type = FilterScreenTypes.Products;
    }
    else if (currentIndex == 1) {
      filterData = filterForServicesData;
      type = FilterScreenTypes.Services;
    }
    else {
      filterData = filterForSellersData;
      type = FilterScreenTypes.Sellers;
    }

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          double height =
              MediaQuery.of(context).size.height * 0.9; // 60% height

          return FilterBottomSheet(
            height: height,
            type: type,
            dataSelected: filterData,
            onFilterApply: (filterData){
              final currentIndex  = activeTabIndex;
              if (currentIndex == 0) {
                clearFilterCategorySelected(FilterScreenTypes.Products);
                filterForProductData = filterData;
                ref.read(filterForProductStateNotifiers.notifier).applyDataFilter(
                    priceFromSelected: filterData.priceFromSelected,
                    priceToSelected: filterData.priceToSelected,
                    categoriesIdsSelected: filterData.categoriesIdsSelected,
                    occasionsIdsSelected: filterData.occasionsIdsSelected,
                    ratingValueSelected: filterData.ratingValueSelected,
                    shipmentTypeSelected: filterData.shipmentTypeSelected
                );
                ref.read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                fetchProducts(1);
              }
              else if (currentIndex == 1) {
                clearFilterCategorySelected(FilterScreenTypes.Services);
                filterForServicesData = filterData;
                ref.read(filterForServiceStateNotifiers.notifier).applyDataFilter(
                    priceFromSelected: filterData.priceFromSelected,
                    priceToSelected: filterData.priceToSelected,
                    categoriesIdsSelected: filterData.categoriesIdsSelected,
                    occasionsIdsSelected: filterData.occasionsIdsSelected,
                    ratingValueSelected: filterData.ratingValueSelected,
                );
                ref.read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                fetchServices(1);
              }
              else {
                clearFilterCategorySelected(FilterScreenTypes.Sellers);
                filterForSellersData = filterData;
                ref.read(filterForSellerStateNotifiers.notifier).applyDataFilter(
                  categoriesIdsSelected: filterData.categoriesIdsSelected,
                  occasionsIdsSelected: filterData.occasionsIdsSelected,
                  ratingValueSelected: filterData.ratingValueSelected,
                );
                ref.read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                fetchSellers(1);
              }
              setFilterData(filterData, type);
            },
          );
        });
  }

  void setFilterData(FilterData filterData,FilterScreenTypes type) {
    if (filterData.shipmentTypeSelected != null) {
      ref
          .read(updateProductListOfFilterSelectedStateNotifiers.notifier)
          .addItem(ItemSelected(
          id: ConstantsMethods.getShipmentTypesList(context)[filterData.shipmentTypeSelected??0].id,
          text: ConstantsMethods.getShipmentTypesList(context)[filterData.shipmentTypeSelected??0].text,
          type: FilterTypes.ProductType));
    }

    if (filterData.categoriesIdsSelected != null) {
      ref
          .watch(getCategoriesDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
      filterData.categoriesIdsSelected?.contains(item.id) ==
          true)
          .forEach((item) {
            if(type == FilterScreenTypes.Products) {
              ref
                  .read(updateProductListOfFilterSelectedStateNotifiers.notifier)
                  .addItem(ItemSelected(
                  id: item.id?.toInt(),
                  text: item.name,
                  type: FilterTypes.Categories));
            }
            else if(type == FilterScreenTypes.Services) {
              ref
                  .read(updateServiceListOfFilterSelectedStateNotifiers.notifier)
                  .addItem(ItemSelected(
                  id: item.id?.toInt(),
                  text: item.name,
                  type: FilterTypes.Categories));
            }
            else {
              ref
                  .read(updateSellerListOfFilterSelectedStateNotifiers.notifier)
                  .addItem(ItemSelected(
                  id: item.id?.toInt(),
                  text: item.name,
                  type: FilterTypes.Categories));
            }

            });
    }
    if (filterData.occasionsIdsSelected != null) {
      ref
          .watch(getOccasionsDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
      filterData.occasionsIdsSelected?.contains(item.id) ==
          true)
          .forEach((item) {
        if(type == FilterScreenTypes.Products) {
          ref
              .read(updateProductListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id?.toInt(),
              text: item.name,
              type: FilterTypes.Occasions));
        }
        else if(type == FilterScreenTypes.Services) {
          ref
              .read(updateServiceListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id?.toInt(),
              text: item.name,
              type: FilterTypes.Occasions));
        }
        else {
          ref
              .read(updateSellerListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id?.toInt(),
              text: item.name,
              type: FilterTypes.Occasions));
        }

      });
    }
    if (filterData.priceToSelected != null && filterData.priceFromSelected != null) {
      if(type == FilterScreenTypes.Products) {
        ref
            .read(updateProductListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: 0,
            text: "${filterData.priceToSelected} - ${filterData.priceFromSelected}",
            type: FilterTypes.Pice));
      }else{
        ref
            .read(updateServiceListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: 0,
            text: "${filterData.priceToSelected} - ${filterData.priceFromSelected}",
            type: FilterTypes.Pice));
      }

    }
    if (filterData.ratingValueSelected != null) {
      ConstantsMethods.getRatingsList(context)
          .where((item) =>
      filterData.ratingValueSelected?.contains(item.id) ==
          true)
          .forEach((item) {
        if(type == FilterScreenTypes.Products) {
          ref
              .read(updateProductListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id.toInt(),
              text: item.text,
              type: FilterTypes.Rating));
        }else if(type == FilterScreenTypes.Services) {
          ref
              .read(updateServiceListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id.toInt(),
              text: item.text,
              type: FilterTypes.Rating));
        }else  {
          ref
              .read(updateSellerListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id.toInt(),
              text: item.text,
              type: FilterTypes.Rating));
        }

      });
    }
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
      currentPageForProducts = 1;
      currentPageForServices = 1;
      fetchProducts(currentPageForProducts);
      fetchServices(currentPageForServices);
    }
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }

  void showAuthenticated() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
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
      currentPageForProducts = 1;
      currentPageForServices = 1;
      fetchProducts(currentPageForProducts);
      fetchServices(currentPageForServices);
      refreshHomeData();
    }
  }

  void refreshHomeData() {
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
  }

  void navigateToSeeAllTopSeller(String title, CategoryType type,
      {int? categoryId}) async {
    await context.push(R_SeeAllSeller,
        extra: {"type": type, "title": title, "categoryId": categoryId});

    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }
  void clearFilterCategorySelected(FilterScreenTypes type) {
    if(type == FilterScreenTypes.Products){
      ref
          .read(
          updateProductListOfFilterSelectedStateNotifiers
              .notifier)
          .clearAll();
    }
    else if(type == FilterScreenTypes.Services){
      ref
          .read(
          updateServiceListOfFilterSelectedStateNotifiers
              .notifier)
          .clearAll();
    }else {
      ref
          .read(
          updateSellerListOfFilterSelectedStateNotifiers
              .notifier)
          .clearAll();
    }
  }

}
