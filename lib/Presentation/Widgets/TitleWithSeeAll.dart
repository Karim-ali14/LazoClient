import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TitleWithSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onClickOnSeeAll;
  const TitleWithSeeAll({super.key, required this.title, required this.onClickOnSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.replace(
          child: Text(
            title,
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,
          ),
          replacement: Container(
            width: 70,
            height: 20,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Skeleton.replace(
          child: InkWell(
            onTap: onClickOnSeeAll,
            child: Text(
              "See all",
              style:
                  AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
            ),
          ),
          replacement: Container(
            width: 50,
            height: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
