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


