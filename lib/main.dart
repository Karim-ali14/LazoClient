import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/FilterScreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/LoginSreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as ago;

import '../../../../../Constants.dart';
import '../../../../../Presentation/Screens/SplashScreen.dart';

import 'Constants/Eunms.dart';
import 'Presentation//Theme/AppTheme.dart';
import 'Presentation/Screens/Auth/Otp/OTPScreen.dart';
import 'Presentation/Screens/home/HomeScreen.dart';
import 'Presentation/Screens/home/ShowAllCategoryAndOccasionsData.dart';
import 'Presentation/Screens/home/ShowProductAndServiceScreen.dart';
import 'Presentation/Screens/home/ShowTopSellers.dart';
import 'Presentation/Screens/onbaording/OnBordingScreen.dart';

late SharedPreferences prefs;

/*@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId} ${message.data}");

}


void getNotificationsOnForeground({WidgetRef? ref}){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification} ${message.data}');
      ref?.read(getNotificationsProvider.notifier).getNotifications();
      ref?.read(notificationsCountProvider.notifier).getNotifications();
      NotificationsUtils.showNotification(message.notification?.title ?? "N/A", message.notification?.body ?? "N/A");
    }
  });
}

void handlingNotificationPermission() async {


  try{
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }catch(e){

  }

}

Future<void> setupInteractedMessage(BuildContext context) async {

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    _handleMessage(initialMessage,context);
  }

  FirebaseMessaging.onMessageOpenedApp.listen((message){
    _handleMessage(message,context);
  });
}

void _handleMessage(RemoteMessage message,BuildContext context) {
  print("Data Opened ${message.data}");
  GoRouter.of(context).push(R_Teams);
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //SharedPrefs
  prefs = await SharedPreferences.getInstance();
  //FCM
  //final fcmToken = await FirebaseMessaging.instance.getToken();
  //Notifications
  //handlingNotificationPermission();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.subscribeToTopic("championship");

  // Check if you received the link via `getInitialLink` first

  ago.setLocaleMessages('ar', ago.ArMessages());
  //Main App
  runApp(ProviderScope(
      child: EasyLocalization(supportedLocales: const [
    Locale("en"),
    Locale("ar"),
  ], path: 'assets/translations', child: MyApp())));
}

class MyApp extends ConsumerWidget {
  final appLang;
  MyApp({Key? key, this.appLang}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
      initTheme: Theme.of(context),
      duration: const Duration(milliseconds: 500),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Lazo',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: R_splashScreenRout,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: R_OnBoardingScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingScreen(),
      ),
      GoRoute(
        path: R_HomeScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const ShowTopSellers(),
      ),
      GoRoute(
          path: R_LoginScreen,
          builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
          path: R_OTP,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return OTPScreen(phone:extra["phone"],image:extra["image"],name: extra["name"],email: extra["email"],cityId: extra["cityId"], otpType: extra["type"],);
          }
      ),
      GoRoute(
          path: R_SignUp,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          }
      ),
      GoRoute(
          path: R_FilterScreen,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return FilterScreen(type: extra["type"] as FilterScreenTypes);
          }
      ),
    ],
  );
}
