import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    await flutterLocalNotificationsPlugin?.initialize(initializationSettings);

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

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin?.show(0, title , body, notificationDetails, payload: dataJson);
  }

  static Future _onSelectNotification(String? payload) async{

  }
}