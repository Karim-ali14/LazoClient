import 'package:flutter/cupertino.dart';

import '../../Constants/Eunms.dart';

class ItemSelector{
  final int id;
  final String text;
  final Widget? widget;
  bool? isChecked;

  ItemSelector(this.id ,this.text, this.widget, {this.isChecked = false});
}


class ItemSelected{
  final int? id;
  final String? text;
  final FilterTypes? type;

  ItemSelected({this.id, this.text, this.type});
}


class ItemSelectorV2{
  final int id;
  final String text;
  final Widget? widget;
  bool? isChecked;

  ItemSelectorV2({required this.id ,required this.text ,this.isChecked = false, this.widget,});
}


class ItemSelectorV3{
  final int id;
  final String text;
  final Widget? widget;
  bool? isChecked;
  final double? price;

  ItemSelectorV3({required this.id ,required this.text ,this.isChecked = false, this.widget,this.price,});
}



