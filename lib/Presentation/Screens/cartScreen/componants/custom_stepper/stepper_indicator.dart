import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/custom_stepper/line_spacer.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/custom_stepper/step_item_view.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import '../../../../Widgets/TextWithoutPadding.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  const StepperIndicator({super.key, required this.currentStep, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps
              .map((e) => TextWithoutPadding(
            e,
            style: AppTheme
                .styleWithTextAppMainAppColor15AdelleSansExtendedFonts14w400,
          ))
              .toList(),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              for (int index = 0; index < steps.length - 1; index++)
                Expanded(
                  child: Row(
                    children: [
                      StepItemView(currentStep: currentStep, index: index),
                      LineSpacer(
                        currentStep: currentStep,
                        index: index,
                        isActive: currentStep > index,
                      ),
                    ],
                  ),
                ),
              StepItemView(currentStep: currentStep, index: steps.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}
