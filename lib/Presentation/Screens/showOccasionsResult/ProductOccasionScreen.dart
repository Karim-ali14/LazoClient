import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Utils/FilterUtils.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/data_list_view/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import '../home/Componants/CategoryFilterItemCard.dart';

typedef NavigateToItemDetails = Function(ItemType, int, String, List<int>);

class ProductOccasionSearchScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final ProductOccasionType? productType;
  final int? id;
  final TextEditingController? controller;
  final bool? showData;
  final VoidCallback? showAuthenticated;
  final NavigateToItemDetails? navigateToItemDetails;
  const ProductOccasionSearchScreen({
    super.key,
    this.productType,
    this.type,
    this.id,
    this.controller,
    this.showAuthenticated,
    this.navigateToItemDetails,
    this.showData,
  });

  @override
  ConsumerState<ProductOccasionSearchScreen> createState() =>
      _ProductSearchScreenState();
}

class _ProductSearchScreenState
    extends ConsumerState<ProductOccasionSearchScreen> {
  FilterData? filterForProductData;
  var currentPageForProducts = 1;

  @override
  Widget build(BuildContext context) {
    final productsState = widget.productType == ProductOccasionType.All
        ? ref.watch(getProductsStateNotifiers)
        : widget.productType == ProductOccasionType.Ready
            ? ref.watch(getReadyGiftsProductsStateNotifiers)
            : ref.watch(getUnreadyProductsStateNotifiers);
    filterForProductData = widget.productType == ProductOccasionType.All
        ? ref.watch(filterForProductStateNotifiers)
        : widget.productType == ProductOccasionType.Ready
            ? ref.watch(filterForReadyGiftProductStateNotifiers)
            : ref.watch(filterForUnReadyGiftProductStateNotifiers);
    final client = ref.watch(clientStateProvider);

    currentPageForProducts =
        productsState.data?.data?.products?.currentPage?.toInt() ?? 1;

    handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
        onSuccess: (res) {
      var id = res.data?.data?.productId;
      print("product id : $id");
      if (id != null) {
        ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref
          .read(getSellerDetailsWithProductStateNotifier.notifier)
          .handleAddProductToWishList(
              res.data?.data?.productId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getProductDetails.notifier).handelAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);
    });

    return Column(
      children: [
        Consumer(builder: (context, ref, child) {
          final categorySelectedState = ref
              .watch(widget.productType == ProductOccasionType.All
                  ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                  : widget.productType == ProductOccasionType.Ready
                      ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                      : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers)
              .toList();
          return categorySelectedState.isNotEmpty == true
              ? Container(
                  margin: EdgeInsetsDirectional.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2), // Shadow color
                        blurRadius: .9, // Blur effect
                        spreadRadius: .1, // Spread effect
                        offset: const Offset(0, .5), // Shadow position
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          clipBehavior: Clip.antiAlias,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppTheme.appGrey8, width: 1),
                          ),
                          child: InkWell(
                              onTap: () {
                                clearFilterData();
                                filterForProductData = null;
                                updateFilterData(
                                    filterForProductData,
                                    widget.productType ??
                                        ProductOccasionType.All);
                                updateNumberOfSelectedItems(
                                    filterForProductData);
                                currentPageForProducts = 1;
                                fetchProducts(currentPageForProducts);
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
                          width: MediaQuery.of(context).size.width * .7,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryFilterItemCard(
                                  height: 32,
                                  item: categorySelectedState[index],
                                  onSelectCategory: (item) {
                                    if (item?.type == FilterTypes.Categories) {
                                      filterForProductData
                                          ?.categoriesIdsSelected
                                          ?.remove(item?.id);
                                      updateNumberOfSelectedItems(
                                          filterForProductData);
                                    } else if (item?.type ==
                                        FilterTypes.Occasions) {
                                      filterForProductData?.occasionsIdsSelected
                                          ?.remove(item?.id);
                                      updateNumberOfSelectedItems(
                                          filterForProductData);
                                    } else if (item?.type ==
                                        FilterTypes.Rating) {
                                      filterForProductData?.ratingValueSelected
                                          ?.remove(item?.id);
                                      updateNumberOfSelectedItems(
                                          filterForProductData);
                                    } else if (item?.type == FilterTypes.Pice) {
                                      filterForProductData?.priceFromSelected =
                                          null;
                                      filterForProductData?.priceToSelected =
                                          null;
                                      updateNumberOfSelectedItems(
                                          filterForProductData);
                                    } else if (item?.type ==
                                        FilterTypes.ProductType) {
                                      filterForProductData
                                          ?.shipmentTypeSelected = null;
                                      updateNumberOfSelectedItems(
                                          filterForProductData);
                                    }

                                    ref
                                        .read(widget.productType ==
                                                ProductOccasionType.All
                                            ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                                                .notifier
                                            : widget.productType ==
                                                    ProductOccasionType.Ready
                                                ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                                                    .notifier
                                                : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                                                    .notifier)
                                        .removeItem(item);
                                    updateFilterData(
                                        filterForProductData,
                                        widget.productType ??
                                            ProductOccasionType.All);
                                    //
                                    currentPageForProducts = 1;
                                    fetchProducts(currentPageForProducts);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 12,
                                  ),
                              itemCount: categorySelectedState.length),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        }),
        productsState.state == DataState.EMPTY
            ? EmptyDataView(
                icon: SVGIcons.localSVG(searchIconNoDataSvg,
                    width: 114, height: 97),
                btuName: null,
                description:
                    "Oops! Use different keywords to see more results.",
                btuAction: () {},
              )
            : Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: AppTheme.appGrey12, width: 1)),
                ),
                child: DataListView<ProviderProduct>(
                    dataList: productsState.data?.data?.products?.data ??
                        (productsState.state == DataState.LOADING
                            ? [
                                ...List.generate(
                                    8, (index) => ProviderProduct())
                              ]
                            : []),
                    paginated: true,
                    gridView: true,
                    childAspectRatio: .79,
                    heightPresent: ref
                                .watch(widget.productType ==
                                        ProductOccasionType.All
                                    ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                                    : widget.productType ==
                                            ProductOccasionType.Ready
                                        ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                                        : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers)
                                .isNotEmpty ==
                            true
                        ? 0.623
                        : 0.699,
                    loadingHeightPresent: 0.725,
                    crossAxisSpacing: 18,
                    pageLoading: productsState.state == DataState.MORE_LOADING,
                    onBottomReached: () {
                      fetchProducts(++currentPageForProducts);
                    },
                    builder: (item) => Skeletonizer(
                          enabled: productsState.state == DataState.LOADING,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 0, vertical: 0),
                            child: ServiceAndProductItemCardHorizontal(
                              type: ItemType.Products,
                              product: item,
                              height: 156,
                              onAddItemToCart: (id) {
                                addProductToCart(id);
                              },
                              onAddItemToWishList: (id,collectionId,inWishlist) {
                                if (client != null) {
                                  productWishlistToggle(id);
                                } else {
                                  widget.showAuthenticated?.call();
                                }
                              },
                              onItemClick: (id, name, categoriesIds) {
                                widget.navigateToItemDetails?.call(
                                    ItemType.Products, id, name, categoriesIds);
                              },
                            ),
                          ),
                        )),
              )
      ],
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
        searchByName: widget.controller?.text.isEmpty == true
            ? null
            : widget.controller?.text);
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

  void productWishlistToggle(int id) {
    ref
        .read(productToggleStateNotifier.notifier)
        .toggle(productId: id.toString());
  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }

  void clearFilterData() {
    ref
        .read(widget.productType == ProductOccasionType.All
            ? updateOccasionAllProductListOfFilterSelectedStateNotifiers
                .notifier
            : widget.productType == ProductOccasionType.Ready
                ? updateOccasionReadyProductListOfFilterSelectedStateNotifiers
                    .notifier
                : updateOccasionUnReadyProductListOfFilterSelectedStateNotifiers
                    .notifier)
        .clearAll();
  }

  void updateFilterData(
      FilterData? filterForProductData, ProductOccasionType type) {
    ref
        .read(type == ProductOccasionType.All
            ? filterForProductStateNotifiers.notifier
            : type == ProductOccasionType.Ready
                ? filterForReadyGiftProductStateNotifiers.notifier
                : filterForUnReadyGiftProductStateNotifiers.notifier)
        .applyDataFilter(
            categoriesIdsSelected: filterForProductData?.categoriesIdsSelected,
            occasionsIdsSelected: filterForProductData?.occasionsIdsSelected,
            shipmentTypeSelected: filterForProductData?.shipmentTypeSelected,
            priceToSelected: filterForProductData?.priceToSelected,
            priceFromSelected: filterForProductData?.priceFromSelected,
            ratingValueSelected: filterForProductData?.ratingValueSelected);
  }
}
