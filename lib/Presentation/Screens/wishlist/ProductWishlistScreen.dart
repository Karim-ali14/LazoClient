import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import '../home/Componants/CategoryFilterItemCard.dart';

typedef NavigateToItemDetails = Function(ItemType, int, String, List<int>);

class ProductWishlistScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final ProductOccasionType? productType;
  final int? id;
  final VoidCallback? showAuthenticated;
  final NavigateToItemDetails? navigateToItemDetails;
  const ProductWishlistScreen({
    super.key,
    this.productType,
    this.type,
    this.id,
    this.showAuthenticated,
    this.navigateToItemDetails,
  });

  @override
  ConsumerState<ProductWishlistScreen> createState() =>
      _ProductSearchScreenState();
}

class _ProductSearchScreenState extends ConsumerState<ProductWishlistScreen> {
  FilterData? filterForProductData;
  var currentPageForProducts = 1;

  @override
  Widget build(BuildContext context) {
    final productsState = widget.productType == ProductOccasionType.All
        ? ref.watch(getWishListItemsStateNotifier)
        : widget.productType == ProductOccasionType.Ready
            ? ref.watch(getWishListReadyGiftsProductsStateNotifier)
            : ref.watch(getWishListUnReadyGiftsProductsStateNotifier);
    final client = ref.watch(clientStateProvider);

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
      print("productId : ${res.data?.data?.productId} categoriesIds : ${res.data?.data?.categoriesIds} inWishlist : ${res.data?.data?.inWishlist} collectionId : ${res.data?.data?.collectionId}");
      ref
          .read(getSellerDetailsWithProductStateNotifier.notifier)
          .handleAddProductToWishList(
              res.data?.data?.productId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false,
              res.data?.data?.collectionId);

      ref.read(getProductDetails.notifier).handelAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);

      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);

      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0,
          res.data?.data?.inWishlist ?? false,
          res.data?.data?.collectionId);
    });

    return Column(
      children: [
        productsState.state == DataState.EMPTY
            ? EmptyDataView(
                icon: SVGIcons.localSVG(noFavoriteDataIcon,
                    width: 79.w, height: 88.h),
                btuName: null,
                description:
                    "Looks like this collection has no gifts saved yet.",
                btuAction: () {},
              )
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: DataListView<ProviderProduct>(
                    dataList: productsState.data?.data?.products ??
                        (productsState.state == DataState.LOADING
                            ? [
                                ...List.generate(
                                    8, (index) => ProviderProduct())
                              ]
                            : []),
                    paginated: true,
                    gridView: true,
                    childAspectRatio: .79,
                    heightPresent: .75.h,
                    loadingHeightPresent: .83,
                    crossAxisSpacing: 18,
                    pageLoading: productsState.state == DataState.MORE_LOADING,
                    onBottomReached: () {},
                    builder: (item) => Skeletonizer(
                          enabled: productsState.state == DataState.LOADING,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 0, vertical: 0),
                            child: ServiceAndProductItemCardHorizontal(
                              type: ItemType.Products,
                              product: item,
                              height: 156.h,
                              onAddItemToCart: (id) {
                                addProductToCart(id);
                              },
                              onAddItemToWishList: (id, collectionId,inWishlist) {
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
