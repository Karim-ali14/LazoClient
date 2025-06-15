import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class DescriptionBottomSheet extends StatelessWidget {
  final String? description;
  const DescriptionBottomSheet({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 64.h,
          child: Stack(
            children: [
              Center(
                child: Text(
                  "Description",
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
        ),
        Padding(padding: EdgeInsetsDirectional.all(16),child: Text(description??"",style: AppTheme.styleWithTextAppGrey18AdelleSansExtendedFonts12w400.copyWith(height: 1.5),),)
      ],
    );
  }
}
