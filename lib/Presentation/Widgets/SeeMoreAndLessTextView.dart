import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

class ExpandedText extends StatefulWidget {
  final String textValue;
  final TextStyle textStyle;
  final int maxLength;
  final String showMoreText;
  final String showLessText;
  const ExpandedText(
      {super.key, required this.textValue, required this.textStyle, required this.maxLength, this.showMoreText = " Show Less", this.showLessText = " Show More"});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool expanded = false;
  String value = "";
  @override
  Widget build(BuildContext context) {
    value = !expanded && widget.textValue.length >= widget.maxLength
        ? "${widget.textValue.substring(0, widget.maxLength)}..."
        : widget.textValue;
    return Text.rich(TextSpan(text: value, style: widget.textStyle, children: [
      if (widget.textValue.length >= widget.maxLength)
        TextSpan(
            text: expanded ? " ${widget.showLessText}" : " ${widget.showMoreText}",
            style:
                AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  expanded = !expanded;
                });
              })
    ]));
  }
}
