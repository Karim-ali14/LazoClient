import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/FilterUtils.dart';
import '../../../Utils/SearchStorage.dart';
import '../../../main.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/SearchLocalStoragStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/RecentScreen.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';

typedef NavigateToItemDetails = Function(ItemType, int, String, List<int>);

class ProductSearchScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final int? id;
  final TextEditingController? controller;
  final bool? showData;
  final VoidCallback? showAuthenticated;
  final NavigateToItemDetails? navigateToItemDetails;
  const ProductSearchScreen( {
    super.key,
    this.type,
    this.id,
    this.controller,
    this.showAuthenticated,
    this.navigateToItemDetails,this.showData,
  });

  @override
  ConsumerState<ProductSearchScreen> createState() =>
      _ProductSearchScreenState();
}

class _ProductSearchScreenState extends ConsumerState<ProductSearchScreen> {
  FilterData? filterForProductData;
  var currentPageForProducts = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecentSearches();
    });
    super.initState();
  }

  Future<void> _loadRecentSearches() async {
    ref
        .read(productSearchLocalStorageStateNotifier.notifier)
        .updateList(prefs.getStringList(SearchStorage.product_key) ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(getProductsStateNotifiers);
    final recentSearches = ref.watch(productSearchLocalStorageStateNotifier);
    filterForProductData = ref.watch(filterForProductStateNotifiers);
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

    return widget.controller?.text.toString().isNotEmpty == true || getNumberOfFilterItems(filterForProductData) > 0
        ? productsState.state == DataState.EMPTY
            ? EmptyDataView(
                icon: SVGIcons.localSVG(searchIconNoDataSvg,
                    width: 114, height: 97),
                btuName: "View our best products items",
                description:
                    "Oops! Use different keywords to see more results.",
                btuAction: () {
                  navigateToSeeAllBestProductAndService(
                      context.tr(bestProductsKey), ItemType.Products);
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 7),
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
                    childAspectRatio: .75,
                    heightPresent: 0.81,
                    loadingHeightPresent: 0.73,
                    crossAxisSpacing: 15,
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
                              height: 160,
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
              )
        : RecentScreen(
            recentSearches: recentSearches,
            itemSearchClick: (result) {
              widget.controller?.text = result;
              SearchStorage.saveSearch(
                  key: SearchStorage.service_key, query: result);
              widget.controller?.text = result;
              fetchProducts(1);
            }, onClearBtuClick: (){
              ref.read(productSearchLocalStorageStateNotifier.notifier).clearData();
              },
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
  void navigateToSeeAllBestProductAndService(String title, ItemType type,
      {int? occasionId}) async {
    await context.push(R_ShowBestProductOrService,
        extra: {"type": type, "title": title, "occasionId": occasionId});

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
  }

}
