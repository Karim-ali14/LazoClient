import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Localization/Keys.dart';

class TitleWithSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onClickOnSeeAll;
  final bool? showSeeMore;
  const TitleWithSeeAll({super.key, required this.title, required this.onClickOnSeeAll, this.showSeeMore = true});

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
        showSeeMore == true ? Skeleton.replace(
          child: InkWell(
            onTap: onClickOnSeeAll,
            child: Text(
              context.tr(viewAllKey),
              style:
                  AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
            ),
          ),
          replacement: Container(
            width: 50,
            height: 20,
            color: Colors.white,
          ),
        ) : SizedBox()
      ],
    );
  }
}
