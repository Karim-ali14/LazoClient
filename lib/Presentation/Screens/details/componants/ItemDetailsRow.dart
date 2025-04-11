import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Theme/AppTheme.dart';
typedef OnValueClick = Function();
class ItemDetailsRow extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final String? textValue;
  final bool? valueIsLink;
  final TextStyle? valueTextStyle;
  final Widget? extraWidget;
  final OnValueClick? onValueClick;
  const ItemDetailsRow({super.key, this.title, this.titleTextStyle, this.textValue, this.valueTextStyle, this.extraWidget, this.valueIsLink, this.onValueClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.appGrey19),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "$title",
            style: titleTextStyle ?? AppTheme
                .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: (){
              onValueClick?.call();
            },
            child: Text(
              "$textValue",
              style: valueTextStyle ?? AppTheme
                  .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
            ),
          ),
          extraWidget != null ?
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  extraWidget!
                ],
              ):const SizedBox()
        ],
      ),
    );
  }
}
