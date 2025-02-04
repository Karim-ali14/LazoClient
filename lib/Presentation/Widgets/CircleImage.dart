import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants.dart';
import '../../Constants/Assets.dart';

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
        child: isCircle == true
            ? ClipOval(
                child: _isSvg(initialImg)
                    ? SvgPicture.network(
                        initialImg ?? "",
                        placeholderBuilder: (context) => SvgPicture.asset(
                          placeHolder ?? defaultUseIconSvg,
                          fit: BoxFit.cover,
                        ),
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        placeholder: (context, url) => SvgPicture.asset(
                              placeHolder ?? placeHolderForCardsSvg,
                              fit: BoxFit.cover,
                            ),
                        imageUrl: initialImg ?? "",
                        errorWidget: (context, err, child) => SvgPicture.asset(
                            placeHolder ?? placeHolderForCardsSvg,
                            fit: BoxFit.cover),
                        fit: BoxFit.cover))
            : _isSvg(initialImg)
                ? SvgPicture.network(
                    initialImg ?? "",
                    placeholderBuilder: (context) => SvgPicture.asset(
                      placeHolder ?? placeHolderForCardsSvg,
                      fit: BoxFit.cover,
                    ),
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    placeholder: (context, url) => SvgPicture.asset(
                          placeHolder ?? placeHolderForCardsSvg,
                          fit: BoxFit.cover,
                        ),
                    imageUrl: initialImg ?? "",
                    errorWidget: (context, err, child) => SvgPicture.asset(
                        placeHolder ?? placeHolderForCardsSvg,
                        fit: BoxFit.cover),
                    fit: BoxFit.cover));
  }

  bool _isSvg(String? url) {
    return url?.isNotEmpty == true &&
        url?.toLowerCase().endsWith(".svg") == true;
  }
}
