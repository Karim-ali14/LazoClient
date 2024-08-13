import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Constants/Eunms.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/SeeMoreAndLessTextView.dart';
import '../../Widgets/SvgIcons.dart';

class ShowAllRatingAndReviewScreen extends ConsumerStatefulWidget {
  final String? id;
  final ItemType? itemType;
  const ShowAllRatingAndReviewScreen({super.key, this.id, this.itemType});

  @override
  ConsumerState<ShowAllRatingAndReviewScreen> createState() => _ShowAllRatingAndReviewScreenState();
}

class _ShowAllRatingAndReviewScreenState extends ConsumerState<ShowAllRatingAndReviewScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.itemType == ItemType.Products) {
        ref
            .read(getProductReviews.notifier)
            .getProductDetails(productId: widget.id);
      } else {
        ref
            .read(getServiceReviews.notifier)
            .getServiceDetails(serviceId: widget.id);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productItemState = ref.watch(getProductReviews);
    final serviceItemState = ref.watch(getServiceReviews);
    return Scaffold(
      appBar: CustomAppBar(appContext: context,title: "Product Rating & Reviews",isCenter: false,navigated: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  height: 16,
                ),
                if (widget.itemType == ItemType.Products)
                  ...(List.generate(
                    productItemState.data?.data?.ratings?.length ?? 0,
                        (index) => Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppTheme.appGrey8),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  productItemState
                                      .data
                                      ?.data
                                      ?.ratings?[index]
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
                      margin:
                      EdgeInsetsDirectional.symmetric(vertical: 8),
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
                  )),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
