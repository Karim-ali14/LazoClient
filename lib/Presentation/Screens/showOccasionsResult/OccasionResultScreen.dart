import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/showOccasionsResult/ProductOccasionScreen.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/UpdateDataModel.dart';
import '../../../Utils/FilterUtils.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../BottomSheets/FilterBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/SvgIcons.dart';
import '../search/ProductSearchScreen.dart';

class OccasionResultScreen extends ConsumerStatefulWidget {
  final String title;
  final int? occasionId;
  const OccasionResultScreen({super.key, required this.title, this.occasionId});

  @override
  ConsumerState<OccasionResultScreen> createState() => _OccasionResultScreenState();
}

class _OccasionResultScreenState extends ConsumerState<OccasionResultScreen>
    with SingleTickerProviderStateMixin{

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
    tabController = TabController(
        length:3 , vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
        if (activeTabIndex == 0) {
          controller.text = searchForAllProductData ?? "";
          ref.read(filterNumberCountStateNotifiers.notifier)
              .updateNumber(
              number: getNumberOfFilterItems(filterForAllProductData)
          );
        } else if (activeTabIndex == 1) {
          controller.text = searchForReadyGiftsProductData ?? "";
          ref.read(filterNumberCountStateNotifiers.notifier)
              .updateNumber(
              number: getNumberOfFilterItems(filterForReadyGiftsProductData)
          );
        } else if (activeTabIndex == 2) {
          controller.text = searchForUnreadyProductData ?? "";
          ref.read(filterNumberCountStateNotifiers.notifier)
              .updateNumber(
              number: getNumberOfFilterItems(filterForUnreadyProductData)
          );
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchProducts(currentPageForAllProducts);
      fetchReadyGiftsProducts(currentPageForReadyGiftsProducts);
      fetchUnreadyProducts(currentPageUnreadyForProducts);
    });
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  Future<bool> _onWillPop() async {
    // Your custom logic here
    print('Back button pressed! ${ref.watch(filterNumberCountStateNotifiers)}');
    // clearFilterData();
    print('Back button pressed! ${ref.watch(filterNumberCountStateNotifiers)}');
    context.pop(false);
    return false; // Return true to allow the pop action, false to prevent it
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
          appContext: context,
          title: widget.title,
          navigated: true,
          isCenter: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              AppSearchBarWithFilter(
                controller: controller,
                hasFilter: true,
                numberOfFilterItems: ref.watch(filterNumberCountStateNotifiers) - 1,
                onFilterClick: () {
                  openFilterBottomSheet();
                },
                delay: 1,
                onTextChangeListener: (value) {
                  if (activeTabIndex == 0) {
                    currentPageForAllProducts = 1;
                    searchForAllProductData = value;
                    fetchProducts(currentPageForAllProducts);
                  }
                  else if (activeTabIndex == 1) {
                    currentPageForReadyGiftsProducts = 1;
                    searchForReadyGiftsProductData = value;
                    fetchReadyGiftsProducts(currentPageForReadyGiftsProducts);
                  }
                  else if (activeTabIndex == 2) {
                    currentPageUnreadyForProducts = 1;
                    searchForUnreadyProductData = value;
                    if(value.isNotEmpty || getNumberOfFilterItems(filterForUnreadyProductData) > 0) {
                      fetchUnreadyProducts(currentPageUnreadyForProducts);
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
                        child: Text("All",
                            style: activeTabIndex == 0
                                ? AppTheme
                                .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                : AppTheme
                                .styleWithTextAppGrey7AdelleSansExtendedFonts14w400)),
                    Tab(
                      child: Text("Ready Gifts",
                          style: activeTabIndex == 1
                              ? AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                              : AppTheme
                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400),
                    ),
                    Tab(
                      child: Text("Unready Gifts",
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
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
                      ],
                    ),
                  ))
            ],
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
    final currentIndex  = activeTabIndex;
    if (currentIndex == 0) {
      filterData = filterForAllProductData;
      type = FilterScreenTypes.Services;
    }
    else if (currentIndex == 1) {
      filterData = filterForReadyGiftsProductData;
      type = FilterScreenTypes.Services;
    }
    else /*if (currentIndex == 2)*/{
      filterData = filterForUnreadyProductData;
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
            onFilterApply: (filterData){
              final currentIndex  = activeTabIndex;
              if (currentIndex == 0) {
                filterForAllProductData = filterData;
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
                filterForReadyGiftsProductData = filterData;
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
                fetchReadyGiftsProducts(1);
              }
              else {
                filterForUnreadyProductData = filterData;
                ref.read(filterForSellerStateNotifiers.notifier).applyDataFilter(
                  categoriesIdsSelected: filterData.categoriesIdsSelected,
                  occasionsIdsSelected: filterData.occasionsIdsSelected,
                  ratingValueSelected: filterData.ratingValueSelected,
                );
                ref.read(filterNumberCountStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                fetchUnreadyProducts(1);
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
}
