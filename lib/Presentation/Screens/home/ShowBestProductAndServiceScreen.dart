import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Models/UpdateDataModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/ItemSelector.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/FilterUtils.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../BottomSheets/FilterBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import 'Componants/CategoryFilterItemCard.dart';

class ShowBestProductAndServiceScreen extends ConsumerStatefulWidget {
  final String title;
  final ItemType type;
  final int? occasionId;
  final int? categoryId;
  final num? providerId;
  const ShowBestProductAndServiceScreen(this.title, this.type,
      {this.providerId, this.categoryId, this.occasionId, super.key});

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
      clearFilterCategorySelected(widget.type);
      updateFilterData(FilterData(), widget.type);
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

    filterForProductData = ref.watch(filterForBestProductStateNotifiers);

    filterForServicesData = ref.watch(filterForBestServiceStateNotifiers);

    final productsState = ref.watch(getBestProductsStateNotifiers);
    final servicesState = ref.watch(getBestServicesStateNotifiers);

    handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.productId;
      print("product id : $id");
      if (id != null) {
        ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
        ref.read(getBestProductsStateNotifiers.notifier).handleAddProductToCart(id);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.serviceId;
      if (id != null) {
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
        ref.read(getBestServicesStateNotifiers.notifier).handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
      ref.read(getBestProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
    });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
      ref.read(getBestServicesStateNotifiers.notifier).handelAddServiceToWishlist(
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
            AppSearchBarWithFilter(
              controller: controller,
              hasFilter: true,
              numberOfFilterItems: ref.watch(filterNumberCountForBestItemStateNotifiers),
              onFilterClick: () {
                openFilterBottomSheet();
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
            Consumer(builder: (context, ref, child) {
              final categorySelectedState = ref
                  .watch(
                  widget.type == ItemType.Products ?
                  updateBestProductListOfFilterSelectedStateNotifiers :updateBestServiceListOfFilterSelectedStateNotifiers )
                  .toList();

              return categorySelectedState.isNotEmpty == true
                  ? Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(.2), // Shadow color
                      blurRadius: .9, // Blur effect
                      spreadRadius: .1, // Spread effect
                      offset:
                      const Offset(0, .5), // Shadow position
                    ),
                  ],
                ),
                padding: const EdgeInsetsDirectional.only(
                    top: 8, bottom: 8, start: 16),
                child: SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15),
                        clipBehavior: Clip.antiAlias,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppTheme.appGrey8, width: 1),
                        ),
                        child: InkWell(
                            onTap: () {
                              if(widget.type == ItemType.Products){
                                clearFilterCategorySelected(ItemType.Products);
                                filterForProductData = null;
                                updateFilterData(filterForProductData,ItemType.Products);
                                updateNumberOfSelectedItems(filterForProductData);
                                currentPageForProducts = 1;
                                fetchProducts(currentPageForProducts);
                              }else{
                                clearFilterCategorySelected(ItemType.Services);
                                filterForServicesData = null;
                                updateFilterData(filterForServicesData,ItemType.Services);
                                updateNumberOfSelectedItems(filterForServicesData);
                                currentPageForServices = 1;
                                fetchServices(currentPageForServices);
                              }

                            },
                            child: const Center(
                                child: Text("Clear All",
                                    style: AppTheme
                                        .styleWithTextBlackColor2AdelleSansExtendedFonts13w400))),
                      ),
                      const VerticalDivider(
                        color: AppTheme.appGrey20,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 35,
                        width:
                        MediaQuery.of(context).size.width * .7,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryFilterItemCard(
                                height: 32,
                                item: categorySelectedState[index],
                                onSelectCategory: (item) {
                                  if(item?.type == FilterTypes.Categories){
                                    filterForProductData?.categoriesIdsSelected?.remove(item?.id);
                                    updateNumberOfSelectedItems(filterForProductData);
                                  } else if(item?.type == FilterTypes.Occasions){
                                    filterForProductData?.occasionsIdsSelected?.remove(item?.id);
                                    updateNumberOfSelectedItems(filterForProductData);
                                  } else if(item?.type == FilterTypes.Rating){
                                    filterForProductData?.ratingValueSelected?.remove(item?.id);
                                    updateNumberOfSelectedItems(filterForProductData);
                                  } else if(item?.type == FilterTypes.Pice){
                                    filterForProductData?.priceFromSelected = null;
                                    filterForProductData?.priceToSelected = null;
                                    updateNumberOfSelectedItems(filterForProductData);
                                  } else if(item?.type == FilterTypes.ProductType){
                                    filterForProductData?.shipmentTypeSelected = null;
                                    updateNumberOfSelectedItems(filterForProductData);
                                  }

                                  if(widget.type == ItemType.Products){
                                    ref
                                        .read(
                                        updateBestProductListOfFilterSelectedStateNotifiers
                                            .notifier)
                                        .removeItem(item);
                                    updateFilterData(filterForProductData,ItemType.Products);
                                    //
                                    currentPageForProducts = 1;
                                    fetchProducts(currentPageForProducts);
                                  }else{
                                    ref
                                        .read(
                                        updateBestServiceListOfFilterSelectedStateNotifiers
                                            .notifier)
                                        .removeItem(item);
                                    updateFilterData(filterForServicesData,ItemType.Services);
                                    //
                                    currentPageForServices = 1;
                                    fetchServices(currentPageForServices);
                                  }

                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: 12,
                            ),
                            itemCount:
                            categorySelectedState.length),
                      ),
                    ],
                  ),
                ),
              )
                  : const SizedBox();
            }),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: widget.type == ItemType.Products
                  ? productsState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.localSVG(searchIconNoDataSvg,
                              width: 114, height: 97),
                          title: null,
                          description: "Oops! No product found.",
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DataListView<ProviderProduct>(
                              dataList: productsState
                                      .data?.data?.products?.data ??
                                  (productsState.state == DataState.LOADING
                                      ? [
                                          ...List.generate(
                                              8, (index) => ProviderProduct())
                                        ]
                                      : []),
                              paginated: true,
                              gridView: true,
                              childAspectRatio: .75,
                              heightPresent: 0.79,
                              loadingHeightPresent: 0.725,
                              crossAxisSpacing: 15,
                              pageLoading:
                                  productsState.state == DataState.MORE_LOADING,
                              onBottomReached: () {
                                if (currentPageForProducts <
                                    (productsState
                                            .data?.data?.products?.lastPage ??
                                        0)) {
                                  fetchProducts(++currentPageForProducts);
                                }
                              },
                              builder: (item) => Skeletonizer(
                                    enabled: productsState.state ==
                                        DataState.LOADING,
                                    child: ServiceAndProductItemCardHorizontal(
                                      height: 160,
                                      type: ItemType.Products,
                                      product: item,
                                      onAddItemToCart: (id) {
                                        addProductToCart(id);
                                      },
                                      onAddItemToWishList: (id) {
                                        if (client != null) {
                                          productWishlistToggle(id);
                                        } else {
                                          showAuthenticated();
                                        }
                                      },
                                      onItemClick: (id, name, categoriesIds) {
                                        print(
                                            "Selected Product : $categoriesIds");
                                        navigateToItemDetails(ItemType.Products,
                                            id, name, categoriesIds);
                                      },
                                    ),
                                  )),
                        )
                  : servicesState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ EmptyDataView(
                          icon: SVGIcons.localSVG(searchIconNoDataSvg,
                              width: 114, height: 97),
                          title: null,
                          description: "Oops! No service found.",
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DataListView<ServiceShowData>(
                              dataList: servicesState
                                      .data?.data?.services?.data ??
                                  (servicesState.state == DataState.LOADING
                                      ? [
                                          ...List.generate(
                                              8, (index) => ServiceShowData())
                                        ]
                                      : []),
                              paginated: true,
                              gridView: true,
                              childAspectRatio: .75,
                              heightPresent: 0.79,
                              loadingHeightPresent: 0.725,
                              crossAxisSpacing: 15,
                              pageLoading:
                                  servicesState.state == DataState.MORE_LOADING,
                              onBottomReached: () {
                                if (currentPageForServices <
                                    (servicesState
                                            .data?.data?.services?.lastPage ??
                                        0)) {
                                  fetchServices(++currentPageForServices);
                                }
                              },
                              builder: (item) => Skeletonizer(
                                    enabled: servicesState.state ==
                                        DataState.LOADING,
                                    child: ServiceAndProductItemCardHorizontal(
                                      service: item,
                                      height: 160,
                                      type: ItemType.Services,
                                      onAddItemToCart: (id) {
                                        addServiceToCart(id);
                                      },
                                      onAddItemToWishList: (id) {
                                        if (client != null) {
                                          serviceWishlistToggle(id.toString());
                                        } else {
                                          showAuthenticated();
                                        }
                                      },
                                      onItemClick: (id, name, categoriesIds) {
                                        navigateToItemDetails(ItemType.Services,
                                            id, name, categoriesIds);
                                      },
                                    ),
                                  )),
                        ),
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
        "categoryId": widget.categoryId
      });
      currentPageForProducts = 1;
      filterForProductData = filterData as FilterData;
      fetchProducts(currentPageForProducts);
    } else if (type == ItemType.Services) {
      var filterData = await context.push(R_FilterScreen, extra: {
        "type": FilterScreenTypes.Services,
        "searchValue": searchForServiceData,
        "categoryId": widget.categoryId
      });
      currentPageForServices = 1;
      filterForServicesData = filterData as FilterData;
      fetchServices(currentPageForServices);
    }
  }

  void fetchProducts(int page) {
    ref.read(getBestProductsStateNotifiers.notifier).getProductsData(
        providerId: widget.providerId,
        page: page,
        categoriesIds: widget.categoryId != null
            ? [num.parse((widget.categoryId ?? 0).toString())]
            : filterForProductData?.categoriesIdsSelected,
        occasionsIds: widget.occasionId != null
            ? [num.parse((widget.occasionId ?? 0).toString())]
            : filterForProductData?.occasionsIdsSelected,
        ratings: filterForProductData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        priceTo: filterForProductData?.priceToSelected.toString(),
        priceFrom: filterForProductData?.priceFromSelected.toString(),
        type: ItemType.Products.name.toLowerCase(),
        shipmentType: filterForProductData?.shipmentTypeSelected != null ? filterForProductData?.shipmentTypeSelected  == 0 ? ProductTypes.ready_made_gifts.name : ProductTypes.various_gifts.name : null,
        searchByName: searchForProductData?.isNotEmpty == true
            ? searchForProductData
            : null);
  }

  void fetchServices(int page) {
    ref.read(getBestServicesStateNotifiers.notifier).getServicesData(
        providerId: widget.providerId,
        page: page,
        categoriesIds: widget.categoryId != null
            ? [num.parse((widget.categoryId ?? 0).toString())]
            : filterForServicesData?.categoriesIdsSelected,
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

  void navigateToItemDetails(ItemType itemType, int itemId, String itemName,
      List<int> categoriesIds) async {
    var updateData = await context
        .push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "id": itemId.toString(),
      "name": itemName,
      "categoryIds": categoriesIds
    }) as UpdateDataModel?;
    if (updateData != null && updateData.updateNormalData == true) {
      if (itemType == ItemType.Products) {
        currentPageForProducts = 1;
        fetchProducts(currentPageForProducts);
      } else {
        currentPageForServices = 1;
        fetchServices(currentPageForServices);
      }
    }
  }

  void addProductToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString(), sessionId: sessionId);
    } else {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString());
    }
  }

  void addServiceToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString(), sessionId: sessionId);
    } else {
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
    var makeRefresh =
        await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if (makeRefresh == true) {
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

  void openFilterBottomSheet() {
    FilterData? filterData;
    FilterScreenTypes type;
    if (widget.type == ItemType.Products) {
      filterData = filterForProductData;
      type = FilterScreenTypes.Products;
    }
    else {
      filterData = filterForServicesData;
      type = FilterScreenTypes.Services;
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

              if (widget.type == ItemType.Products) {
                clearFilterCategorySelected(ItemType.Products);
                filterForProductData = filterData;
                ref.read(filterForBestProductStateNotifiers.notifier).applyDataFilter(
                    priceFromSelected: filterData.priceFromSelected,
                    priceToSelected: filterData.priceToSelected,
                    categoriesIdsSelected: filterData.categoriesIdsSelected,
                    occasionsIdsSelected: filterData.occasionsIdsSelected,
                    ratingValueSelected: filterData.ratingValueSelected,
                    shipmentTypeSelected: filterData.shipmentTypeSelected
                );
                ref.read(filterNumberCountForBestItemStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                currentPageForProducts = 1;
                fetchProducts(currentPageForProducts);
              }
              else if (widget.type == ItemType.Services) {
                clearFilterCategorySelected(ItemType.Services);
                filterForServicesData = filterData;
                ref.read(filterForBestServiceStateNotifiers.notifier).applyDataFilter(
                  priceFromSelected: filterData.priceFromSelected,
                  priceToSelected: filterData.priceToSelected,
                  categoriesIdsSelected: filterData.categoriesIdsSelected,
                  occasionsIdsSelected: filterData.occasionsIdsSelected,
                  ratingValueSelected: filterData.ratingValueSelected,
                );
                ref.read(filterNumberCountForBestItemStateNotifiers.notifier)
                    .updateNumber(
                    number: getNumberOfFilterItems(filterData)
                );
                currentPageForServices = 1;
                fetchServices(currentPageForServices);
              }

              setFilterData(filterData, type);
            },
          );
        });
  }
  void setFilterData(FilterData filterData,FilterScreenTypes type) {
    if (filterData.shipmentTypeSelected != null) {
      ref
          .read(updateBestProductListOfFilterSelectedStateNotifiers.notifier)
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
              .read(updateBestProductListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id?.toInt(),
              text: item.name,
              type: FilterTypes.Categories));
        }
        else if(type == FilterScreenTypes.Services) {
          ref
              .read(updateBestServiceListOfFilterSelectedStateNotifiers.notifier)
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
              .read(updateBestProductListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id?.toInt(),
              text: item.name,
              type: FilterTypes.Occasions));
        }
        else if(type == FilterScreenTypes.Services) {
          ref
              .read(updateBestServiceListOfFilterSelectedStateNotifiers.notifier)
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
            .read(updateBestProductListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: 0,
            text: "${filterData.priceToSelected} - ${filterData.priceFromSelected}",
            type: FilterTypes.Pice));
      }else{
        ref
            .read(updateBestServiceListOfFilterSelectedStateNotifiers.notifier)
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
              .read(updateBestProductListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id.toInt(),
              text: item.text,
              type: FilterTypes.Rating));
        }else if(type == FilterScreenTypes.Services) {
          ref
              .read(updateBestServiceListOfFilterSelectedStateNotifiers.notifier)
              .addItem(ItemSelected(
              id: item.id.toInt(),
              text: item.text,
              type: FilterTypes.Rating));
        }
      });
    }
  }

  void clearFilterCategorySelected(ItemType type) {
    if(type == ItemType.Products){
      ref
          .read(
          updateBestProductListOfFilterSelectedStateNotifiers
              .notifier)
          .clearAll();
    }
    else if(type == ItemType.Services){
      ref
          .read(
          updateBestServiceListOfFilterSelectedStateNotifiers
              .notifier)
          .clearAll();
    }
  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountForBestItemStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }



  void updateFilterData(FilterData? filterForProductData,ItemType type) {
    ref.read(type == ItemType.Products ? filterForBestProductStateNotifiers.notifier : filterForBestServiceStateNotifiers.notifier).applyDataFilter(
        categoriesIdsSelected: filterForProductData?.categoriesIdsSelected,
        occasionsIdsSelected: filterForProductData?.occasionsIdsSelected,
        shipmentTypeSelected: filterForProductData?.shipmentTypeSelected,
        priceToSelected: filterForProductData?.priceToSelected,
        priceFromSelected: filterForProductData?.priceFromSelected,
        ratingValueSelected: filterForProductData?.ratingValueSelected
    );
  }

}
