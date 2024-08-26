import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';

class FAQItemCard extends StatefulWidget {
  final String title;
  final String description;
  const FAQItemCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<FAQItemCard> createState() => _FAQItemCardState();
}

class _FAQItemCardState extends State<FAQItemCard> {
  var expandedState = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expandedState = !expandedState;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPaddingHorizontal),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppTheme.appGrey8),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 295,
                  child: Text(
                    widget.title,
                    style: AppTheme
                        .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                  ),
                ),
                Spacer(),
                expandedState
                    ? SVGIcons.upArrowWithBackgroundIcon()
                    : SVGIcons.downArrowWithBackgroundIcon()
              ],
            ),
            expandedState
                ? const SizedBox(
                    height: defaultPaddingHorizontal,
                  )
                : const SizedBox(),
            expandedState
                ? Text(
                    widget.description,
                    style: AppTheme
                        .styleWithTextGray7AdelleSansExtendedFonts12w400
                        .copyWith(height: 1.6),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
