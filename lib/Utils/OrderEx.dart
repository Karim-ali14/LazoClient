import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../Constants/Eunms.dart';
import '../Localization/Keys.dart';
import '../Presentation/Theme/AppTheme.dart';

extension OrderEx on String{
  String getOrderStatus(BuildContext context){
    String orderStatus = "";
    switch (this){
      case "1" : {
        orderStatus = context.tr(paddingKey);
        break;
      }
      case "3" :
      case "2" : {
        orderStatus = context.tr(waitingKey);
        break;
      }case "4" : {
        orderStatus = context.tr(preparingKey);
        break;
      }case "5" : {
        orderStatus = context.tr(readyToShippingKey);
        break;
      }
      case "6" :
      case "6.5" :
      case "7" :
      case "8" :
      case "5.5" : {
        orderStatus = context.tr(finishedKey);
        break;
      }
      case "10" :
      case "12" :
      case "14" :
      case "11" : {
        orderStatus = context.tr(canceledKey);
        break;
      }
    }
    return orderStatus;
  }
  Color getOrderStatusColor(BuildContext context){
    Color orderStatusColor = AppTheme.appYellow;
    switch (this){
      case "1" : {
        orderStatusColor = AppTheme.appYellow;
        break;
      }
      case "3" :
      case "2" : {
        orderStatusColor = AppTheme.appBlue;
        break;
      }case "4" : {
        orderStatusColor = AppTheme.preparingColor;
        break;
      }case "5" : {
        orderStatusColor = AppTheme.readyToShippingColor;
        break;
      }
      case "6" :
      case "6.5" :
      case "7" :
      case "8" :
      case "5.5" : {
        orderStatusColor = AppTheme.finishColor;
        break;
      }
      case "10" :
      case "12" :
      case "14" :
      case "11" : {
        orderStatusColor = AppTheme.mainAppColor;
        break;
      }
    }
    return orderStatusColor;
  }
  ButtonsType getOrderStatusForShowButtons(BuildContext context){

    ButtonsType orderStatusColor = ButtonsType.ViewDetails;
    switch (this){
      case "1" : {
        orderStatusColor = ButtonsType.ShowAcceptOrCancel;
        break;
      }
      case "3" :
      case "2" : {
        orderStatusColor =  ButtonsType.ViewDetails;
        break;
      }case "4" : {
        orderStatusColor =  ButtonsType.ReadyToShipping;
        break;
      }case "5" : {
        orderStatusColor =  ButtonsType.Finish;
        break;
      }
      case "5.5" :
      case "6" :
      case "6.5" :
      case "7" :
      case "8" :
      case "12" :
      {
        orderStatusColor =  ButtonsType.ViewDetails;
        break;
      }
    }
    return orderStatusColor;
  }

  OrderStateActionType getOrderAction(){

    OrderStateActionType orderStatusColor = OrderStateActionType.Accepte;
    switch (this){
      case "2" : {
        orderStatusColor = OrderStateActionType.Accepte;
        break;
      }case "5" : {
        orderStatusColor =  OrderStateActionType.ReadyToShipping;
        break;
      }case "5.5" : {
        orderStatusColor =  OrderStateActionType.Finish;
        break;
      }
      case "10":
      case "11": {
        orderStatusColor =  OrderStateActionType.Cancel;
        break;
      }
    }
    return orderStatusColor;
  }
}