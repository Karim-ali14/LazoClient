import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Constants/Assets.dart';

class TextPrice extends StatelessWidget {

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? height;
  final bool? showCurrency;
  final bool? showRoundBrackets;
  final bool? showPlus;
  final bool? showMinus;

  const TextPrice(this.text,
      {super.key,
      this.style,
      this.maxLines,
      this.textAlign,
      this.overflow,
      this.height,
      this.showCurrency = true, this.showRoundBrackets, this.showPlus, this.showMinus});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showRoundBrackets == true ? Text("(",style:style): const SizedBox(),

        showPlus == true ? Text("+ ",style: style,): const SizedBox(),
        showMinus == true ? Text("- ",style: style,): const SizedBox(),
        showCurrency == true
            ? SVGIcons.localSVG(saudiRiyalSymboIcons, width: 19.w, height: 21.h)
            : const SizedBox(),
        showCurrency == true
            ? SizedBox(
                width: 4.w,
              )
            : const SizedBox(),
        Text(text,
            style: style,
            maxLines: maxLines,
            textAlign: textAlign,
            overflow: overflow,
            strutStyle: StrutStyle(forceStrutHeight: true, height: height)),

        showRoundBrackets == true ? Text(")",style:style): const SizedBox(),

      ],
    );
  }
}
