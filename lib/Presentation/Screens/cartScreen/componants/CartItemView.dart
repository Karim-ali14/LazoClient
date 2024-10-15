import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';

class CartItemView extends StatefulWidget {
  final ShowCartDetails200ResponseDataCartItemsInner? cartItem;
  const CartItemView({super.key, required this.cartItem});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              print("Delete Item");
            },
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: AppTheme.mainAppColor,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                color: AppTheme.appGrey6,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(1)),
                      child: ImageView(
                        width: 74,
                        height: 74,
                        initialImg: (widget.cartItem?.type ?? "") ==
                                CartItemType.Product.name.toLowerCase()
                            ? widget.cartItem?.product?.imagePath ??
                                ""
                            : widget.cartItem?.service?.imagePath ?? "",
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (widget.cartItem?.type ?? "") ==
                                  CartItemType.Product.name.toLowerCase()
                              ? widget.cartItem?.product?.name ?? ""
                              : widget.cartItem?.service?.name ?? "",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w500,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          width: 240,
                          height: 25,
                          child: Text(
                            (widget.cartItem?.type ?? "") ==
                                    CartItemType.Product.name.toLowerCase()
                                ? widget.cartItem?.product?.lists?.map((item) => item.name).join(", ") ?? ""
                                : widget.cartItem?.service?.lists?.map((item) => item.name).join(", ") ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTheme
                                .styleWithTextAppGrey7AdelleSansExtendedFonts10w400
                                .copyWith(height: 1.2),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (widget.cartItem?.type ?? "") ==
                                      CartItemType.Product.name.toLowerCase()
                                  ? "SAR ${countItemPrice(widget.cartItem?.product?.priceAfterDiscount ?? 0, widget.cartItem?.quantity ?? 1)}"
                                  : "SAR ${countItemPrice(widget.cartItem?.service?.priceAfterDiscount ?? 0, widget.cartItem?.quantity ?? 1)}",
                              style: AppTheme
                                  .styleWithTextRedAdelleSansExtendedFonts16w500,
                            ),
                            (widget.cartItem?.type ?? "") ==
                                        CartItemType.Product.name
                                            .toLowerCase() &&
                                    (widget.cartItem?.product?.price
                                                ?.toDouble() ??
                                            0.0) >
                                        (widget.cartItem?.product
                                                ?.priceAfterDiscount
                                                ?.toDouble() ??
                                            0.0)
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "SAR ${countItemPrice(widget.cartItem?.product?.price ?? 0, widget.cartItem?.quantity ?? 1)}",
                                        style: AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts12w400
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            (widget.cartItem?.type ?? "") ==
                                        CartItemType.Service.name
                                            .toLowerCase() &&
                                    (widget.cartItem?.service?.price
                                                ?.toDouble() ??
                                            0.0) >
                                        (widget.cartItem?.service
                                                ?.priceAfterDiscount
                                                ?.toDouble() ??
                                            0.0)
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "SAR ${countItemPrice(widget.cartItem?.service?.price ?? 0, widget.cartItem?.quantity ?? 1)}",
                                        style: AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts12w400
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      )
                                    ],
                                  )
                                : const SizedBox()
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Row(
                      children: <Widget>[
                        SVGIcons.incrementButtonSvgIcon(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            widget.cartItem?.quantity?.toString() ?? "",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts18w500,
                          ),
                        ),
                        SVGIcons.decrementButtonSvgIcon(),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppTheme.mainAppColorLight2,
                          borderRadius: BorderRadius.circular(4)),
                      height: 26,
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          SVGIcons.editIcon(),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Edit",
                            style: AppTheme
                                .styleWithTextMainAppColorAdelleSansExtendedFonts12w400,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double countItemPrice(num priceAfterDiscount, num quantity) {
    return (priceAfterDiscount * quantity).toDouble();
  }

  void incrementQuantity() {
    setState(() {
      (widget.cartItem?.quantity?.toInt()??0) + 1;
    });
  }

  void decrementQuantity() {
    setState(() {
      (widget.cartItem?.quantity?.toInt()??0) - 1;
    });
  }

}
