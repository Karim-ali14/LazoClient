import 'package:flutter/cupertino.dart';

class ItemSelector{
  final int id;
  final String text;
  final Widget? widget;
  bool? isChecked;

  ItemSelector(this.id ,this.text, this.widget, {this.isChecked = false});
}
