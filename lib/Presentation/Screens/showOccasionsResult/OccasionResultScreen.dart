import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/showOccasionsResult/ProductOccasionScreen.dart';
import 'package:lazo_client/Presentation/Screens/showOccasionsResult/ServiceOccasionsScreen.dart';

import '../../../Constants.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/ItemSelector.dart';
import '../../../Data/Models/UpdateDataModel.dart';
import '../../../Utils/FilterUtils.dart';
import '../../../Utils/UtilsExts.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../BottomSheets/FilterBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/CircleImage.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/SearchWithFilter.dart';

class OccasionResultScreen extends ConsumerStatefulWidget {
  final String title;
  final int? occasionId;
  final String? image;
  const OccasionResultScreen(
      {super.key, this.image, required this.title, this.occasionId});

  @override
  ConsumerState<OccasionResultScreen> createState() =>
      _OccasionResultScreenState();
}

class _OccasionResultScreenState extends ConsumerState<OccasionResultScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForAllProducts = 1;
  var currentPageForReadyGiftsProducts = 1;
  var currentPageUnreadyForProducts = 1;
  var currentPageForServices = 1;

  String? searchForAllProductData = null;
  String? searchForReadyGiftsProductData = null;
  String? searchForUnreadyProductData = null;
  String? searchForServiceData = null;

  FilterData? filterForAllProductData = null;
  FilterData? filterForReadyGiftsProductData = null;
  FilterData? filterForUnreadyProductData = null;
  FilterData? filterForServicesData = null;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
      activeTabIndex = tabController.index;
      if (activeTabIndex == 0) {
        controller.text = searchForAllProductData ?? "";
        updateNumberOfSelectedItems(filterForAllProductData);
      } else if (activeTabIndex == 1) {
        controller.text = searchForReadyGiftsProductData ?? "";
        updateNumberOfSelectedItems(filterForReadyGiftsProductData);
      } else if (activeTabIndex == 2) {
        controller.text = searchForUnreadyProductData ?? "";
        updateNumberOfSelectedItems(filterForUnreadyProductData);
      } else if (activeTabIndex == 3) {
        controller.text = searchForServiceData ?? "";
        updateNumberOfSelectedItems(filterForServicesData);
      }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchProducts(currentPageForAllProducts);
      fetchReadyGiftsProducts(currentPageForReadyGiftsProducts);
      fetchUnreadyProducts(currentPageUnreadyForProducts);
      fetchServices(currentPageForServices);
    });
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  Future<bool> _onWillPop() async {
    resetFilterData();
    context.pop(false);
    return false; // Return true to allow the pop action, false to prevent it
  }

  final headerHeightPresent = 214.h;
  @override
  Widget build(BuildContext context) {
    filterForAllProductData = ref.watch(filterForProductStateNotifiers);
    filterForReadyGiftsProductData =
        ref.watch(filterForReadyGiftProductStateNotifiers);
    filterForUnreadyProductData =
        ref.watch(filterForUnReadyGiftProductStateNotifiers);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: headerHeightPresent,
                  child: Stack(
                    children: [
                      Container(
                        height: headerHeightPresent,
                        width: double.infinity,
                        child: ImageView(
                          width: MediaQuery.of(context).size.width,
                          height:
                              headerHeightPresent,
                          initialImg: widget.image,
                        ),
                      ),
                      Container(
                        height: headerHeightPresent,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomAppBar(
                            appBarColor: Colors.transparent,
                            appContext: context,
                            title: widget.title,
                            navigated: true,
                            isCenter: false,
                            contentColor: Colors.white,
                            customCallBack: () {
                              resetFilterData();
                              context.pop(false);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppSearchBarWithFilter(
                            controller: controller,
                            hasFilter: true,
                            background: Colors.transparent,
                            shadowColor: Colors.white,
                            contentColor: Colors.white,
                            blurRadius: 0,
                            numberOfFilterItems:
                                ref.watch(filterNumberCountStateNotifiers) -
                                    1,
                            onFilterClick: () {
                              openFilterBottomSheet();
                            },
                            delay: 1,
                            onTextChangeListener: (value) {
                              if (activeTabIndex == 0) {
                                currentPageForAllProducts = 1;
                                searchForAllProductData = value;
                                fetchProducts(currentPageForAllProducts);
                              } else if (activeTabIndex == 1) {
                                currentPageForReadyGiftsProducts = 1;
                                searchForReadyGiftsProductData = value;
                                fetchReadyGiftsProducts(
                                    currentPageForReadyGiftsProducts);
                              } else if (activeTabIndex == 2) {
                                currentPageUnreadyForProducts = 1;
                                searchForUnreadyProductData = value;
                                if (value.isNotEmpty ||
                                    getNumberOfFilterItems(
                                            filterForUnreadyProductData) >
                                        0) {
                                  fetchUnreadyProducts(
                                      currentPageUnreadyForProducts);
                                }
                              } else if (activeTabIndex == 3) {
                                currentPageForServices = 1;
                                searchForServiceData = value;
                                if (value.isNotEmpty ||
                                    getNumberOfFilterItems(
                                            filterForServicesData) >
                                        0) {
                                  fetchServices(currentPageForServices);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TabBar(
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
                                            .copyWith(color: Colors.white)
                                        : AppTheme
                                            .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                            .copyWith(
                                                color: AppTheme.appGrey19))),
                            Tab(
                              child: Text("Ready Gifts",
                                  style: activeTabIndex == 1
                                      ? AppTheme
                                          .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                          .copyWith(color: Colors.white)
                                      : AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                          .copyWith(
                                              color: AppTheme.appGrey19)),
                            ),
                            Tab(
                              child: Text("Unready Gifts",
                                  style: activeTabIndex == 2
                                      ? AppTheme
                                          .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                          .copyWith(color: Colors.white)
                                      : AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                          .copyWith(
                                              color: AppTheme.appGrey19)),
                            ),
                            Tab(
                              child: Text("Service",
                                  style: activeTabIndex == 3
                                      ? AppTheme
                                          .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                          .copyWith(color: Colors.white)
                                      : AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                          .copyWith(
                                              color: AppTheme.appGrey19)),
                            ),
                          ],
                          controller: tabController,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    ProductOccasionSearchScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.All,
                        showData: controller.text.isNotEmpty,
                        controller: controller,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ProductOccasionSearchScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.Ready,
                        showData: controller.text.isNotEmpty,
                        controller: controller,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ProductOccasionSearchScreen(
                        type: CategoryType.Search,
                        productType: ProductOccasionType.UnReady,
                        showData: controller.text.isNotEmpty,
                        controller: controller,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                    ServiceOccasionScreen(
                        type: CategoryType.Search,
                        controller: controller,
                        id: null,
                        showAuthenticated: showAuthenticated,
                        navigateToItemDetails: navigateToItemDetails),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchProducts(int page) {
    ref.read(getProductsStateNotifiers.notifier).getProductsData(
        page: page,
        categoriesIds: filterForAllProductData?.categoriesIdsSelected,
        occasionsIds: widget.occasionId != null
            ? [num.parse((widget.occasionId ?? 0).toString())]
            : filterForAllProductData?.occasionsIdsSelected,
        ratings: filterForAllProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForAllProductData?.priceToSelected.toString(),
        priceFrom: filterForAllProductData?.priceFromSelected.toString(),
        type: ItemType.Products.name.toLowerCase(),
        searchByName: searchForAllProductData?.isNotEmpty == true
            ? searchForAllProductData
            : null);
  }

  void fetchReadyGiftsProducts(int page) {
    ref.read(getReadyGiftsProductsStateNotifiers.notifier).getProductsData(
        page: page,
        categoriesIds: filterForReadyGiftsProductData?.categoriesIdsSelected,
        occasionsIds: widget.occasionId != null
            ? [num.parse((widget.occasionId ?? 0).toString())]
            : filterForReadyGiftsProductData?.occasionsIdsSelected,
        ratings: filterForReadyGiftsProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForReadyGiftsProductData?.priceToSelected.toString(),
        priceFrom: filterForReadyGiftsProductData?.priceFromSelected.toString(),
        type: ItemType.Products.name.toLowerCase(),
        shipmentType: ProductType.ready_made_gifts.name,
        searchByName: searchForReadyGiftsProductData?.isNotEmpty == true
            ? searchForReadyGiftsProductData
            : null);
  }

  void fetchServices(int page) {
    ref.read(getServicesStateNotifiers.notifier).getServicesData(
        page: page,
        categoriesIds: filterForServicesData?.categoriesIdsSelected,
        occasionsIds: widget.occasionId != null
            ? [num.parse((widget.occasionId ?? 0).toString())]
            : filterForReadyGiftsProductData?.occasionsIdsSelected,
        ratings: filterForServicesData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForServicesData?.priceToSelected.toString(),
        priceFrom: filterForServicesData?.priceFromSelected.toString(),
        type: ItemType.Services.name.toLowerCase(),
        searchByName: searchForServiceData?.isNotEmpty == true
            ? searchForServiceData
            : null);
  }

  void fetchUnreadyProducts(int page) {
    ref.read(getUnreadyProductsStateNotifiers.notifier).getProductsData(
        page: page,
        categoriesIds: filterForUnreadyProductData?.categoriesIdsSelected,
        occasionsIds: widget.occasionId != null
            ? [num.parse((widget.occasionId ?? 0).toString())]
            : filterForUnreadyProductData?.occasionsIdsSelected,
        ratings: filterForUnreadyProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForUnreadyProductData?.priceToSelected.toString(),
        priceFrom: filterForUnreadyProductData?.priceFromSelected.toString(),
        type: ItemType.Products.name.toLowerCase(),
        shipmentType: ProductType.various_gifts.name,
        searchByName: searchForUnreadyProductData?.isNotEmpty == true
            ? searchForUnreadyProductData
            : null);
  }

  void openFilterBottomSheet() {
    FilterData? filterData;
    FilterScreenTypes type;
    final currentIndex = activeTabIndex;
    if (currentIndex == 0) {
      filterData = filterForAllProductData;
      type = FilterScreenTypes.Services;
    } else if (currentIndex == 1) {
      filterData = filterForReadyGiftsProductData;
      type = FilterScreenTypes.Services;
    } else if (currentIndex == 2) {
      filterData = filterForUnreadyProductData;
      type = FilterScreenTypes.Services;
    } else /*if (currentIndex == 3)*/ {
      filterData = filterForServicesData;
      type = FilterScreenTypes.Services;
    }

    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
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
            occasionId: widget.occasionId,
            onFilterApply: (filterData) {
              final currentIndex = activeTabIndex;
              if (currentIndex == 0) {
                filterForAllProductData = filterData;
                clearFilterCategorySelected(ProductOccasionType.All);
                setFilterData(filterData, ProductOccasionType.All);
                ref
                    .read(filterForProductStateNotifiers.notifier)
                    .applyDataFilter(
                        priceFromSelected: filterData.priceFromSelected,
                        priceToSelected: filterData.priceToSelected,
                        categoriesIdsSelected: filterData.categoriesIdsSelected,
                        occasionsIdsSelected: filterData.occasionsIdsSelected,
                        ratingValueSelected: filterData.ratingValueSelected,
                        shipmentTypeSelected: filterData.shipmentTypeSelected);
                ref
                    .read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(number: getNumberOfFilterItems(filterData));
                currentPageForAllProducts = 1;
                fetchProducts(1);
              } else if (currentIndex == 1) {
                filterForReadyGiftsProductData = filterData;
                clearFilterCategorySelected(ProductOccasionType.Ready);
                setFilterData(filterData, ProductOccasionType.Ready);
                ref
                    .read(filterForReadyGiftProductStateNotifiers.notifier)
                    .applyDataFilter(
                      priceFromSelected: filterData.priceFromSelected,
                      priceToSelected: filterData.priceToSelected,
                      categoriesIdsSelected: filterData.categoriesIdsSelected,
                      occasionsIdsSelected: filterData.occasionsIdsSelected,
                      ratingValueSelected: filterData.ratingValueSelected,
                    );
                ref
                    .read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(number: getNumberOfFilterItems(filterData));
                currentPageForReadyGiftsProducts = 1;
                fetchReadyGiftsProducts(1);
              } else if (currentIndex == 2) {
                filterForUnreadyProductData = filterData;
                clearFilterCategorySelected(ProductOccasionType.UnReady);
                setFilterData(filterData, ProductOccasionType.UnReady);
                ref
                    .read(filterForUnReadyGiftProductStateNotifiers.notifier)
                    .applyDataFilter(
                      categoriesIdsSelected: filterData.categoriesIdsSelected,
                      occasionsIdsSelected: filterData.occasionsIdsSelected,
                      ratingValueSelected: filterData.ratingValueSelected,
                    );
                ref
                    .read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(number: getNumberOfFilterItems(filterData));
                currentPageUnreadyForProducts = 1;
                fetchUnreadyProducts(1);
              } else if (currentIndex == 3) {
                filterForServicesData = filterData;
                clearFilterCategoryForServiceSelected();
                setFilterForServiceData(filterData);
                ref
                    .read(filterForServiceStateNotifiers.notifier)
                    .applyDataFilter(
                      categoriesIdsSelected: filterData.categoriesIdsSelected,
                      occasionsIdsSelected: filterData.occasionsIdsSelected,
                      ratingValueSelected: filterData.ratingValueSelected,
                    );
                ref
                    .read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(number: getNumberOfFilterItems(filterData));
                currentPageForServices = 1;
                fetchServices(1);
              }
            },
          );
        });
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
      currentPageForAllProducts = 1;
      currentPageUnreadyForProducts = 1;
      currentPageForReadyGiftsProducts = 1;
      fetchProducts(currentPageForAllProducts);
      fetchUnreadyProducts(currentPageUnreadyForProducts);
      fetchReadyGiftsProducts(currentPageForReadyGiftsProducts);
    }
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
      currentPageForAllProducts = 1;
      currentPageForReadyGiftsProducts = 1;
      currentPageUnreadyForProducts = 1;
      currentPageForServices = 1;
      fetchProducts(currentPageForAllProducts);
      fetchUnreadyProducts(currentPageUnreadyForProducts);
      fetchReadyGiftsProducts(currentPageForReadyGiftsProducts);
    }
  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }

  void clearFilterCategorySelected(ProductOccasionType type) {
    ref
        .read(type == ProductOccasionType.All
            ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                .notifier
            : type == ProductOccasionType.Ready
                ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                    .notifier
                : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                    .notifier)
        .clearAll();
  }

  void clearFilterCategoryForServiceSelected() {
    ref
        .read(updateOccasionServiceListOfFilterSelectedStateNotifiers.notifier)
        .clearAll();
  }

  void setFilterData(FilterData filterData, ProductOccasionType type) {
    if (filterData.shipmentTypeSelected != null) {
      ref
          .read(type == ProductOccasionType.All
              ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                  .notifier
              : type == ProductOccasionType.Ready
                  ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                      .notifier
                  : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                      .notifier)
          .addItem(ItemSelected(
              id: ConstantsMethods.getShipmentTypesList(
                      context)[filterData.shipmentTypeSelected ?? 0]
                  .id,
              text: ConstantsMethods.getShipmentTypesList(
                      context)[filterData.shipmentTypeSelected ?? 0]
                  .text,
              type: FilterTypes.ProductType));
    }
    if (filterData.categoriesIdsSelected != null) {
      ref
          .watch(getCategoriesDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
              filterData.categoriesIdsSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(type == ProductOccasionType.All
                ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                    .notifier
                : type == ProductOccasionType.Ready
                    ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                        .notifier
                    : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                        .notifier)
            .addItem(ItemSelected(
                id: item.id?.toInt(),
                text: item.name,
                type: FilterTypes.Categories));
      });
    }
    /*if (filterData.occasionsIdsSelected != null) {
      ref
          .watch(getOccasionsDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
              filterData.occasionsIdsSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(type == ProductOccasionType.All
                ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                    .notifier
                : type == ProductOccasionType.Ready
                    ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                        .notifier
                    : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                        .notifier)
            .addItem(ItemSelected(
                id: item.id?.toInt(),
                text: item.name,
                type: FilterTypes.Occasions));
      });
    }*/
    if (filterData.priceToSelected != null &&
        filterData.priceFromSelected != null) {
      ref
          .read(type == ProductOccasionType.All
              ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                  .notifier
              : type == ProductOccasionType.Ready
                  ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                      .notifier
                  : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                      .notifier)
          .addItem(ItemSelected(
              id: 0,
              text:
                  "${filterData.priceToSelected} - ${filterData.priceFromSelected}",
              type: FilterTypes.Pice));
    }
    if (filterData.ratingValueSelected != null) {
      ConstantsMethods.getRatingsList(context)
          .where((item) =>
              filterData.ratingValueSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(type == ProductOccasionType.All
                ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                    .notifier
                : type == ProductOccasionType.Ready
                    ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                        .notifier
                    : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                        .notifier)
            .addItem(ItemSelected(
                id: item.id.toInt(),
                text: item.text,
                type: FilterTypes.Rating));
      });
    }
  }
  void setFilterForServiceData(FilterData filterData) {
    if (filterData.categoriesIdsSelected != null) {
      ref
          .watch(getCategoriesDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
              filterData.categoriesIdsSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(updateOccasionServiceListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
                id: item.id?.toInt(),
                text: item.name,
                type: FilterTypes.Categories));
      });
    }
    /*if (filterData.occasionsIdsSelected != null) {
      ref
          .watch(getOccasionsDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
              filterData.occasionsIdsSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(type == ProductOccasionType.All
                ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                    .notifier
                : type == ProductOccasionType.Ready
                    ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                        .notifier
                    : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                        .notifier)
            .addItem(ItemSelected(
                id: item.id?.toInt(),
                text: item.name,
                type: FilterTypes.Occasions));
      });
    }*/
    if (filterData.priceToSelected != null &&
        filterData.priceFromSelected != null) {
      ref
          .read(updateOccasionServiceListOfFilterSelectedStateNotifiers.notifier)
          .addItem(ItemSelected(
              id: 0,
              text:
                  "${filterData.priceToSelected} - ${filterData.priceFromSelected}",
              type: FilterTypes.Pice));
    }
    if (filterData.ratingValueSelected != null) {
      ConstantsMethods.getRatingsList(context)
          .where((item) =>
              filterData.ratingValueSelected?.contains(item.id) == true)
          .forEach((item) {
        ref
            .read(updateOccasionServiceListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
                id: item.id.toInt(),
                text: item.text,
                type: FilterTypes.Rating));
      });
    }
  }

  void resetFilterData() {
    ref
        .read(
            updateOccasionAllProductListOfFilterSelectedStateNotifiers.notifier)
        .clearAll();
    ref
        .read(updateOccasionReadyProductListOfFilterSelectedStateNotifiers
            .notifier)
        .clearAll();
    ref
        .read(updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
            .notifier)
        .clearAll();
    clearFilterData();
  }

  void clearFilterData() {
    ref
        .read(
            updateOccasionAllProductListOfFilterSelectedStateNotifiers.notifier)
        .clearAll();
    ref
        .read(updateOccasionReadyProductListOfFilterSelectedStateNotifiers
            .notifier)
        .clearAll();
    ref
        .read(updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
            .notifier)
        .clearAll();
  }
}
