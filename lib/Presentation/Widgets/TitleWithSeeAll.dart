import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

class TitleWithSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onClickOnSeeAll;
  const TitleWithSeeAll({super.key, required this.title, required this.onClickOnSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,
        ),
        Spacer(),
        InkWell(
          onTap: onClickOnSeeAll,
          child: Text(
            "See all",
            style:
                AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
          ),
        )
      ],
    );
  }
}
