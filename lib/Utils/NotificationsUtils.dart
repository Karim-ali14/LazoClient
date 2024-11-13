import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/main.dart';

import '../Localization/Keys.dart';

const _channelName = "CounterAttackChannel";
const _channelID = "CounterAttackChannelID";
const _channelDescription = "CounterAttackChannelDesc";

class NotificationsUtils {

  static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  static AndroidNotificationDetails? androidNotificationDetails;

  NotificationsUtils(){
    _setupNotifications();
  }
/*
{sound: true, icon: ic_notification, description: this is description,
id: 169, type: order, title: this is title, clickAction: .MainActivity}
*/
  static Future _setupNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin?.initialize(initializationSettings,onDidReceiveNotificationResponse: _onSelectNotification);

    androidNotificationDetails = AndroidNotificationDetails(_channelID, _channelName,
    importance: Importance.max,
    priority: Priority.high,
    sound: UriAndroidNotificationSound("assets/images/refree_whistle.mp3"),
    playSound: true,
    fullScreenIntent: true, ticker: 'ticker');
  }

  static void showNotification(String title,String body , {String? dataJson}) async {

    if(androidNotificationDetails == null){
     await _setupNotifications();
    }
    final Map<String, dynamic> payload = json.decode(dataJson ?? '{}');

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin?.show(int.tryParse(payload["id"])??0, title , body, notificationDetails, payload: dataJson);
  }

  static Future _onSelectNotification(NotificationResponse? response) async{
    if(navigatorKey.currentContext == null) return;
    try{

      final Map<String, dynamic> payload = json.decode(response?.payload ?? '{}');
      if(payload["type"] == "order") {
        GoRouter.of(navigatorKey.currentContext!).push(R_OrderDetails, extra: {orderIdKey: payload["id"]});
      }

    }catch(e){
      print(e.toString());
    }
  }

}