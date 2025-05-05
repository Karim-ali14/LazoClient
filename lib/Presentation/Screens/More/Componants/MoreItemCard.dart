import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/Constants.dart';
import '../../../Theme/AppTheme.dart';

class MoreItemCard extends StatefulWidget {
  final Widget? startIcon;
  final Widget? textWidget;
  final String? text;
  final String? description;
  final Widget? endWidget;
  final bool? withDivider;
  const MoreItemCard(
      {super.key,
      this.startIcon,
      this.text,
      this.description,
      this.endWidget,
      this.textWidget,
      this.withDivider = true});

  @override
  State<MoreItemCard> createState() => _MoreItemCardState();
}

class _MoreItemCardState extends State<MoreItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: widget.startIcon ?? const SizedBox(),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      widget.textWidget ??
                          Text(
                            widget.text ?? "",
                            style: AppTheme
                                .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                          ),
                    ],
                  ),
                  const Spacer(),
                  widget.endWidget ?? const SizedBox()
                ],
              ),
            ),
          ),
          widget.withDivider == false
              ? const SizedBox()
              : Align(
            alignment: Alignment.bottomCenter,
                child: const Divider(
                    thickness: 1,
                    height: 1,
                    color: AppTheme.appGrey11,
                  ),
              )
        ],
      ),
    );
  }
}
