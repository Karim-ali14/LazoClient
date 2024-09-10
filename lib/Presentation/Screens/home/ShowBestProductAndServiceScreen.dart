import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';

class ShowBestProductAndServiceScreen extends ConsumerStatefulWidget {
  final String title;
  final ItemType type;
  final int? occasionId;
  final int? categoryId;
  final num? providerId;
  const ShowBestProductAndServiceScreen(this.title, this.type,  {this.providerId,this.categoryId,this.occasionId,super.key});

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

    final client = ref.watch(clientStateProvider);

    filterForProductData = ref.watch(filterForProductStateNotifiers);

    filterForServicesData = ref.watch(filterForServiceStateNotifiers);

    final productsState = ref.watch(getProductsStateNotifiers);
    final servicesState = ref.watch(getServicesStateNotifiers);

    handleState(addProductToCartUseCaseStateNotifier , showLoading: true ,onSuccess: (res){
      var id = res.data?.data?.productId;
      print("product id : $id");
      if(id != null){
        ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier , showLoading: true ,onSuccess: (res){
      var id = res.data?.data?.serviceId;
      if(id != null){
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
              res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
          ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
              res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
        });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
              res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
          ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
              res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
        });

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
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.searchGifIcon(),
                          title: "No Data Found",
                          description:
                              "Please refine your search using common words to get accurate results",
                        )
                      : DataListView<ProviderProduct>(
                          dataList: productsState.data?.data?.products?.data ??
                              (productsState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          5, (index) => ProviderProduct())
                                    ]
                                  : []),
                          paginated: true,
                          pageLoading:
                              productsState.state == DataState.MORE_LOADING,
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
                                      addProductToCart(id);
                                    },
                                    onAddItemToWishList: (id) {
                                      if(client != null){
                                        productWishlistToggle(id);
                                      }else{
                                        showAuthenticated();
                                      }
                                      },
                                    onItemClick: (id,name,categoriesIds) {
                                      print("Selected Product : $categoriesIds");
                                      navigateToItemDetails(ItemType.Products, id, name, categoriesIds);
                                    },
                                  ),
                                ),
                              ))
                  : servicesState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.searchGifIcon(),
                          title: "No Data Found",
                          description:
                              "Please refine your search using common words to get accurate results",
                        )
                      : DataListView<ServiceShowData>(
                          dataList: servicesState.data?.data?.services?.data ??
                              (servicesState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          5, (index) => ServiceShowData())
                                    ]
                                  : []),
                          paginated: true,
                          pageLoading:
                              servicesState.state == DataState.MORE_LOADING,
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
                                      addServiceToCart(id);
                                    },
                                    onAddItemToWishList: (id) {
                                      if(client != null){
                                        serviceWishlistToggle(id.toString());
                                      }else{
                                        showAuthenticated();
                                      }
                                    },
                                    onItemClick: (id,name,categoriesIds) {
                                      navigateToItemDetails(ItemType.Services, id, name, categoriesIds);
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
    if (type == ItemType.Products) {
      var filterData = await context.push(R_FilterScreen, extra: {
        "type": FilterScreenTypes.Products,
        "searchValue": searchForProductData,
        "occasionId": widget.occasionId,
        "categoryId" : widget.categoryId
      });
      currentPageForProducts = 1;
      filterForProductData = filterData as FilterData;
      fetchProducts(currentPageForProducts);
    } else if (type == ItemType.Services) {
      var filterData = await context.push(R_FilterScreen, extra: {
        "type": FilterScreenTypes.Services,
        "searchValue": searchForServiceData,
        "categoryId" : widget.categoryId
      });
      currentPageForServices = 1;
      filterForServicesData = filterData as FilterData;
      fetchServices(currentPageForServices);
    }
  }

  void fetchProducts(int page) {
    ref.read(getProductsStateNotifiers.notifier).getProductsData(
        providerId: widget.providerId,
        page: page,
        categoriesIds: widget.categoryId != null ? [num.parse((widget.categoryId??0).toString())] : filterForProductData?.categoriesIdsSelected,
        occasionsIds: filterForProductData?.occasionsIdsSelected,
        ratings: filterForProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForProductData?.priceToSelected.toString(),
        priceFrom: filterForProductData?.priceFromSelected.toString(),
        type: ItemType.Products.name.toLowerCase(),
        searchByName: searchForProductData?.isNotEmpty == true
            ? searchForProductData
            : null);
  }

  void fetchServices(int page) {
    ref.read(getServicesStateNotifiers.notifier).getServicesData(
        providerId: widget.providerId,
        page: page,
        categoriesIds: widget.categoryId != null ? [num.parse((widget.categoryId??0).toString())] : filterForServicesData?.categoriesIdsSelected,
        occasionsIds: filterForServicesData?.occasionsIdsSelected,
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

  void navigateToItemDetails(ItemType itemType, int itemId, String itemName,List<int> categoriesIds) async {
    var makeRefresh = await context.push("$R_ProductAndServiceDetails/${itemId.toString()}" , extra: {"type" : itemType, "id" : itemId.toString() , "name" : itemName , "categoryIds" : categoriesIds});
    if(makeRefresh == true){
      if(itemType == ItemType.Products){
        currentPageForProducts = 1;
        fetchProducts(currentPageForProducts);
      }else {
        currentPageForServices = 1;
        fetchServices(currentPageForServices);
      }
    }
  }

  void addProductToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null && sessionId?.isNotEmpty == true) {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString(), sessionId: sessionId);
    }else {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString());
    }
  }

  void addServiceToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null && sessionId?.isNotEmpty == true) {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString(), sessionId: sessionId);
    }else {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString());
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
        ));
  }

  void navigateToLogin() async {
    var makeRefresh = await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if(makeRefresh == true){
      currentPageForProducts = 1;
      currentPageForServices = 1;
      if (widget.type == ItemType.Products) {
        fetchProducts(currentPageForProducts);
      } else {
        fetchServices(currentPageForServices);
      }
      refreshHomeData();
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

  void refreshHomeData() {
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
  }
}
