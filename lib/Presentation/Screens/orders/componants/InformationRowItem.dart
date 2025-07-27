import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_client/Presentation/Widgets/TextPrice.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Theme/AppTheme.dart';

class InformationRowItem extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final TextStyle? titleStyle;
  final String? value;
  final bool? valueIsPrice;
  final TextStyle? valueStyle;
  final bool? hasDivider;
  final bool? ifSetValueInNewLine;
  const InformationRowItem(
      {super.key,
      this.icon,
      this.title,
      this.value,
      this.hasDivider = true,
      this.ifSetValueInNewLine = false, this.titleStyle, this.valueStyle, this.valueIsPrice});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeleton.ignore(
              child: icon ?? SizedBox(),
            ),
            icon == null ? SizedBox() : const SizedBox(width: 12),
            Text(
              title ?? "",
              style: titleStyle ?? AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,
            ),
            const Spacer(),
            ifSetValueInNewLine == false
                ? valueIsPrice == true ? TextPrice(
              "$value",
              style: valueStyle ?? AppTheme
                  .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,textAlign: TextAlign.end,
            ): Text(
                    "$value",
                    style: valueStyle ?? AppTheme
                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,textAlign: TextAlign.end,
                  )
                : SizedBox()
          ],
        ),
        ifSetValueInNewLine == true ?
        const SizedBox(
          height: 8,
        ):const SizedBox(),
        ifSetValueInNewLine == true
            ? SizedBox(
          width: MediaQuery.of(context).size.width,
              child: Text(
                        "$value",
                        style: valueStyle ?? AppTheme
                .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,textAlign: TextAlign.start,
                      ),
            )
            : SizedBox(),
        if (hasDivider == true)
          const SizedBox(height: 16)
        else
          const SizedBox(),
        if (hasDivider == true)
          const Divider(color: AppTheme.appGrey8, height: 1)
        else
          const SizedBox(height: 3,)
      ]),
    );
  }
}
