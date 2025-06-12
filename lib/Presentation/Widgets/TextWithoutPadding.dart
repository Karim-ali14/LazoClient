import 'package:flutter/cupertino.dart';

class TextWithoutPadding extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const TextWithoutPadding(this.text,{super.key, this.style, this.maxLines, this.textAlign, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: style,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        strutStyle: const StrutStyle(
        forceStrutHeight: true,
        height: .7
    ));
  }
}
