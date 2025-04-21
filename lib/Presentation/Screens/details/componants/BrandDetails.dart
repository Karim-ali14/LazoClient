import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../Constants/Assets.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';

class BrandDetails extends StatelessWidget {
  final ProviderData? provider;
  final Function(int?) onProviderClick;
  final Function(int?) onReviewClick;
  const BrandDetails({super.key, this.provider, required this.onProviderClick, required this.onReviewClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Brand Details",
          style: AppTheme
              .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            InkWell(
              onTap: (){
                onProviderClick.call(provider?.id);
              },
              child: Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: ImageView(
                  isCircle: true,
                  initialImg: provider?.imagePath??"",
                ),
              ),
            ) ,
            const SizedBox(width: 5,),
            InkWell(
                onTap: (){
                  onProviderClick.call(provider?.id);
                },
                child: Text("By ${provider?.name?.ellipsize(20)}",style: AppTheme.styleWithTextAppGrey21AdelleSansExtendedFonts14w500.copyWith(decoration: TextDecoration.underline),)),
            const SizedBox(width: 5,),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.blackColor2
              ),
            ),
            const SizedBox(width: 5,),
            Text("${provider?.overallRating}",style: AppTheme.styleWithTextAppGrey21AdelleSansExtendedFonts14w400,),
            SizedBox(width: 5,),
            RatingBar(
              initialRating: (provider?.overallRating ??
                  0).toDouble(),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 11,
              ratingWidget: RatingWidget(
                full: SVGIcons.localSVG(fullStarSvg),
                half: SVGIcons.localSVG(smallHalfStarSvg),
                empty: SVGIcons.localSVG(smallStarEmptySvg),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              onRatingUpdate: (rating) {
              },
              ignoreGestures: true,
            ),
            const SizedBox(width: 5,),
            InkWell(
              onTap: (){
                onReviewClick.call(provider?.id);
              },
              child: Text(
                "(${provider?.ratingsCount}) Reviews",
                style:  AppTheme
                    .styleWithTextAppGrey21AdelleSansExtendedFonts14w500
                    .copyWith(
                    decoration:
                    TextDecoration.underline),
              ),
            ),
          ],
        )
      ],
    );
  }
}
