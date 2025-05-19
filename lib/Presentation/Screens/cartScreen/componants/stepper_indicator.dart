import 'package:flutter/material.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;

  const StepperIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['Customize', 'Delivery','Payment'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(steps.length, (index) {
        final isActive = index <= currentStep;
        final isCompleted = index < currentStep;
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                steps[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.red : Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: isActive ? Colors.red : Colors.grey[300],
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Divider(
                        color:
                            index < currentStep ? Colors.red : Colors.grey[300],
                        thickness: 2,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
