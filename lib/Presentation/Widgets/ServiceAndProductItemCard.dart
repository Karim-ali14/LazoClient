import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';
import 'CircleImage.dart';

typedef OnItemClick = Function(int);

class ServiceAndProductItemCardHorizontal extends StatefulWidget {
  final ItemType type;
  final ProviderProduct? product;
  final ServiceShowData? service;
  final OnItemClick onAddItemToCart;
  final OnItemClick onAddItemToWishList;
  final OnItemClick onItemClick;
  final double? width;
  const ServiceAndProductItemCardHorizontal(
      {required this.type,
      super.key,
      this.product,
      this.service,
      required this.onAddItemToCart,
      required this.onAddItemToWishList,
      required this.onItemClick, this.width});

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
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.appGrey6),
          ),
          child: Column(
            children: [
              Skeleton.replace(
                replacement: Container(
                  width: double.infinity,
                  height: 121,
                  color: Colors.white,
                ),
                child: ImageView(
                  width: double.infinity,
                  height: 121,
                  initialImg: widget.type == ItemType.Products
                      ? widget.product?.images?.isNotEmpty == true ? widget.product?.images?.first.imagePath :""
                      : widget.service?.coverImagePath,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                            .styleWithTextBlackAdelleSansExtendedFonts14w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
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
                            "SAR ${widget.type == ItemType.Products ? widget.product?.priceAfterDiscount??"" : widget.service?.priceAfterDiscount??""}",
                            style: AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts16w500,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        widget.type == ItemType.Products
                            ? widget.product?.priceAfterDiscount ==
                                    widget.product?.price
                                ? Skeleton.ignore(
                                  child: Text(
                                      "SAR ${widget.product?.price}",
                                      style: AppTheme
                                          .styleWithTextGray7AdelleSansExtendedFonts12w400
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    ),
                                )
                                : SizedBox()
                            : widget.service?.priceAfterDiscount ==
                                    widget.service?.price
                                ? Skeleton.ignore(
                                  child: Text(
                                      "SAR ${widget.service?.price}",
                                      style: AppTheme
                                          .styleWithTextGray7AdelleSansExtendedFonts12w400
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    ),
                                )
                                : SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Skeleton.ignore(child: SVGIcons.smallStarIcon()),
                            SizedBox(
                              width: 3,
                            ),
                            Skeleton.replace(
                              replacement: Container(
                                width: 30,
                                height: 15,
                                color: Colors.white,
                              ),
                              child: Text(
                                widget.type == ItemType.Products
                                    ? "${widget.product?.overallRating}"
                                    : "${widget.service?.overallRating}",
                                style: AppTheme
                                    .styleWithTextGray7AdelleSansExtendedFonts12w400,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Skeleton.replace(
                          replacement: Container(
                            width: 10,
                            height: 15,
                            color: Colors.white,
                          ),
                          child: Text(
                            "(${"${widget.type == ItemType.Products ? "${widget.product?.ratingsCount}" : "${widget.service?.ratingsCount}"}"})",
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Skeleton.leaf(
                      child: AppButton(
                        width: context.getScreenSize.width,
                        height: 36,
                        onPress: () {
                          if(widget.type == ItemType.Products
                              && widget.product?.inCart == false ){
                            widget.onAddItemToCart.call(widget.product?.id?.toInt() ?? 0);
                          }
                          else if(widget.type == ItemType.Services
                              && widget.service?.inCart == false ){
                            widget.onAddItemToCart.call(widget.product?.id?.toInt() ?? 0);
                          }
                        },
                        child: Skeleton.ignore(
                          child: Text(
                            widget.type == ItemType.Products
                                ? widget.product?.inCart == true
                                    ? "Added"
                                    : "Add to cart"
                                : widget.service?.inCart == true
                                    ? "Added"
                                    : "Add to cart",
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Skeleton.ignore(child: SVGIcons.unFavoriteIcon()),
          ),
        )
      ]),
    );
  }
}
