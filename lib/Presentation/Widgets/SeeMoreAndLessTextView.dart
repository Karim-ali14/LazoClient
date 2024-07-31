import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

class SeeMoreAndLessTextView extends StatefulWidget {
  final String textValue;
  final TextStyle textStyle;
  const SeeMoreAndLessTextView({super.key,
    required this.textValue, required this.textStyle});

  @override
  State<SeeMoreAndLessTextView> createState() => _SeeMoreAndLessTextViewState();
}

class _SeeMoreAndLessTextViewState extends State<SeeMoreAndLessTextView> {
  bool expanded = false;
  String value = "";
  @override
  Widget build(BuildContext context) {
    value = !expanded && widget.textValue.length >= 200 ? "${widget.textValue.substring(0,180)}..." : widget.textValue ;
    return Text.rich (
        TextSpan(
          text: value,
          style: widget.textStyle,
          children: [
            TextSpan(
              text: expanded ? " Show Less" : " Show More",
                style:
                AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
              recognizer: TapGestureRecognizer()..onTap = () {
                setState(() {
                  expanded = !expanded;
                });
              }
            )
          ]
        )
    );
  }
}
