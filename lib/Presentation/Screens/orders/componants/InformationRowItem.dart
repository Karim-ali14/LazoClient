import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Theme/AppTheme.dart';

class InformationRowItem extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? value;
  final bool? hasDivider;
  final bool? ifSetValueInNewLine;
  const InformationRowItem(
      {super.key,
      this.icon,
      this.title,
      this.value,
      this.hasDivider = true,
      this.ifSetValueInNewLine = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeleton.replace(
              child: icon ?? SizedBox(),
              replacement: Icon(Icons.ac_unit, size: 20),
            ),
            icon == null ? SizedBox() : const SizedBox(width: 12),
            Text(
              title ?? "",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,
            ),
            const Spacer(),
            ifSetValueInNewLine == false
                ? Text(
                    "$value",
                    style: AppTheme
                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,textAlign: TextAlign.end,
                  )
                : SizedBox()
          ],
        ),
        ifSetValueInNewLine == true
            ? Text(
          "$value",
          style: AppTheme
              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
        )
            : SizedBox(),
        if (hasDivider == true)
          const SizedBox(height: 16)
        else
          const SizedBox(),
        if (hasDivider == true)
          const Divider(color: AppTheme.appGrey8, height: 1)
        else
          const SizedBox()
      ]),
    );
  }
}
