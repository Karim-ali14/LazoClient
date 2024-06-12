import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';

class CircleImage extends StatelessWidget {
  final String? initialImg;
  final String? placeHolder;
  final double? size;
  final bool? isRect;
  final double? borderSize;
  final Color? borderColor;
  final BorderRadius? radius;
  const CircleImage(
      {super.key,
      this.initialImg,
      this.size,
      this.placeHolder,
      this.isRect,
      this.radius,
      this.borderSize,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        width: size ?? 50,
        height: size ?? 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: isRect == true ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: radius,
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderSize ?? 0)),
        child: isRect == true ? CachedNetworkImage(
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.contain,
              ),
            ),
            imageUrl: initialImg ?? "",
            errorWidget: (context, err, child) => Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.contain),
            fit: BoxFit.cover) : ClipOval(child :CachedNetworkImage(

            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.contain,
              ),
            ),
            imageUrl: initialImg ?? "",
            errorWidget: (context, err, child) => Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.contain),
            fit: BoxFit.cover)));
  }
}
