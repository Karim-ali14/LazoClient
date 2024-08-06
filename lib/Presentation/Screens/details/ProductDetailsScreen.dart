import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductMultipleSelectItems.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductSingleSelectItems.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Eunms.dart';
import '../../Widgets/BannerCardItems.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TruncatedText.dart';
import 'componants/ProductRowItem.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String? productId;
  final ItemType? itemType;
  const ProductDetailsScreen({this.productId, this.itemType, super.key});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  void initState() {
    if (widget.itemType == ItemType.Products) {
      ref.read(getProductDetails.notifier).getProductDetails(productId: "151");
    } else {
      ref.read(getServiceDetails.notifier).getServiceDetails(serviceId: "151");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productItemState = ref.watch(getProductDetails);
    final serviceItemState = ref.watch(getServiceDetails);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerCardItems(
                  list: widget.itemType == ItemType.Products
                      ? (productItemState.data?.data?.images
                                  .map((item) => item.imagePath ?? "") ??
                              [])
                          .toList()
                      : (serviceItemState.data?.data?.images
                                  .map((item) => item.imagePath ?? "") ??
                              [])
                          .toList(),
                  height: 149,
                  width: MediaQuery.of(context).size.width,
                  showLoading: false,
                  showIndicator: false,
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    TruncatedText(
                        text:
                            "${widget.itemType == ItemType.Products ? productItemState.data?.data?.name : serviceItemState.data?.data?.name} ",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                        maxLength: 30),
                    Spacer(),
                    widget.itemType == ItemType.Products
                        ? Text(
                            "${productItemState.data?.data?.amount ?? 0} In Stock",
                            style: AppTheme
                                .styleWithTextPreparingColorAdelleSansExtendedFonts14w400,
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SAR ${widget.itemType == ItemType.Products ? productItemState.data?.data?.priceAfterDiscount ?? "" : serviceItemState.data?.data?.priceAfterDiscount ?? ""}",
                      style: AppTheme
                          .styleWithTextRedAdelleSansExtendedFonts20w700,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    widget.itemType == ItemType.Products
                        ? productItemState.data?.data?.priceAfterDiscount ==
                                productItemState.data?.data?.price
                            ? Text(
                                "SAR ${productItemState.data?.data?.price ?? ""}",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox()
                        : serviceItemState.data?.data?.priceAfterDiscount ==
                                serviceItemState.data?.data?.price
                            ? Text(
                                "SAR ${serviceItemState.data?.data?.price ?? ""}",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox(),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SVGIcons.smallStarIcon(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${productItemState.data?.data?.overallRating ?? 0}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w400,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "(${productItemState.data?.data?.ratingsCount ?? 0})",
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "All prices include VAT",
                  style:
                      AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Description",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandedText(
                  textValue:
                      "${widget.itemType == ItemType.Products ? productItemState.data?.data?.description : serviceItemState.data?.data?.description} ",
                  textStyle: AppTheme
                      .styleWithTextAppGrey15AdelleSansExtendedFonts14w400
                      .copyWith(height: 1.5),
                  maxLength: 200,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.appGrey8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 51,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.appGrey8),
                            color: AppTheme.appGrey9,
                          ),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.only(start: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "About Product",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Product Color",
                          endWidget: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: productItemState.data?.data?.colors.first
                                    .hexcode?.getColorFromHex),
                          ),
                          textValue:
                              productItemState.data?.data?.colors.first.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Product Size",
                          textValue:
                              "${productItemState.data?.data?.sizes.first.name}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Categories",
                          textValue:
                              "${productItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}",
                          hasDivider: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Occasions",
                          textValue:
                              "${productItemState.data?.data?.occasions.map((item) => item.nameEn).join(" - ")}",
                          hasDivider: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Time for processing",
                          textValue:
                              "${productItemState.data?.data?.expectedProcessingTime}"
                                  .ellipsize(28),
                          hasDivider: false,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.itemType == ItemType.Products)
                  ...(List.generate(
                      productItemState.data?.data?.lists.length ?? 0,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "${productItemState.data?.data?.lists[index].name}",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts18w700,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: AppTheme.appGrey8),
                                    color: Colors.white,
                                  ),
                                  child:
                                  productItemState.data?.data?.lists[index].isMultiSelectable == 0?
                                  ProductSingleSelectItems(
                                      list: productItemState.data?.data?.lists[index].items
                                          .map((item) => ItemSelector(
                                          item.id?.toInt() ?? 0,
                                          item.name ?? "",
                                          Text(
                                            "SAR ${item.price}",
                                            style: AppTheme
                                                .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                          )))
                                          .toList() ??
                                          [], onItemSelect: (item) {  },) :
                                  ProductMultipleSelectItems(
                                    list: productItemState.data?.data?.lists[index].items
                                        .map((item) => ItemSelector(
                                        item.id?.toInt() ?? 0,
                                        item.name ?? "",
                                        Text(
                                          "SAR ${item.price}",
                                          style: AppTheme
                                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                        )))
                                        .toList() ??
                                        [], onItemSelect: (item) {  },),
                                ),
                              ),
                            ],
                          )))
                else
                  ...(List.generate(
                      serviceItemState.data?.data?.lists.length ?? 0,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "${serviceItemState.data?.data?.lists[index].name}",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts18w700,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: AppTheme.appGrey8),
                                    color: Colors.white,
                                  ),
                                  child: ProductMultipleSelectItems(
                                      list: serviceItemState.data?.data?.lists
                                              .map((item) => ItemSelector(
                                                  item.id?.toInt() ?? 0,
                                                  item.name ?? "",
                                                  SizedBox()))
                                              .toList() ??
                                          [], onItemSelect: (item) {  },),
                                ),
                              )
                            ],
                          ))),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.appGrey8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(children: [
                      Row(
                        children: [
                          ImageView(
                            isCircle: true,
                            initialImg:
                                widget.itemType == ItemType.Products ? "" : "",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Sold By",
                                    style: AppTheme
                                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                "Flowers Costa Cabral",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts16w700,
                              )
                            ],
                          )
                        ],
                      ),
                      PositionedDirectional(
                        end: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SVGIcons.smallStarIcon(),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${productItemState.data?.data?.overallRating ?? 0}",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts14w400,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "(${productItemState.data?.data?.ratingsCount ?? 0})",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400,
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Product Rating & Reviews",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.appGrey8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(children: [
                      Row(
                        children: [
                          SVGIcons.smallStarIcon(size: 24),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${productItemState.data?.data?.overallRating ?? 0}",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts24w700,
                          ),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Based on ${productItemState.data?.data?.ratingsCount ?? 0} ratings",
                                style: AppTheme
                                    .styleWithTextGray7AdelleSansExtendedFonts12w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                if (widget.itemType == ItemType.Products)
                  ...(List.generate(
                    productItemState.data?.data?.ratings?.length ?? 0,
                    (index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppTheme.appGrey8),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${productItemState.data?.data?.ratings?[index].userName}",
                                  style: AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                                ),
                                Spacer(),
                                Text(
                                  "${productItemState.data?.data?.ratings?[index].date}",
                                  style: AppTheme
                                      .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SVGIcons.smallStarIcon(),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "${productItemState.data?.data?.ratings?[index].rating ?? 0}",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts14w400,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ExpandedText(
                              textValue:
                                  "${productItemState.data?.data?.ratings?[index].ratingComment ?? 0}",
                              textStyle: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts14w500
                                  .copyWith(height: 1.5),
                              maxLength: 70,
                              showLessText: "Read Less",
                              showMoreText: "Read More",
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                if (widget.itemType == ItemType.Services)
                  ...(List.generate(
                    serviceItemState.data?.data?.ratings?.length ?? 0,
                    (index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppTheme.appGrey8),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${serviceItemState.data?.data?.ratings?[index].userName}",
                                  style: AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                                ),
                                Spacer(),
                                Text(
                                  "${serviceItemState.data?.data?.ratings?[index].date}",
                                  style: AppTheme
                                      .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SVGIcons.smallStarIcon(),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "${serviceItemState.data?.data?.ratings?[index].rating ?? 0}",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts14w400,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ExpandedText(
                              textValue:
                                  "${serviceItemState.data?.data?.ratings?[index].ratingComment ?? 0}",
                              textStyle: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts14w500
                                  .copyWith(height: 1.5),
                              maxLength: 70,
                              showLessText: "Read Less",
                              showMoreText: "Read More",
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
