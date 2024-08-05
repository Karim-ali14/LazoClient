import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';

class ShowBestProductAndServiceScreen extends ConsumerStatefulWidget {
  final String title;
  final ItemType type;
  const ShowBestProductAndServiceScreen(this.title, this.type, {super.key});

  @override
  ConsumerState<ShowBestProductAndServiceScreen> createState() =>
      _ShowProductAndServiceScreenState();
}

class _ShowProductAndServiceScreenState
    extends ConsumerState<ShowBestProductAndServiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForProducts = 1;
  var currentPageForServices = 1;

  String? searchForProductData = null;
  String? searchForServiceData = null;

  FilterData? filterForProductData = null;
  FilterData? filterForServicesData = null;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.type == ItemType.Products) {
        fetchProducts(currentPageForProducts);
      } else {
        fetchServices(currentPageForServices);
      }
    });
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    filterForProductData = ref.watch(filterForProductStateNotifiers);

    filterForServicesData = ref.watch(filterForServiceStateNotifiers);

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
                controller: controller,
                hasFilter: true,
                onFilterClick: () {
                  openFilter(widget.type);
                },
                delay: 1,
                onTextChangeListener: (value) {
                  if (widget.type == ItemType.Products) {
                    searchForProductData = value;
                    currentPageForProducts = 1;
                    fetchProducts(currentPageForProducts);
                  } else {
                    searchForServiceData = value;
                    currentPageForServices = 1;
                    fetchServices(currentPageForServices);
                  }
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: widget.type == ItemType.Products
                  ? productsState.state == DataState.EMPTY
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
                            if (currentPageForProducts <
                                (productsState.data?.data?.products?.lastPage ??
                                    0)) {
                              fetchProducts(++currentPageForProducts);
                            }
                          },
                          builder: (item) => Skeletonizer(
                                enabled:
                                    productsState.state == DataState.LOADING,
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
                              ))
                  : servicesState.state == DataState.EMPTY
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
                                enabled:
                                    servicesState.state == DataState.LOADING,
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
            )
          ],
        ),
      ),
    );
  }

  void openFilter(ItemType type) async {
    if(type == ItemType.Products){
      var filterData = await context.push(R_FilterScreen,
          extra: {"type": FilterScreenTypes.Products,"searchValue" : searchForProductData});
      currentPageForProducts = 1;
      filterForProductData = filterData as FilterData;
      fetchProducts(currentPageForProducts);
    }else if(type == ItemType.Services){
      var filterData = await context.push(R_FilterScreen,
          extra: {"type": FilterScreenTypes.Services,"searchValue" : searchForServiceData});
      currentPageForServices = 1;
      filterForServicesData = filterData as FilterData;
      fetchServices(currentPageForServices);
    }
  }

  void fetchProducts(int page) {
    ref
        .read(getProductsStateNotifiers.notifier)
        .getProductsData(
        page: page,
        categoriesIds: filterForProductData?.categoriesIdsSelected,
        occasionsIds: filterForProductData?.occasionsIdsSelected,
        ratings: filterForProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForProductData?.priceToSelected.toString(),
        priceFrom: filterForProductData?.priceFromSelected.toString(),
        type:
        ItemType.Products.name.toLowerCase(),
        searchByName: searchForProductData?.isNotEmpty == true ? searchForProductData : null);
  }

  void fetchServices(int page) {
    ref
        .read(getServicesStateNotifiers.notifier)
        .getServicesData(
        page: page,
        categoriesIds:  filterForServicesData?.categoriesIdsSelected,
        occasionsIds: filterForServicesData?.occasionsIdsSelected,
        ratings: filterForServicesData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForServicesData?.priceToSelected.toString(),
        priceFrom: filterForServicesData?.priceFromSelected.toString(),
        type:
        ItemType.Services.name.toLowerCase(),
        searchByName: searchForServiceData?.isNotEmpty == true ? searchForServiceData : null);
  }

}
