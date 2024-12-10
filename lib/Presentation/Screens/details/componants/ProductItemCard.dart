import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/Assets.dart';
import '../../../../../Data/Network/lib/api.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Localization/Keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

typedef OnItemClick = Function(int);

class ProductItemCard extends StatefulWidget {
  final ClientOrderDetailsOrderItemsInner? item;
  final OnItemClick onItemClick;
  final double? insideWidth;
  const ProductItemCard(
      {super.key,
      this.item,
      required this.onItemClick,
      this.insideWidth = 260});

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemClick.call(widget.item?.id?.toInt() ?? 0);
      },
      child: IntrinsicHeight(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.appGrey8, width: 1)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 74,
                      width: 74,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: ImageView(
                        width: MediaQuery.of(context).size.width,
                        height: 122,
                        initialImg: widget.item?.product != null
                            ? widget.item?.product?.imagePath
                            : widget.item?.service?.coverImagePath,
                        placeHolder: placeholder,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPaddingHorizontal,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Row(
                            children: [
                              Text(
                                widget.item?.product != null
                                    ? widget.item?.product?.name ?? ""
                                    : widget.item?.service?.name ?? "",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts16w500,
                              ),
                              const Spacer(),
                              Text(
                                widget.item?.id?.toString() ?? "",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                        widget.item?.selectedProductsListItemsNames.isNotEmpty == true || widget.item?.selectedServicesListItemsNames.isNotEmpty == true
                            ? const SizedBox(
                          height: 5,
                        ):const SizedBox(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Text(
                            "${widget.item?.product != null ? widget.item?.selectedProductsListItemsNames.join(", ") : widget.item?.selectedServicesListItemsNames.join(", ")}",
                            style: AppTheme
                                .styleWithTextAppGrey7AdelleSansExtendedFonts10w400,
                          ),
                        ),
                        widget.item?.selectedProductsListItemsNames.isNotEmpty == true || widget.item?.selectedServicesListItemsNames.isNotEmpty == true ?const SizedBox(
                          height: 5,
                        ):const SizedBox(),
                        Row(
                          children: [
                            Text(
                              "${context.tr(sarKey)} ${widget.item?.product != null ? widget.item?.product?.priceAfterDiscount : widget.item?.service?.priceAfterDiscount}",
                              style: AppTheme
                                  .styleWithTextRedAdelleSansExtendedFonts16w500,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            if (widget.item?.product != null &&
                                (widget.item?.product?.price ?? 0) >
                                    (widget.item?.product?.priceAfterDiscount ??
                                        0))
                              Text(
                                "${context.tr(sarKey)} ${widget.item?.product != null ? widget.item?.product?.price : widget.item?.service?.price}",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                    .copyWith(
                                        height: 1.2,
                                        decoration: TextDecoration.lineThrough),
                              )
                            else if (widget.item?.service != null &&
                                (widget.item?.service?.price ?? 0) >
                                    (widget.item?.service?.priceAfterDiscount ??
                                        0))
                              Text(
                                  "${context.tr(sarKey)} ${widget.item?.product != null ? widget.item?.product?.price : widget.item?.service?.price}",
                                  style: AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                      .copyWith(
                                          height: 1.2,
                                          decoration:
                                              TextDecoration.lineThrough))
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Row(
                            children: [
                              widget.item?.provider != null
                                  ? Text(
                                      context.tr(soldByKey),
                                      style: AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts10w700,
                                    )
                                  : SizedBox(),
                              SizedBox(
                                width: 5,
                              ),
                              widget.item?.provider != null
                                  ? Text(
                                      "${widget.item?.provider?.name}",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts10w700,
                                    )
                                  : const SizedBox(),
                              const Spacer(),
                              widget.item?.statusId == 11
                                  ? Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                              color: AppTheme.mainAppColor,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          context.tr(cancelledKey),
                                          style: AppTheme
                                              .styleWithTextMainAppColorAdelleSansExtendedFonts10w400,
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
              ],
            )),
      ),
    );
  }
}
