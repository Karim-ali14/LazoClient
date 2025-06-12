import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Theme/AppTheme.dart';
import '../../../../Widgets/TextWithoutPadding.dart';

class StepItemView extends StatelessWidget {
  final int currentStep;
  final int index;
  const StepItemView({super.key, required this.currentStep, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 33.w,
      height: 33.h,
      decoration: BoxDecoration(
        color: index <= currentStep
            ? AppTheme.mainAppColorDark
            : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: TextWithoutPadding(
            index < currentStep ? "✓" : '${index + 1}',
            key: ValueKey(index < currentStep),
            style: TextStyle(
              color: index <= currentStep
                  ? Colors.white
                  : AppTheme.appGrey18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
