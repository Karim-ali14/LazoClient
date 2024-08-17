import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Constants/Assets.dart';

class SliderView extends StatefulWidget {
  final List<String> images;
  final bool withIndicator;
  final double height;
  final double width;
  final bool showLoading;
  const SliderView({super.key, required this.images, required this.withIndicator, required this.height, required this.width, required this.showLoading});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: widget.images.map((image) => Skeletonizer(
              enabled: widget.showLoading,
              child: Skeleton.replace(
                replacement: Container(
                  width: widget.width, // Adjust dimensions as needed
                  height: widget.height,
                  color: Colors.white,
                ),
                child: ImageView(
                  initialImg: image,
                  placeHolder: placeHolderForCardsSvg,
                ),
              ),
            )).toList(),
          ),
          widget.withIndicator ?
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: widget.images.length,
                    effect: const CustomizableEffect(
                        dotDecoration: DotDecoration(
                          width: 20,
                          height: 3,
                          color: Colors.white
                        ),
                        activeDotDecoration: DotDecoration(
                            width: 20,
                            height: 3,
                            color: AppTheme.mainAppColor
                        )
                    ),
                  ),
                ),
              ): const SizedBox()
        ],
      ),
    );
  }
}
