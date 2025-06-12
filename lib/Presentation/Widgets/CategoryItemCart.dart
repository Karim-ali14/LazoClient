import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'TextWithoutPadding.dart';

class CategoryItemCart extends StatelessWidget {
  final String image;
  final String title;
  final double? width;
  final double height;
  const CategoryItemCart(
      {super.key,
      required this.image,
      required this.title,
      this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        width: width ?? MediaQuery.of(context).size.width, // Adjust dimensions as needed
        height: height,
        color: AppTheme.appGrey9,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.appGrey8),
          color: AppTheme.appGrey9,
        ),
        child: Stack(
          children: [
            ImageView(
              width: width ?? MediaQuery.of(context).size.width,
              height: height,
              initialImg: image,
            ),

            Container(
              width: width,
              height: height,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8), // Dark shadow at the bottom
                    Colors.transparent,            // Fades to transparent at the top
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWithoutPadding(title,
                        style: AppTheme.styleWithTextWhiteColor15PoppinsFonts14w500
                            .copyWith(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 8,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
