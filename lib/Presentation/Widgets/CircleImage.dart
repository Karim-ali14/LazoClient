import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';

class ImageView extends StatelessWidget {
  final String? initialImg;
  final String? placeHolder;
  final double? width;
  final double? height;
  final bool? isCircle;
  final double? borderSize;
  final Color? borderColor;
  final BorderRadius? radius;
  const ImageView(
      {super.key,
        this.initialImg,
        this.width,
        this.height,
        this.placeHolder,
        this.isCircle,
        this.radius,
        this.borderSize,
        this.borderColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        width: width ?? 50,
        height: height ?? 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: radius,
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderSize ?? 0)),
        child: isCircle == true ? ClipOval(child :CachedNetworkImage(
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.cover,
              ),
            ),
            imageUrl: initialImg ?? "",
            errorWidget: (context, err, child) => Image.asset(
                placeHolder ?? userPlaceholder,
                fit: BoxFit.contain),
            fit: BoxFit.cover)) : CachedNetworkImage(
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
            fit: BoxFit.cover) );
  }
}
