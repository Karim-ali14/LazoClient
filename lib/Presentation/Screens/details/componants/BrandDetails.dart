import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';

import '../../../Theme/AppTheme.dart';

class BrandDetails extends StatelessWidget {
  final ProviderData? provider;
  final VoidCallback onProviderClick;
  final VoidCallback onReviewClick;
  const BrandDetails({super.key, this.provider, required this.onProviderClick, required this.onReviewClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
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
                onProviderClick.call();
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
                  onProviderClick.call();
                },
                child: Text("By ${provider?.name}",style: AppTheme.styleWithTextAppGrey21AdelleSansExtendedFonts14w500,)),
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
            const SizedBox(width: 5,),
            InkWell(
              onTap: (){
                onReviewClick.call();
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
