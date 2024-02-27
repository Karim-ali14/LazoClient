import 'dart:convert';
import 'package:base_flutter_app/UI/Dialogs/LoadingDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

import '../Constants.dart';
import '../Localization/AppLocalizations.dart';
const imagePickOptions = ["Open Camera","Pick From Gallery"];


extension ContextMethods on BuildContext {
  Size get getScreenSize => MediaQuery.of(this).size;
  String getLocaleString(key) => AppLocalizations.of(this)?.translate(key) ?? "";
  ThemeData get appTheme => Theme.of(this);

  isThereCurrentDialogShowing() => ModalRoute.of(this)?.isCurrent != true;

  void dismissKeyboard(){
    FocusScope.of(this).requestFocus(FocusNode());
  }

  void pickImage({String? header,required Function(List<String>,List<String>,ImageSource) onResult}){
    showSelectionActionSheet(imagePickOptions,(pos){onSelect(pos,false,onResult:onResult);}, header: header??tr("AddImage"));
  }

  void pickImages({String? header,required Function(List<String>,List<String>,ImageSource) onResult}){
    showSelectionActionSheet(imagePickOptions,(pos){onSelect(pos,true,onResult:onResult);}, header: header??tr("AddImage"));
  }

  void onSelect(int pos,bool isMultiPick,{required Function(List<String>,List<String>,ImageSource) onResult}) async {
    final ImagePicker picker = ImagePicker();
    if (pos == 0) {
      final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
      if (image !=null) {
        image.readAsBytes().then((value) {
          onResult([image.path], [base64Encode(value)],ImageSource.camera);
        });
      }
    } else if (pos == 1) {
      if(isMultiPick){
        final List<XFile> images = await picker.pickMultiImage(imageQuality: 10);
        if(images.isNotEmpty){
          onResult(images.map((e) => e.path).toList(), [],ImageSource.gallery);
        }
        return;
      }
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image !=null) {
        image.readAsBytes().then((value) {
          onResult([image.path], [base64Encode(value)],ImageSource.gallery);
        });
      }
    }
  }
}

extension MapOps on Map {
  dynamic safeGet(String key) => containsKey(key) ? this[key] : null;
}

extension JsonOps on JsonCodec {
  Map? tryDecode(String source){
    try{
      return json.decode(source);
    }catch(e){
      return null;
    }
  }
}

extension DateFormatting on DateTime {
  String get getTime => DateFormat(DateFormat.HOUR_MINUTE).format(toLocal()) == DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.now()) ? "Just Now" : DateFormat(DateFormat.HOUR_MINUTE).format(toLocal());
  String getLocalizedTime(BuildContext context) => DateFormat(DateFormat.HOUR_MINUTE).format(toLocal()) == DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.now()) ? "Just Now" : DateFormat(DateFormat.HOUR_MINUTE,context.locale.languageCode).format(toLocal());
  String get ago => timeago.format(this);

  String formatTo(BuildContext context,{String? dateFormat}) => DateFormat(dateFormat??DateFormat.HOUR_MINUTE,context.locale.languageCode).format(this.toLocal() ?? DateTime.now());

}

extension DateStringFormat on String {
  String formatTo(BuildContext context,{String? dateFormat}) => DateFormat(dateFormat??DateFormat.HOUR_MINUTE,context.locale.languageCode).format(DateTime.tryParse(this)?.toLocal() ?? DateTime.now());
}
const String dateFormatter = 'HH:MM a';
extension DateHelper on DateTime {

  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }
  bool isSameDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }

  bool sameTime(DateTime other){
    return DateFormat(DateFormat.HOUR_MINUTE).format(this) == DateFormat(DateFormat.HOUR_MINUTE).format(other);
  }
}

extension ListHelper<T> on List<T?> {
  T? getSafe(int index) => index < length ?  this[index] : null;
  List<T?> sublistSafe(int from,int to) {
    try{
      return sublist(from,to).toList();
    }catch(e){
      return sublist(length - 1);
    }
  }
}

class CommonUtils {
  static String getCountryFlag(){
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "EGY";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String flag = String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return flag;
  }
}

bool validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}
