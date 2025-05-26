import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

class LineSpacer extends StatelessWidget {
  final bool isActive;
  final int currentStep;
  final int index;

  const LineSpacer({
    super.key,
    required this.currentStep,
    required this.index,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const dotCount = 21;
    return Flexible(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: SingleChildScrollView(
          key: ValueKey(isActive),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(dotCount, (_) {
              return SVGIcons.localSVG(
                stepperSpacerIcons,
                width: 7,
                height: 8,
                color: !isActive ? null : AppTheme.mainAppColorDark,
              );
            }),
          ),
        ),
      ),
    );
  }
}