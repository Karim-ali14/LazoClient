import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Constants/Assets.dart';
import '../Theme/AppTheme.dart';
import 'CircleImage.dart';

class BannerCardItems extends StatefulWidget {
  final List<String> list;
  final bool showIndicator;
  final double height;
  final double width;
  const BannerCardItems(
      {super.key,
      required this.list,
      this.showIndicator = true,
      required this.height,
      required this.width});

  @override
  State<BannerCardItems> createState() => _BannerCardItemsState();
}

class _BannerCardItemsState extends State<BannerCardItems> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: widget.list.map((imagePath) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                height: widget.height,
                width: widget.width,
                clipBehavior: Clip.antiAlias,
                child: ImageView(
                  initialImg: imagePath,
                  placeHolder: placeholder,
                ),
              );
            }).toList(),
          ),
          widget.showIndicator ?
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: SmoothPageIndicator(
                controller: pageController,
                count: widget.list.length,
                effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                      width: 20,
                      height: 3,
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                    ),
                    activeDotDecoration: DotDecoration(
                      width: 20,
                      height: 3,
                      borderRadius: BorderRadius.circular(11),
                      color: AppTheme.mainAppColor,
                    )),
              ),
            ),
          ) : const SizedBox()
        ],
      ),
    );
  }
}
