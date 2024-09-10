import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
typedef OnExpandChangeStatus = Function(bool);
class ExpandedText extends StatefulWidget {
  final String textValue;
  final TextStyle textStyle;
  final int maxLength;
  final String showMoreText;
  final String showLessText;
  final bool defaultExpandedValue ;
  final OnExpandChangeStatus? onExpandChangeStatus;
  const ExpandedText(
      {super.key, required this.textValue, required this.textStyle, required this.maxLength, this.showMoreText = " Show More", this.showLessText = " Show Less", this.defaultExpandedValue = false, this.onExpandChangeStatus});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool expanded = false;
  String value = "";
  @override
  void initState() {
    expanded = widget.defaultExpandedValue;
    // WidgetsBinding.instance.addPostFrameCallback((_){
    // });
    super.initState();
  }
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
                  widget.onExpandChangeStatus?.call(expanded);
                });
              })
    ]));
  }
}
