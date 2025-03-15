import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Constants/Assets.dart';
import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';
import 'CircleImage.dart';

typedef OnItemClick = Function(int, String, List<int>);
typedef OnAddItemClick = Function(int);

class ServiceAndProductItemCardHorizontal extends StatefulWidget {
  final ItemType type;
  final ProviderProduct? product;
  final ServiceShowData? service;
  final OnAddItemClick onAddItemToCart;
  final OnAddItemClick onAddItemToWishList;
  final OnItemClick onItemClick;
  final double? width;
  const ServiceAndProductItemCardHorizontal(
      {required this.type,
      super.key,
      this.product,
      this.service,
      required this.onAddItemToCart,
      required this.onAddItemToWishList,
      required this.onItemClick,
      this.width});

  @override
  State<ServiceAndProductItemCardHorizontal> createState() =>
      _ServiceAndProductItemCardHorizontalState();
}

class _ServiceAndProductItemCardHorizontalState
    extends State<ServiceAndProductItemCardHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Stack(children: [
        InkWell(
          onTap: () {

            var categoriesIds = widget.type == ItemType.Products
                ? widget.product?.categories
                        ?.map((item) => (item.id ?? 0).toInt())
                        .toList() ??
                    []
                : widget.service?.categories
                        .map((item) => (item.id ?? 0).toInt())
                        .toList() ??
                    [];

            print("Selected Product Categories: ${widget.product?.categories}");
            print("Selected Product : $categoriesIds");
            widget.onItemClick.call(
                (widget.type == ItemType.Products
                        ? widget.product?.id ?? 0
                        : widget.service?.id ?? 0)
                    .toInt(),
                widget.type == ItemType.Products
                    ? widget.product?.name ?? ""
                    : widget.service?.name ?? "",
                categoriesIds);
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Skeleton.replace(
                  replacement: Container(
                    width: double.infinity,
                    height: widget.width?.toDouble(),
                    color: Colors.white,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: widget.width?.toDouble(),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(children: [
                      ImageView(
                        width: double.infinity,
                        height: widget.width?.toDouble(),
                        initialImg: widget.type == ItemType.Products
                            ? widget.product?.images?.isNotEmpty == true
                                ? widget.product?.images?.first.imagePath
                                : ""
                            : widget.service?.imagePath,
                        placeHolder: placeHolderForCardsSvg,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.black.withOpacity(.4)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.type == ItemType.Products
                                      ? "${widget.product?.overallRating}"
                                      : "${widget.service?.overallRating}",
                                  style: AppTheme
                                      .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                SVGIcons.smallStarIcon(size: 12),
                                Text(
                                  " (${"${widget.type == ItemType.Products ? "${widget.product?.ratingsCount}" : "${widget.service?.ratingsCount}"}"})",
                                  style: AppTheme
                                      .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton.replace(
                        replacement: Container(
                          width: 30,
                          height: 10,
                          color: Colors.white,
                        ),
                        child: Text(
                          widget.type == ItemType.Products
                              ? widget.product?.name ?? ""
                              : widget.service?.name ?? "",
                          style: AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: widget.type == ItemType.Products
                            ? widget.product?.provider?.name?.isNotEmpty == true
                                ? 4
                                : 0
                            : widget.service?.provider?.name?.isNotEmpty == true
                                ? 4
                                : 0,
                      ),
                      Skeleton.ignore(
                        child: widget.type == ItemType.Products
                            ? widget.product?.provider?.name?.isNotEmpty == true
                                ? Text(
                                    "By ${widget.product?.provider?.name}",
                                    style: AppTheme
                                        .styleWithTextAppGrey18ColorAdelleSansExtendedFonts12w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const SizedBox()
                            : widget.service?.provider?.name?.isNotEmpty == true
                                ? Text(
                                    "By ${widget.service?.provider?.name ?? ""}",
                                    style: AppTheme
                                        .styleWithTextAppGrey18ColorAdelleSansExtendedFonts12w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const SizedBox(),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Skeleton.replace(
                            replacement: Container(
                              width: 50,
                              height: 20,
                              color: Colors.white,
                            ),
                            child: Text(
                              "SAR ${widget.type == ItemType.Products ? widget.product?.priceAfterDiscount ?? "" : widget.service?.priceAfterDiscount ?? ""}",
                              style: AppTheme
                                  .styleWithTextAppRedColorAdelleSansExtendedFonts14w400,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          widget.type == ItemType.Products
                              ? widget.product?.priceAfterDiscount !=
                                      widget.product?.price
                                  ? Skeleton.ignore(
                                      child: Text(
                                        "SAR ${widget.product?.price}",
                                        style: AppTheme
                                            .styleWithTextAppGrey18AdelleSansExtendedFonts14w400
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      ),
                                    )
                                  : SizedBox()
                              : widget.service?.priceAfterDiscount !=
                                      widget.service?.price
                                  ? Skeleton.ignore(
                                      child: Text(
                                        "SAR ${widget.service?.price}",
                                        style: AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts11w400
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      ),
                                    )
                                  : SizedBox(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: InkWell(
                onTap: () {
                  widget.onAddItemToWishList(widget.type == ItemType.Products
                      ? widget.product?.id?.toInt() ?? 0
                      : widget.service?.id?.toInt() ?? 0);
                },
                child: Skeleton.ignore(
                    child: Row(children: [
                  widget.type == ItemType.Products &&
                          widget.product?.type ==
                              ProductTypes.various_gifts.name
                      ? Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.black.withOpacity(.3)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SVGIcons.localSVG(giftBoxIcon,
                                  width: 11, height: 11),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Ready Gift",
                                style: AppTheme
                                    .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  widget.type == ItemType.Products
                      ? widget.product?.inWishlist == true
                          ? SVGIcons.activeFavoriteIcon()
                          : SVGIcons.unFavoriteIcon()
                      : widget.service?.inWishlist == true
                          ? SVGIcons.activeFavoriteIcon()
                          : SVGIcons.unFavoriteIcon(),
                ]))),
          ),
        )
      ]),
    );
  }
}
