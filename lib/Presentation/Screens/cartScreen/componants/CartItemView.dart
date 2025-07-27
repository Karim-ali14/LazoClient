import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/update_item_quantity.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Presentation/Widgets/TextPrice.dart';
import 'package:lazo_client/Utils/DelayedAction.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Assets.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';
import '../../../../Utils/Snaks.dart';
import '../../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../../Widgets/TextWithoutPadding.dart';

typedef OnUpdateQuantity = Function(num, num);
typedef OnDeleteItem = Function(num);
typedef ToggleItem = Function(CartItemType, num,String,bool);
typedef OnProductClickListener = Function(ProductDetails?, int?);
typedef OnServiceClickListener = Function(ServiceShowData?, int?);

class CartItemView extends ConsumerStatefulWidget {
  final OnUpdateQuantity onUpdateQuantity;
  final OnDeleteItem onDeleteItem;
  final ToggleItem toggleItem;
  final OnProductClickListener? onProductClickListener;
  final OnServiceClickListener? onServiceClickListener;
  final CartItemsInner? cartItem;
  final OrderItemsInner? orderItem;
  final bool? isReadOnlyMode;
  final bool? isOrderMode;

  const CartItemView({
    super.key,
    required this.cartItem,
    required this.orderItem,
    required this.onUpdateQuantity,
    required this.onDeleteItem,
    this.onProductClickListener,
    this.onServiceClickListener,
    this.isReadOnlyMode,
    required this.toggleItem,
    this.isOrderMode,
  });

  @override
  ConsumerState<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends ConsumerState<CartItemView> {
  num? quantity = 1;
  @override
  void initState() {
    quantity = widget.cartItem?.quantity;
    print("asdfasdfsda ${widget.orderItem}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(1)),
                  child: Skeleton.replace(
                    replacement: Container(
                      width: 87.w,
                      height: 85.h,
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        onItemClick(true);
                      },
                      child: Container(
                        width: 87.w,
                        height: 85.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Stack(
                          children: [
                            ImageView(
                              width: 87.w,
                              height: 85.h,
                              initialImg: widget.isOrderMode == true
                                  ? (widget.orderItem?.type ?? "") ==
                                  CartItemType.Product.name
                                      .toLowerCase()
                                  ? widget.orderItem?.product?.imagePath ??
                                  ""
                                  : widget.orderItem?.service?.imagePath ??
                                  ""
                                  : (widget.cartItem?.type ?? "") ==
                                  CartItemType.Product.name
                                      .toLowerCase()
                                  ? widget.cartItem?.product?.imagePath ??
                                  ""
                                  : widget.cartItem?.service?.imagePath ??
                                  "",
                            ),
                            widget.cartItem?.product != null && widget.cartItem?.product?.type ==
                                ProductTypes.ready_made_gifts.name ? Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 3),
                                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SVGIcons.localSVG(giftBoxIcon,
                                        width: 11, height: 11),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    TextWithoutPadding(
                                      "Ready Gift",
                                      style: AppTheme
                                          .styleWithTextWhiteAdelleSansExtendedFonts12w400.copyWith(fontSize: 10.sp),
                                    )
                                  ],
                                ),
                              ),
                            ):const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton.replace(
                      replacement: Container(
                        width: 120,
                        height: 10,
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          onItemClick(true);
                        },
                        child: TextWithoutPadding(
                          widget.isOrderMode == true
                              ? (widget.orderItem?.type ?? "") ==
                                      CartItemType.Product.name.toLowerCase()
                                  ? widget.orderItem?.product?.name ?? ""
                                  : widget.orderItem?.service?.name ?? ""
                              : (widget.cartItem?.type ?? "") ==
                                      CartItemType.Product.name.toLowerCase()
                                  ? widget.cartItem?.product?.name ?? ""
                                  : widget.cartItem?.service?.name ?? "",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 240,
                      height: widget.isOrderMode == true
                          ? widget.orderItem?.selectedProductsListItemsNames
                                          ?.isNotEmpty ==
                                      true ||
                                  widget
                                          .orderItem
                                          ?.selectedServicesListItemsNames
                                          ?.isNotEmpty ==
                                      true
                              ? 25
                              : 10
                          : widget.cartItem?.productSelectedListItemsNames
                                          ?.isNotEmpty ==
                                      true ||
                                  widget.cartItem?.serviceSelectedListItemsNames
                                          ?.isNotEmpty ==
                                      true
                              ? 25
                              : 10,
                      child: Skeleton.replace(
                        replacement: Container(
                          width: 120,
                          height: 20,
                          color: Colors.white,
                        ),
                        child: TextWithoutPadding(
                          widget.isOrderMode == true
                              ? (widget.orderItem?.type ?? "") ==
                                      CartItemType.Product.name.toLowerCase()
                                  ? widget.orderItem
                                          ?.selectedProductsListItemsNames?.join(",") ??
                                      ""
                                  : widget.orderItem
                                          ?.selectedServicesListItemsNames?.join(",") ??
                                      ""
                              : (widget.cartItem?.type ?? "") ==
                                      CartItemType.Product.name.toLowerCase()
                                  ? widget.cartItem
                                          ?.productSelectedListItemsNames ??
                                      ""
                                  : widget.cartItem
                                          ?.serviceSelectedListItemsNames ??
                                      "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppTheme
                              .styleWithTextAppGrey7AdelleSansExtendedFonts10w400
                              .copyWith(height: 1.2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Skeleton.replace(
                      replacement: Container(
                        width: 120,
                        height: 20,
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextPrice(
                            widget.isOrderMode == true
                                ? (widget.orderItem?.type ?? "") ==
                                        CartItemType.Product.name.toLowerCase()
                                    ? "${countItemPrice(priceAfterDiscount: widget.orderItem?.totalPriceAfterDiscount ?? 0,quantity: widget.cartItem?.quantity ?? 1,
                                cartPrice:  widget.orderItem?.cardPrice ?? 0)}"
                                    : "${countItemPrice(priceAfterDiscount: widget.orderItem?.totalPriceAfterDiscount ?? 0,quantity: widget.cartItem?.quantity ?? 1,
                                cartPrice:  widget.orderItem?.cardPrice ?? 0)}"
                                : (widget.cartItem?.type ?? "") ==
                                        CartItemType.Product.name.toLowerCase()
                                    ? "${countItemPrice(priceAfterDiscount:  widget.cartItem?.cartItemTotalAfterDiscount ?? 0,quantity: widget.cartItem?.quantity ?? 1,
                                cartPrice:  widget.cartItem?.cardPrice ?? 0,deliveryPrice: widget.cartItem?.deliveryPrice ?? 0)}"
                                    : "${countItemPrice(priceAfterDiscount:  widget.cartItem?.cartItemTotalAfterDiscount ?? 0,quantity: widget.cartItem?.quantity ?? 1,
                                cartPrice:  widget.cartItem?.cardPrice ?? 0,deliveryPrice: widget.cartItem?.deliveryPrice ?? 0)}",
                            style: AppTheme
                                .styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
                          ),
                          widget.isOrderMode == true
                              ? (widget.orderItem?.type ?? "") ==
                                          CartItemType.Product.name
                                              .toLowerCase() &&
                                      (widget.orderItem?.totalPriceBeforeDiscount
                                                  ?.toDouble() ??
                                              0.0) >
                                          (widget.orderItem?.totalPriceAfterDiscount
                                                  ?.toDouble() ??
                                              0.0)
                                  ? Row(
                                      children: [
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        TextPrice(
                                          "${countItemPrice(priceAfterDiscount:  widget.orderItem?.totalPriceBeforeDiscount ?? 0,quantity:  widget.orderItem?.quantity ?? 1,cartPrice:  widget.orderItem?.cardPrice ?? 0)}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      ],
                                    )
                                  : const SizedBox()
                              : (widget.cartItem?.type ?? "") ==
                                          CartItemType.Product.name
                                              .toLowerCase() &&
                                      (widget.cartItem?.cartItemTotalBeforeDiscount
                                                  ?.toDouble() ??
                                              0.0) >
                                          (widget.cartItem?.cartItemTotalAfterDiscount
                                                  ?.toDouble() ??
                                              0.0)
                                  ? Row(
                                      children: [
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        TextPrice(
                                          "${countItemPrice(priceAfterDiscount:  widget.cartItem?.cartItemTotalBeforeDiscount ?? 0,quantity:  widget.cartItem?.quantity ?? 1,
                                              cartPrice:  widget.orderItem?.cardPrice ?? 0)}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                          widget.isOrderMode == true
                              ? (widget.orderItem?.type ?? "") ==
                                          CartItemType.Service.name
                                              .toLowerCase() &&
                                      (widget.orderItem?.totalPriceBeforeDiscount
                                                  ?.toDouble() ??
                                              0.0) >
                                          (widget.orderItem?.totalPriceAfterDiscount
                                                  ?.toDouble() ??
                                              0.0)
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: 6,
                                        ),
                                        TextPrice(
                                          "${countItemPrice(priceAfterDiscount:  widget.orderItem?.totalPriceBeforeDiscount ?? 0,quantity:  widget.orderItem?.quantity ?? 1,
                                              cartPrice:  widget.orderItem?.cardPrice ?? 0)}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      ],
                                    )
                                  : const SizedBox()
                              : (widget.cartItem?.type ?? "") ==
                                          CartItemType.Service.name
                                              .toLowerCase() &&
                                      (widget.cartItem?.cartItemTotalBeforeDiscount
                                                  ?.toDouble() ??
                                              0.0) >
                                          (widget.cartItem?.cartItemTotalAfterDiscount
                                                  ?.toDouble() ??
                                              0.0)
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: 6,
                                        ),
                                        TextPrice(
                                          "${countItemPrice(priceAfterDiscount:  widget.cartItem?.cartItemTotalBeforeDiscount?? 0,
                                              quantity:  widget.cartItem?.quantity ?? 1,cartPrice:  widget.cartItem?.cardPrice ?? 0,
                                              deliveryPrice: widget.cartItem?.deliveryPrice??0)}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      ],
                                    )
                                  : const SizedBox()
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: widget.isReadOnlyMode == false ? 16 : 5,
            ),
            widget.isReadOnlyMode == false
                ? Skeleton.ignore(
                    child: Row(
                      children: [
                        UpdateItemQuantity(
                            initQuantity: quantity?.toInt(),
                            cartItem: widget.cartItem,
                            onUpdateQuantity: widget.onUpdateQuantity),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                changeFavoriteItemState();
                              },
                              child: SVGIcons.localSVG(
                                (widget.cartItem?.type ?? "") ==
                                        CartItemType.Product.name.toLowerCase()
                                    ? widget.cartItem?.product?.inWishlist ==
                                            true
                                        ? favoriteCartItemIcons
                                        : unFavoriteCartItemIcons
                                    : widget.cartItem?.service?.inWishlist ==
                                            true
                                        ? favoriteCartItemIcons
                                        : unFavoriteCartItemIcons,
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            const SizedBox(
                              width: defaultPaddingHorizontal,
                            ),
                            InkWell(
                              onTap: () {
                                widget.onDeleteItem
                                    .call(widget.cartItem?.id ?? 0);
                              },
                              child: SVGIcons.localSVG(
                                deleteCartItemIcons,
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  double countItemPrice(
      {num priceAfterDiscount = 0,
      num quantity = 0,
      num cartPrice = 0,
      num deliveryPrice = 0}) {
    return (priceAfterDiscount).toDouble();
  }

  void incrementQuantity() {
    setState(() {
      (widget.cartItem?.quantity?.toInt() ?? 0) + 1;
    });
  }

  void decrementQuantity() {
    setState(() {
      (widget.cartItem?.quantity?.toInt() ?? 0) - 1;
    });
  }

  void onItemClick(bool editable) {
    if ((widget.cartItem?.type ?? "") ==
        CartItemType.Product.name.toLowerCase()) {
      widget.onProductClickListener?.call(widget.cartItem?.product,
          editable ? (widget.cartItem?.id ?? 0).toInt() : null);
    } else {
      widget.onServiceClickListener?.call(widget.cartItem?.service,
          editable ? (widget.cartItem?.id ?? 0).toInt() : null);
    }
  }

  void changeFavoriteItemState() {
    if ((widget.cartItem?.type ?? "") ==
        CartItemType.Product.name.toLowerCase()) {
      // widget.cartItem?.product?.inWishlist =
      //     !(widget.cartItem?.product?.inWishlist ?? false);
      widget.toggleItem
          .call(CartItemType.Product, widget.cartItem?.product?.id ?? 0,widget.cartItem?.product?.wishlistCollectionId??"",widget.cartItem?.product?.inWishlist ?? false);
    } else {
      // widget.cartItem?.service?.inWishlist =
      //     !(widget.cartItem?.service?.inWishlist ?? false);

      widget.toggleItem
          .call(CartItemType.Service, widget.cartItem?.service?.id ?? 0,widget.cartItem?.service?.wishlistCollectionId??"",widget.cartItem?.service?.inWishlist ?? false);
    }
  }
}
