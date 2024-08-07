import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        width: width, // Adjust dimensions as needed
        height: height,
        color: AppTheme.appGrey9,
      ),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppTheme.appGrey8),
          color: AppTheme.appGrey9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: ImageView(
                width: 32,
                height: 32,
                initialImg: image,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(title,
                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w400
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
