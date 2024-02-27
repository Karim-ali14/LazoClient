import 'package:flutter/material.dart';

import '../UI/Theme/AppColors.dart';
import '../UI/Widgets/SimpleAlert.dart';

class AppSnackBar {
  static showSnackBar(context,{required bool isSuccess,required String message,action}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 10,
      showCloseIcon: true,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      behavior: SnackBarBehavior.floating,
      closeIconColor: AppColors.appGrey,
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.white,
      content: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(end: 8),
              width: 8,

              decoration: BoxDecoration(
                  color: isSuccess == false ? AppColors.failureColor : AppColors.successColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Icon(
                isSuccess == false ? Icons.cancel :Icons.check_circle,
                color: isSuccess == false ? AppColors.failureColor : AppColors.successColor,
                size: 29,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: AppColors.appTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      )));
  }

  static showAlertSnackBar(context,{required String message,SimpleAlertType? alertType,action}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 60),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: SimpleAlert(alertType: alertType??SimpleAlertType.alert, text: message,)));
  }

  static showColoredSnakeBar(context,{Color? color,Widget? widget,required String message}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 10,
        showCloseIcon: true,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        closeIconColor: Colors.white,
        backgroundColor: color,
        content: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message,style: const TextStyle(color: Colors.white),),
            ))
          ],
        )));
  }
}
