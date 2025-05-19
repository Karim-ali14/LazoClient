import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Theme/AppTheme.dart';

class ProductRowItem extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? desTextStyle;
  final String? textValue;
  final Widget? endWidget;
  final bool? hasDivider;
  const ProductRowItem(
      {super.key,
      this.title,
      this.textValue,
      this.hasDivider = true,
      this.endWidget, this.titleTextStyle, this.desTextStyle, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: titleTextStyle ?? AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(subTitle ?? "",style: AppTheme.styleWithTextGray13AdelleSansExtendedFonts11w400),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  endWidget != null ? endWidget! : const SizedBox(),
                  endWidget != null
                      ? const SizedBox(
                          width: 10,
                        )
                      : const SizedBox(),
                  Text(
                    "$textValue",
                    style: desTextStyle ?? AppTheme
                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        if (hasDivider == true)
          const Align(
              alignment: Alignment.bottomCenter,
              child: Divider(color: AppTheme.appGrey9,thickness: 3,))
        else
          const SizedBox()
      ]),
    );
  }
}