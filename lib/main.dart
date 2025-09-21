import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Screens/FilterScreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/LoginSreen.dart';
import 'package:lazo_client/Presentation/Screens/Auth/SignUpScreen.dart';
import 'package:lazo_client/Presentation/Screens/GoogleMapScreen.dart';
import 'package:lazo_client/Presentation/Screens/More/PrivacyAndPolicyScreen.dart';
import 'package:lazo_client/Presentation/Screens/More/TermsAndConditionsScreen.dart';
import 'package:lazo_client/Presentation/Screens/PaymentScreen.dart';
import 'package:lazo_client/Presentation/Screens/addresses/add_address_screen.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/details/ProductAndServiceDetailsScreen.dart';
import 'package:lazo_client/Presentation/Screens/details/SellerDetailsScreen.dart';
import 'package:lazo_client/Presentation/Screens/home/ShowBestProductAndServiceScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/OrdersScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/RatingOrderItemsScreen.dart';
import 'package:lazo_client/Presentation/Screens/profileScreen/EditProfileScreen.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/CollectionDetailsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as ago;

import '../../../../../Constants.dart';
import '../../../../../Presentation/Screens/SplashScreen.dart';

import 'Constants/Eunms.dart';
import 'Localization/Keys.dart';
import 'Localization/LanguageProvider.dart';
import 'Presentation//Theme/AppTheme.dart';
import 'Presentation/Screens/Auth/Otp/OTPScreen.dart';
import 'Presentation/Screens/More/FAQScreen.dart';
import 'Presentation/Screens/More/MoreScreen.dart';
import 'Presentation/Screens/Notification/NotificationScreen.dart';
import 'Presentation/Screens/Wallet/WalletScreen.dart';
import 'Presentation/Screens/addresses/addresses_screen.dart';
import 'Presentation/Screens/cartScreen/order_process_screen.dart';
import 'Presentation/Screens/checkout/CheckoutScreen.dart';
import 'Presentation/Screens/details/ShowAllRatingAndReviewScreen.dart';
import 'Presentation/Screens/home/HomeScreen.dart';
import 'Presentation/Screens/home/ShowAllCategoryAndOccasionsData.dart';
import 'Presentation/Screens/search/SearchScreen.dart';
import 'Presentation/Screens/home/ShowTopSellers.dart';
import 'Presentation/Screens/mainScreen/MainScreen.dart';
import 'Presentation/Screens/onbaording/OnBordingScreen.dart';
import 'Presentation/Screens/orders/OrderDetailsScreen.dart';
import 'Presentation/Screens/profileScreen/EditPhoneScreen.dart';
import 'Presentation/Screens/profileScreen/ProfileScreen.dart';
import 'Presentation/Screens/select_countries_screen/select_countries_screen.dart';
import 'Presentation/Screens/showOccasionsResult/OccasionResultScreen.dart';
import 'Presentation/Screens/wishlist/WishlistScreen.dart';
import 'Presentation/counter_screen.dart';
import 'Utils/NotificationsUtils.dart';
import 'package:flutter/material.dart' as material;

import 'Utils/TransitionHelper.dart';

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
    NotificationsUtils.showNotification(title ?? "N/A", messageText ?? "N/A",
        dataJson: json.encode(message.data));
  }
}

void getNotificationsOnForeground(/*{WidgetRef? ref}*/) {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    _firebaseMessagingHandler(message);
  });
}

void handlingNotificationPermission() async {
  try {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  } catch (e) {}
}

Future<void> setupInteractedMessage(BuildContext? context) async {
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    _handleMessage(initialMessage, context);
  }

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    _handleMessage(message, context);
  });
}

void _handleMessage(RemoteMessage message, BuildContext? context) {
  print("Data Opened ${message.data}");
  if (context == null) return;
  if (message.data.isNotEmpty) {
    String type = message.data['type'];
    String id = message.data['id'];

    if (type == "order") {
      GoRouter.of(context).push(R_OrderDetails, extra: {orderIdKey: id});
    }
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();

  handlingNotificationPermission();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  getNotificationsOnForeground();

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Background notification handling ${message.data}");
    _handleMessage(message, navigatorKey.currentContext);
  });

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      print("Handle app launch when terminated ${message.data}");
      _handleMessage(message, navigatorKey.currentContext);
    }
  });

  ago.setLocaleMessages('ar', ago.ArMessages());

  runApp(ProviderScope(
    child: EasyLocalization(
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      path: 'assets/translations',
      child: MyApp(),
    ),
  ));
}

void handleNotificationClicks(RemoteMessage message) {}

class MyApp extends ConsumerWidget {
  final appLang;
  MyApp({Key? key, this.appLang}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
        initTheme: Theme.of(context),
        duration: const Duration(milliseconds: 500),
        child: ScreenUtilInit(
          designSize: material.Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height), // Adjust to your design size
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Lazo',
              themeMode: ThemeMode.light,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: ref.watch(langProvider),
              routerDelegate: _router.routerDelegate,
              routeInformationProvider: _router.routeInformationProvider,
              routeInformationParser: _router.routeInformationParser,
            );
          },
        ));
  }

  final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      GoRoute(
          path: R_splashScreenRout,
          pageBuilder: (context, state) => buildPageWithPushStyle(
                key: state.pageKey,
                child: SplashScreen(),
              )),
      GoRoute(
          path: R_OnBoardingScreen,
          pageBuilder: (context, state) => buildPageWithPushStyle(
                key: state.pageKey,
                child: const OnBoardingScreen(),
              )),
      GoRoute(
        path: R_HomeScreen,
        pageBuilder: (context, state) =>
            buildPageWithPushStyle(key: state.pageKey, child: const HomeScreen()),
      ),
      GoRoute(
        path: R_MainScreen,
        pageBuilder: (context, state) =>
            buildPageWithPushStyle(key: state.pageKey, child: const MainScreen()),
      ),
      GoRoute(
        path: R_Walletscreen,
        pageBuilder: (context, state) =>
            buildPageWithPushStyle(key: state.pageKey, child: const Walletscreen()),
      ),
      GoRoute(
        path: R_LoginScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            key: state.pageKey,
            child: LoginScreen(
              type: extra["type"] as TypeOfMode,
            ),
          );
        },
      ),
      GoRoute(
          path: R_OTP,
          pageBuilder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return buildPageWithPushStyle(
              key: state.pageKey,
              child: OTPScreen(
                phone: extra["phone"],
                image: extra["image"],
                name: extra["name"],
                email: extra["email"],
                cityId: extra["cityId"],
                otpType: extra["type"],
                codeCountry: extra["codeCountry"],
                typeOfMode: extra["typeOfMode"] as TypeOfMode,
              ),
            );
          }),
      GoRoute(
          path: R_SignUp,
          pageBuilder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return buildPageWithPushStyle(
              key: state.pageKey,
              child: SignUpScreen(
                typeOfMode: extra["typeOfMode"] as TypeOfMode,
              ),
            );
          }),
      GoRoute(
          path: R_SeeAllCategoryOrOccasion,
          pageBuilder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return buildPageWithPushStyle(
              key: state.pageKey,
              child: ShowAllCategoryAndOccasionsData(
                type: extra["type"] as CategoryType,
              ),
            );
          }),
      GoRoute(
          path: R_SeeAllProductOrService,
          pageBuilder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return buildPageWithPushStyle(
              key: state.pageKey,
              child: SearchScreen(
                title: extra["title"],
                id: extra["id"],
                type: extra["type"] as CategoryType,
              ),
            );
          }),
      GoRoute(
          path: R_SeeAllSeller,
          pageBuilder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return buildPageWithPushStyle(
              key: state.pageKey,
              child: ShowTopSellers(
                extra["type"] as CategoryType,
                extra["categoryId"],
                extra["title"],
              ),
            );
          }),
      GoRoute(
        path: R_ShowBestProductOrService,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: ShowBestProductAndServiceScreen(
              extra["title"],
              extra["type"] as ItemType,
              occasionId: extra["occasionId"],
              categoryId: extra["categoryId"],
              providerId: extra["providerId"],
            ),
          );
        },
      ),
      GoRoute(
        path: R_FilterScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: FilterScreen(
              type: extra["type"] as FilterScreenTypes,
              searchValue: extra["searchValue"],
              categoryId: extra["categoryId"],
              occasionId: extra["occasionId"],
            ),
          );
        },
      ),
      GoRoute(
        path: "$R_ProductAndServiceDetails/:id",
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: ProductAndServiceDetailsScreen(
              name: extra["name"],
              id: state.pathParameters["id"],
              relatedCategoriesIds: extra["categoryIds"] as List<int>,
              itemType: extra["type"] as ItemType,
              productDetails: extra["product"],
              serviceShowData: extra["service"],
              cartId: extra["cartId"],
              isOutsideDelivery: extra["isOutsideDelivery"],
            ),
          );
        },
      ),
      GoRoute(
        path: R_ShowAllReviews,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: ShowAllRatingAndReviewScreen(
              id: extra["id"],
              itemType: extra["type"] as ItemType,
            ),
          );
        },
      ),
      GoRoute(
        path: R_SellerDetails,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: SellerDetailsScreen(sellerId: extra["sellerId"]),
          );
        },
      ),
      GoRoute(
        path: R_MoreScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const MoreScreen(),
          );
        },
      ),
      GoRoute(
        path: R_NotificationScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const NotificationScreen(),
          );
        },
      ),
      GoRoute(
        path: R_FAQScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const FAQScreen(),
          );
        },
      ),
      GoRoute(
        path: R_TermsAndConditionsScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const TermsAndConditionsScreen(),
          );
        },
      ),
      GoRoute(
        path: R_PrivacyAndPolicyScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const PrivacyAndPolicyScreen(),
          );
        },
      ),
      GoRoute(
        path: R_ProfileScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const ProfileScreen(),
          );
        },
      ),
      GoRoute(
        path: R_EditProfileScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const EditProfileScreen(),
          );
        },
      ),
      GoRoute(
        path: R_EditPhoneScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const EditPhoneScreen(),
          );
        },
      ),
      GoRoute(
        path: R_CartScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: OrderProcessScreen(
              initCurrentPage: 0,
              type: extra["type"] as CheckoutTypes,
              service: extra["service"] as ServiceShowData?,
              serviceSelectedListIds: extra[serviceSelectedListIdsKey],
              serviceSelectedListItemsIds: extra[serviceSelectedListItemsIdsKey],
            ),
          );
        },
      ),
      GoRoute(
        path: R_CheckoutScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: CheckoutScreen(
              type: extra["type"] as CheckoutTypes,
              service: extra["service"] as ServiceShowData?,
              serviceSelectedListIds: extra[serviceSelectedListIdsKey],
              serviceSelectedListItemsIds: extra[serviceSelectedListItemsIdsKey],
            ),
          );
        },
      ),
      GoRoute(
        path: R_GoogleMapScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: GoogleMapScreen(
              locationSelected: extra["locationSelected"],
              city: extra["city"],
            ),
          );
        },
      ),
      GoRoute(
        path: R_WishListScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const WishListScreen(),
          );
        },
      ),
      GoRoute(
        path: R_OrdersScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const OrdersScreen(),
          );
        },
      ),
      GoRoute(
        path: R_OrderDetails,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: OrderDetailsScreen(orderId: extra[orderIdKey]),
          );
        },
      ),
      GoRoute(
        path: R_RatingOrder,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: RatingOrderItemsScreen(
              order: extra[orderKey] as ClientOrderDetails,
            ),
          );
        },
      ),
      GoRoute(
        path: R_PaymentScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: PaymentScreen(paymentLink: extra["paymentLink"]),
          );
        },
      ),
      GoRoute(
        path: R_OccasionResultScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: OccasionResultScreen(
              occasionId: extra["occasionId"],
              title: extra["title"],
              image: extra["image"],
            ),
          );
        },
      ),
      GoRoute(
        path: R_CollectionDetailsScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: CollectionDetailsScreen(
              collectionId: extra["collectionId"],
              collectionName: extra["collectionName"],
            ),
          );
        },
      ),
      GoRoute(
        path: R_AddressesScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const AddressesScreen(),
          );
        },
      ),
      GoRoute(
        path: R_AddAddressScreen,
        pageBuilder: (context, state) {
          var extra = state.extra as Map?;
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: AddAddressScreen(
              isEdit: extra?["isEdit"] ?? false,
              addressItem: extra?["addressItem"] as AddressItem?,
            ),
          );
        },
      ),
      GoRoute(
        path: R_SelectCountriesScreen,
        pageBuilder: (context, state) {
          return buildPageWithPushStyle(
            
            key: state.pageKey,
            child: const SelectCountriesScreen(),
          );
        },
      ),

    ],
  );
}
