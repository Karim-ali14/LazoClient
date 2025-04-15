import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import '../../Data/Network/lib/api.dart';
import '../../Localization/Keys.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/CircleImage.dart';
import '../Widgets/SeeMoreAndLessTextView.dart';
import '../Widgets/SvgIcons.dart';

class RatingBottomSheet extends StatelessWidget {
  final FilterScreenTypes type;
  final List<ProviderDataRatingsInner>? providerRatingsList;
  final List<ProductDetailsRatingsInner>? productRatingsList;
  const RatingBottomSheet(
      {super.key,
      this.providerRatingsList,
      required this.type,
      this.productRatingsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Reviews",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddingHorizontal),
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SVGIcons.localSVG(closeIconSvg,
                            width: 32, height: 32)),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.appGrey11.withOpacity(0.6), // Shadow color
                  blurRadius: .5, // Blur effect
                  spreadRadius: .1, // Spread effect
                  offset: const Offset(0, .5), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppTheme.appPink2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpandedText(
                          textValue: type == FilterScreenTypes.Sellers
                              ? "${providerRatingsList?[index].ratingComment ?? 0}"
                              : "${productRatingsList?[index].ratingComment ?? 0}",
                          textStyle: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w400
                              .copyWith(height: 1.5),
                          maxLength: 70,
                          showLessText: context.tr(readLessKey),
                          showMoreText: context.tr(readMoreKey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            type == FilterScreenTypes.Sellers
                                ? ImageView(
                                    isCircle: true,
                                    initialImg:
                                        providerRatingsList?[index].imagePath,
                                    width: 32,
                                    height: 32,
                                  )
                                : ImageView(
                                    isCircle: true,
                                    initialImg:
                                        productRatingsList?[index].imagePath,
                                    width: 32,
                                    height: 32,
                                  ),
                            const SizedBox(width: 8),
                            Text(
                              type == FilterScreenTypes.Sellers
                                  ? "${providerRatingsList?[index].userName}"
                                  : "${productRatingsList?[index].userName}",
                              style: AppTheme
                                  .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                            ),
                            Spacer(),
                            type == FilterScreenTypes.Sellers
                                ? Text(
                                    providerRatingsList?[index]
                                            .date
                                            ?.convertDateToDdMmmYyyy ??
                                        "",
                                    style: AppTheme
                                        .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                  )
                                : Text(
                                    productRatingsList?[index]
                                            .date
                                            ?.convertDateToDdMmmYyyy ??
                                        "",
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
                            // SVGIcons.smallStarIcon(),
                            RatingBar(
                              initialRating: type == FilterScreenTypes.Sellers
                                  ? double.parse(
                                      providerRatingsList?[index].rating ?? "0")
                                  : (productRatingsList?[index].rating ?? 0)
                                      .toDouble(),
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 11,
                              ratingWidget: RatingWidget(
                                full: SVGIcons.localSVG(fullStarSvg),
                                half: SVGIcons.localSVG(smallHalfStarSvg),
                                empty: SVGIcons.localSVG(smallStarEmptySvg),
                              ),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              onRatingUpdate: (rating) {},
                              ignoreGestures: true,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              type == FilterScreenTypes.Sellers
                                  ? "${providerRatingsList?[index].rating ?? 0}"
                                  : "${productRatingsList?[index].rating ?? 0}",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts14w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: type == FilterScreenTypes.Sellers
                  ? providerRatingsList?.length ?? 0
                  : productRatingsList?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
