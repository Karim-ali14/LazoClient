import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componants/stepper_indicator.dart';

class TextCartScreen extends StatefulWidget {
  const TextCartScreen({super.key});

  @override
  State<TextCartScreen> createState() => _TextCartScreenState();
}

class _TextCartScreenState extends State<TextCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StepperIndicator(currentStep: 1), // 0 = first step active
        ),
      ),
    );
  }
}
