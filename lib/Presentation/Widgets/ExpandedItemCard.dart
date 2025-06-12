import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';

import '../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import 'SvgIcons.dart';
import 'TextWithoutPadding.dart';

class ExpandedItemCard extends StatefulWidget {
  final String title;
  final Widget body;
  const ExpandedItemCard({super.key, required this.title, required this.body});

  @override
  State<ExpandedItemCard> createState() => _ExpandedItemCardState();
}

class _ExpandedItemCardState extends State<ExpandedItemCard> {
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppTheme.appGrey8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
                child: Row(
                  children: [
                    SizedBox(
                      width: 295,
                      child: TextWithoutPadding(
                        widget.title,
                        style: AppTheme.styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                      ),
                    ),
                    const Spacer(),
                    expandedState
                        ? SVGIcons.localSVG(upArrowIcon,width: 24,height: 24)
                        : SVGIcons.localSVG(downArrowIcon,width: 24,height: 24)
                  ],
                ),
              ),
            ),
            expandedState
                ? const Divider(
                    color: AppTheme.appGrey3,
                  )
                : const SizedBox(),
            expandedState ? widget.body : const SizedBox()
          ],
        ),
      ),
    );
  }
}
