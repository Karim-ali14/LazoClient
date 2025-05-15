import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/NotificationsUtils.dart';

import '../../../../../Data/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants.dart';
import '../../Data/Models/User.dart';
import '../../Doman/CommenProviders/ApiProvider.dart';
import '../../Localization/Keys.dart';
import '../../Localization/LanguageProvider.dart';
import '../../Localization/LanguageType.dart';
import '../../Utils/HalperMethods.dart';
import '../../Utils/UtilsExts.dart';
import '../../main.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';
import '../Theme/AppThemeHandler.dart';
import '../Widgets/SvgIcons.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  double _opc = 0.0;
  late AppThemeMode _appThemeMode;
  bool isThereUser = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {

      ref.read(langProvider.notifier).fetchLocale(LanguageType.en);

      ref.read(getCategoriesDataStateNotifiers.notifier).getCategoriesData();

      ref.read(getOccasionsDataStateNotifiers.notifier).getOccasionsData();

      ref.read(getAppInfoStateNotifier.notifier).getAppInfo();

      handleGetCities();

      UtilsExts.handleStatusBarColorWithIcon(
          statusBarColor: AppTheme.mainAppColor);

      final client = ref.read(clientStateProvider.notifier).checkIfUserExist();
      ref.read(clientStateProvider.notifier).setUser(client);
      print("client model : $client");

      if(client != null){
        initFcmToken();
        if(prefs.getBool(selectedCityKey) == true){
          context.go(R_MainScreen);
        }else{
          context.push(R_SelectCountriesScreen);
        }
      }else {
        if(prefs.getBool(doneLandingKey) == true){
          if(prefs.getBool(selectedCityKey) == true){
            context.go(R_MainScreen);
          }else{
            context.push(R_SelectCountriesScreen);
          }
        }else {
          context.push(R_OnBoardingScreen);
        }
      }
      WidgetsBinding.instance.addPostFrameCallback((_){
        ref.read(apiClient).defaultHeaderMap["lang"] = "en";
        var sessionId = ref.read(getSessionHandlerStateNotifier.notifier)
            .checkIfSessionIdExist();
        if(client == null && sessionId?.isNotEmpty == true){
          ref.read(apiClient).defaultHeaderMap["session_id"] = sessionId??"";
        }
      });
    });
    super.initState();
  }

  void initFcmToken() async {
    //FCM
    final fcmToken = await FirebaseMessaging.instance.getToken();
    ref.read(updateFcmTokenStateProvider.notifier).calculateInstantOrder(
      fcmToken: fcmToken
    );
    print("Fcm Token : $fcmToken");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: context.getScreenSize.width,
          height: context.getScreenSize.height,
          decoration: const BoxDecoration(
            color: AppTheme.mainAppColorLight,
          ),
          child: SVGIcons.localGIF(lazoSplachImage, // Use BoxFit.fill if you want exact stretch
            width: double.infinity,
            height: double.infinity,),
        ),
      ),
      backgroundColor: AppTheme.mainBackgroundLightColor,
    );
  }

  @override
  void dispose() {
    super.dispose();
    UtilsExts.handleStatusBarColorWithIcon();
  }

  void handleGetCities() async{
    ref.read(fetchCountriesStateNotifier.notifier).fetchCountries();
    if(prefs.getBool(selectedCityKey) == true){
      Country countrySelected = await getObject<Country>(countrySelectedKey,(json) => Country.fromJson(json) ?? Country()) ?? Country();
      ref.read(getCities.notifier).getCities(countryId: countrySelected.id.toString());
    }
  }
}
