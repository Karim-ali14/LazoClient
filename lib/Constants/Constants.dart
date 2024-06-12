
import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../Localization/Keys.dart';

const defaultPaddingHorizontal = 16.0;

const signUpUrl = "https://lazo-dashboard.pomac.info/";

class ConstantsMethods{
  static List<String> getOnBoardingContentList(BuildContext context) {
    List<String> content = [
      context.tr(onBoardingOneKey),
      context.tr(onBoardingTwoKey),
      context.tr(onBoardingThreeKey),
    ];
    return content;
  }
  static List<String> getOnBoardingTitleList(BuildContext context) {
    List<String> titles = [
      context.tr(onBoardingOneKey),
      context.tr(onBoardingTwoKey),
      context.tr(onBoardingThreeKey),
    ];
    return titles;
  }
}
