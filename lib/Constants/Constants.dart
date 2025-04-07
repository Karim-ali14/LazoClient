
import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../Data/Models/ItemSelector.dart';
import '../Localization/Keys.dart';
import '../Presentation/Widgets/SvgIcons.dart';

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
      context.tr(onBoardingTitleOneKey),
      context.tr(onBoardingTitleTwoKey),
      context.tr(onBoardingTitleThreeKey),
    ];
    return titles;
  }
  static List<ItemSelector> getShipmentTypesList(BuildContext context) {
    List<ItemSelector> shipmentTypesList = [
      ItemSelector(0, "Ready made", null),
      ItemSelector(1, "Unready made", null),
    ];
    return shipmentTypesList;
  }
  static List<ItemSelector> getRatingsList(BuildContext context) {
    List<ItemSelector> ratingsList = [1, 2, 3, 4, 5]
        .map((item) => ItemSelector(
        item,
        "$item/5",
        Row(
          children: List.generate(
              item, (index) => SVGIcons.smallStarIcon(size: 14)),
        ),
        isChecked: false))
        .toList();
    return ratingsList;
  }
}
