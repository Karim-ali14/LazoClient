import 'package:flutter/cupertino.dart';

import 'TextWithoutPadding.dart';

class TruncatedText extends StatelessWidget {
  final String text;
  final int maxLength;
  final TextStyle style;

  TruncatedText({
    required this.text,
    required this.maxLength,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedText = text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;

    return TextWithoutPadding(
      truncatedText,
      style: style,
    );
  }
}