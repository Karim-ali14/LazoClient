import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Screens/FilterScreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/LoginSreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/SignUpScreen.dart';
import 'package:lazo_client/Presentation/Screens/GoogleMapScreen.dart';
import 'package:lazo_client/Presentation/Screens/More/PrivacyAndPolicyScreen.dart';
import 'package:lazo_client/Presentation/Screens/More/TermsAndConditionsScreen.dart';
import 'package:lazo_client/Presentation/Screens/PaymentScreen.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/details/ProductDetailsScreen.dart';
import 'package:lazo_client/Presentation/Screens/details/SellerDetailsScreen.dart';
import 'package:lazo_client/Presentation/Screens/home/ShowBestProductAndServiceScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/OrdersScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/RatingOrderItemsScreen.dart';
import 'package:lazo_client/Presentation/Screens/profileScreen/EditProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as ago;

import '../../../../../Constants.dart';
import '../../../../../Presentation/Screens/SplashScreen.dart';

import 'Constants/Eunms.dart';
import 'Localization/Keys.dart';
import 'Presentation//Theme/AppTheme.dart';
import 'Presentation/Screens/Auth/Otp/OTPScreen.dart';
import 'Presentation/Screens/More/FAQScreen.dart';
import 'Presentation/Screens/More/MoreScreen.dart';
import 'Presentation/Screens/checkout/CheckoutScreen.dart';
import 'Presentation/Screens/details/ShowAllRatingAndReviewScreen.dart';
import 'Presentation/Screens/home/HomeScreen.dart';
import 'Presentation/Screens/home/ShowAllCategoryAndOccasionsData.dart';
import 'Presentation/Screens/home/SearchScreen.dart';
import 'Presentation/Screens/home/ShowTopSellers.dart';
import 'Presentation/Screens/mainScreen/MainScreen.dart';
import 'Presentation/Screens/onbaording/OnBordingScreen.dart';
import 'Presentation/Screens/orders/OrderDetailsScreen.dart';
import 'Presentation/Screens/profileScreen/EditPhoneScreen.dart';
import 'Presentation/Screens/profileScreen/ProfileScreen.dart';
import 'Presentation/Screens/wishlist/WishlistScreen.dart';
import 'Utils/NotificationsUtils.dart';

late SharedPreferences prefs;

Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');

  // Process the data payload
  if (message.data.isNotEmpty) {
    print('Data: ${message.data}');
    String type = message.data['type'];
    String title = message.data['title'];
    String messageText = message.data['description'];

    // You can process the data and navigate to a specific screen or show a notification
    // For example, if the screen is "messages_screen", navigate to a specific screen
    print('Type: $type, Message: $messageText');

    // You could trigger a local notification or some other action
    NotificationsUtils.showNotification(title ?? "N/A", messageText ?? "N/A",dataJson: json.encode(message.data));

  }
}

void getNotificationsOnForeground(/*{WidgetRef? ref}*/){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    _firebaseMessagingHandler(message);
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

Future<void> setupInteractedMessage(BuildContext? context) async {

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    _handleMessage(initialMessage,context);
  }

  FirebaseMessaging.onMessageOpenedApp.listen((message){
    _handleMessage(message,context);
  });
}

void _handleMessage(RemoteMessage message,BuildContext? context) {
  print("Data Opened ${message.data}");
  if(context == null) return;
  if (message.data.isNotEmpty) {
    String type = message.data['type'];
    String id = message.data['id'];

    if(type == "order") {
      GoRouter.of(context).push(R_OrderDetails, extra: {orderIdKey: id});
    }
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  //SharedPrefs
  prefs = await SharedPreferences.getInstance();
  // // Notifications
  handlingNotificationPermission();
  //
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  getNotificationsOnForeground();
  // setupInteractedMessage(navigatorKey.currentContext);
  // await FirebaseMessaging.instance.subscribeToTopic("championship");


  // Background notification handling
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print(" Background notification handling ${message.data}");
    _handleMessage(message,navigatorKey.currentContext);
  });

  // Handle app launch when terminated
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      print(" Handle app launch when terminated ${message.data}");
      _handleMessage(message,navigatorKey.currentContext);
    }
  });

  ago.setLocaleMessages('ar', ago.ArMessages());
  //Main App
  runApp(ProviderScope(
      child: EasyLocalization(supportedLocales: const [
    Locale("en"),
    Locale("ar"),
  ], path: 'assets/translations', child: MyApp())));
}

void handleNotificationClicks(RemoteMessage message) {
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
    navigatorKey: navigatorKey,
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
            const HomeScreen(),
      ),
      GoRoute(
        path: R_MainScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
      GoRoute(
        path: R_LoginScreen,
        builder: (BuildContext context, GoRouterState state) {
          var extra = state.extra as Map;
          return LoginScreen(
            type: extra["type"] as TypeOfMode,
          );
        },
      ),
      GoRoute(
          path: R_OTP,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return OTPScreen(
              phone: extra["phone"],
              image: extra["image"],
              name: extra["name"],
              email: extra["email"],
              cityId: extra["cityId"],
              otpType: extra["type"],
              typeOfMode: extra["typeOfMode"] as TypeOfMode,
            );
          }),
      GoRoute(
          path: R_SignUp,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return SignUpScreen(
              typeOfMode: extra["typeOfMode"] as TypeOfMode,
            );
          }),
      GoRoute(
          path: R_SeeAllCategoryOrOccasion,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return ShowAllCategoryAndOccasionsData(
                type: extra["type"] as CategoryType);
          }),
      GoRoute(
          path: R_SeeAllProductOrService,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return SearchScreen(
                title: extra["title"],
                id: extra["id"],
                type: extra["type"] as CategoryType);
          }),
      GoRoute(
          path: R_SeeAllSeller,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return ShowTopSellers(extra["type"] as CategoryType,
                extra["categoryId"], extra["title"]);
          }),
      GoRoute(
          path: R_ShowBestProductOrService,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return ShowBestProductAndServiceScreen(
              extra["title"],
              extra["type"] as ItemType,
              occasionId: extra["occasionId"],
              categoryId: extra["categoryId"],
              providerId: extra["providerId"],
            );
          }),
      GoRoute(
          path: R_FilterScreen,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return FilterScreen(
              type: extra["type"] as FilterScreenTypes,
              searchValue: extra["searchValue"],
              categoryId: extra["categoryId"],
              occasionId: extra["occasionId"],
            );
          }),
      GoRoute(
          path: "$R_ProductAndServiceDetails/:id",
          builder: (BuildContext context, GoRouterState status) {
            var extra = status.extra as Map;
            return ProductDetailsScreen(
              name: extra["name"],
              id: status.pathParameters["id"],
              relatedCategoriesIds: extra["categoryIds"] as List<int>,
              itemType: extra["type"] as ItemType,
              productDetails: extra["product"],
              serviceShowData: extra["service"],
              cartId: extra["cartId"],
            );
          }),
      GoRoute(
          path: R_ShowAllReviews,
          builder: (BuildContext context, GoRouterState status) {
            var extra = status.extra as Map;
            return ShowAllRatingAndReviewScreen(
              id: extra["id"],
              itemType: extra["type"] as ItemType,
            );
          }),
      GoRoute(
          path: R_SellerDetails,
          builder: (BuildContext context, GoRouterState status) {
            var extra = status.extra as Map;
            return SellerDetailsScreen(sellerId: extra["sellerId"]);
          }),
      GoRoute(
          path: R_MoreScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const MoreScreen()),
      GoRoute(
          path: R_NotificationScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox()),
      GoRoute(
          path: R_FAQScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const FAQScreen()),
      GoRoute(
          path: R_TermsAndConditionsScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const TermsAndConditionsScreen()),
      GoRoute(
          path: R_PrivacyAndPolicyScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const PrivacyAndPolicyScreen()),
      GoRoute(
          path: R_ProfileScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfileScreen()),
      GoRoute(
          path: R_EditProfileScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const EditProfileScreen()),
      GoRoute(
          path: R_EditPhoneScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const EditPhoneScreen()),
      GoRoute(
          path: R_CartScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const CartScreen()),
      GoRoute(
          path: R_CheckoutScreen,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return CheckoutScreen(
              type: extra["type"] as CheckoutTypes,
              service: extra["service"] as ServiceShowData?,
              serviceSelectedListIds : extra[serviceSelectedListIdsKey],
              serviceSelectedListItemsIds : extra[serviceSelectedListItemsIdsKey]
            );
          }),
      GoRoute(
          path: R_GoogleMapScreen,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return GoogleMapScreen(
              locationSelected: extra["locationSelected"],
            );
          }),
      GoRoute(
          path: R_WishListScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const WishListScreen();
          }),
      GoRoute(
          path: R_OrdersScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const OrdersScreen();
          }),
      GoRoute(
          path: R_OrderDetails,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return OrderDetailsScreen(orderId: extra[orderIdKey]);
          }),
      GoRoute(
          path: R_RatingOrder,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return RatingOrderItemsScreen(order: extra[orderKey] as ClientOrderDetails);
          }),
      // GoRoute(
      //     path: R_PaymentScreen,
      //     builder: (BuildContext context, GoRouterState state) {
      //       var extra = state.extra as Map;
      //       return PaymentScreen(paymentLink: extra["paymentLink"]);
      //     }),
    ],
  );
}
