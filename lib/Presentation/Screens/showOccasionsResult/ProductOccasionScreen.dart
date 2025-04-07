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
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';

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
              res.data?.data?.inWishlist ?? false);

      ref.read(getProductDetails.notifier).handelAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);

      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);

      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
    });

    return productsState.state == DataState.EMPTY
        ? EmptyDataView(
            icon:
                SVGIcons.localSVG(searchIconNoDataSvg, width: 114, height: 97),
            btuName: null,
            description: "Oops! Use different keywords to see more results.",
            btuAction: () {},
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: AppTheme.appGrey12, width: 1)),
            ),
            child: DataListView<ProviderProduct>(
                dataList: productsState.data?.data?.products?.data ??
                    (productsState.state == DataState.LOADING
                        ? [...List.generate(8, (index) => ProviderProduct())]
                        : []),
                paginated: true,
                gridView: true,
                childAspectRatio: .79,
                heightPresent: 0.79,
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
                          onAddItemToWishList: (id) {
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
}
