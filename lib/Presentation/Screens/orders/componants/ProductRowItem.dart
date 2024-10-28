import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Theme/AppTheme.dart';


class ProductRowItem extends StatelessWidget {
  final String? title;
  final String? textValue;
  final Widget? endWidget;
  final bool? hasDivider;
  const ProductRowItem(
      {super.key,
      this.title,
      this.textValue,
      this.hasDivider = true,
      this.endWidget});

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
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,
              ),
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
                    style: AppTheme
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
