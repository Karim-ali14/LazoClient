import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/DelayedAction.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';

typedef OnUpdateQuantity = Function(num, num);
typedef OnDeleteItem = Function(num);
typedef OnEditProduct = Function(ProductDetails?, int);
typedef OnEditService = Function(ServiceShowData?, int);

class CartItemView extends StatefulWidget {
  final OnUpdateQuantity onUpdateQuantity;
  final OnDeleteItem onDeleteItem;
  final OnEditProduct? onEditProduct;
  final OnEditService? onEditService;
  final CartItemsInner? cartItem;

  const CartItemView(
      {super.key,
      required this.cartItem,
      required this.onUpdateQuantity,
      required this.onDeleteItem,
      this.onEditProduct,
      this.onEditService});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  num? quantity = 1;
  DelayedAction delayedAction = DelayedAction();
  @override
  void initState() {
    quantity = widget.cartItem?.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              widget.onDeleteItem.call(widget.cartItem?.id ?? 0);
            },
            icon: Icons.delete,
            label: context.tr(deleteKey),
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
                      child: Skeleton.replace(
                        replacement: Container(
                          width: 74,
                          height: 74,
                          color: Colors.white,
                        ),
                        child: ImageView(
                          width: 74,
                          height: 74,
                          initialImg: (widget.cartItem?.type ?? "") ==
                                  CartItemType.Product.name.toLowerCase()
                              ? widget.cartItem?.product?.imagePath ?? ""
                              : widget.cartItem?.service?.imagePath ?? "",
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
                          child: Text(
                            (widget.cartItem?.type ?? "") ==
                                    CartItemType.Product.name.toLowerCase()
                                ? widget.cartItem?.product?.name ?? ""
                                : widget.cartItem?.service?.name ?? "",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts16w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 240,
                          height: widget.cartItem?.productSelectedListItemsNames
                                      ?.isNotEmpty ==
                                  true || widget.cartItem?.serviceSelectedListItemsNames
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
                            child: Text(
                              (widget.cartItem?.type ?? "") ==
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
                        SizedBox(
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
                              Text(
                                (widget.cartItem?.type ?? "") ==
                                        CartItemType.Product.name.toLowerCase()
                                    ? "${context.tr(sarKey)} ${countItemPrice(widget.cartItem?.product?.priceAfterDiscount ?? 0, widget.cartItem?.quantity ?? 1)}"
                                    : "${context.tr(sarKey)} ${countItemPrice(widget.cartItem?.service?.priceAfterDiscount ?? 0, widget.cartItem?.quantity ?? 1)}",
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
                                          "${context.tr(sarKey)} ${countItemPrice(widget.cartItem?.product?.price ?? 0, widget.cartItem?.quantity ?? 1)}",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
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
                                          "${context.tr(sarKey)} ${countItemPrice(widget.cartItem?.service?.price ?? 0, widget.cartItem?.quantity ?? 1)}",
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
                  height: 16,
                ),
                Skeleton.ignore(
                  child: Row(
                    children: [
                      Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                setState(() {
                                  quantity = (quantity ?? 1) + 1;
                                });
                                delayedAction.startTimer(Duration(seconds: 2),
                                    () {
                                  widget.onUpdateQuantity.call(
                                      (widget.cartItem?.id ?? 0),
                                      (quantity ?? 1));
                                });
                              },
                              child: SVGIcons.incrementButtonSvgIcon()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              quantity?.toString() ?? "",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts18w500,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                if ((quantity ?? 1) > 1) {
                                  setState(() {
                                    quantity = (quantity ?? 1) - 1;
                                  });
                                  delayedAction.startTimer(Duration(seconds: 2),
                                      () {
                                    widget.onUpdateQuantity.call(
                                        (widget.cartItem?.id ?? 0),
                                        (quantity ?? 1));
                                  });
                                }
                              },
                              child: SVGIcons.decrementButtonSvgIcon()),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          if ((widget.cartItem?.type ?? "") ==
                              CartItemType.Product.name.toLowerCase()) {
                            widget.onEditProduct?.call(widget.cartItem?.product,
                                (widget.cartItem?.id ?? 0).toInt());
                          } else {
                            widget.onEditService?.call(widget.cartItem?.service,
                                (widget.cartItem?.id ?? 0).toInt());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.mainAppColorLight2,
                              borderRadius: BorderRadius.circular(4)),
                          height: 26,
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              SVGIcons.editIcon(),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                context.tr(editKey),
                                style: AppTheme
                                    .styleWithTextMainAppColorAdelleSansExtendedFonts12w400,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
      (widget.cartItem?.quantity?.toInt() ?? 0) + 1;
    });
  }

  void decrementQuantity() {
    setState(() {
      (widget.cartItem?.quantity?.toInt() ?? 0) - 1;
    });
  }
}
