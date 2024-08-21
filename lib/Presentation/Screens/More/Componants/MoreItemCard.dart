import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../Constants/Constants.dart';
import '../../../Theme/AppTheme.dart';

class MoreItemCard extends StatefulWidget {
  final Widget? startIcon;
  final Widget? textWidget;
  final String? text;
  final String? description;
  final Widget? endIcon;
  const MoreItemCard(
      {super.key, this.startIcon, this.text, this.description, this.endIcon, this.textWidget });

  @override
  State<MoreItemCard> createState() => _MoreItemCardState();
}

class _MoreItemCardState extends State<MoreItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.appGrey8, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: widget.startIcon ?? const SizedBox(),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.textWidget ??
                  Text(
                    widget.text ?? "",
                    style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                  ),
                  widget.description != null ?
                  Padding(padding: EdgeInsets.only(top: 5),child: SizedBox(
                    width: 265,
                    child: Text(
                      widget.description ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                      maxLines: 5,
                    ),
                  ),) : const SizedBox()
                ],
              ),
            ],
          ),
          const Spacer(),
          widget.endIcon ?? const SizedBox()

        ],
      ),
    );
  }
}
