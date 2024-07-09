import 'package:flutter/services.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../../Data/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants.dart';
import '../../Data/Models/User.dart';
import '../../Localization/Keys.dart';
import '../../Localization/LanguageProvider.dart';
import '../../Utils/UtilsExts.dart';
import '../../main.dart';
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
      UtilsExts.handleStatusBarColorWithIcon(
          statusBarColor: AppTheme.mainAppColor);

      final client = ref.read(clientStateProvider.notifier).checkIfUserExist();
      context.go(R_HomeScreen);
      // if(client != null){
      //   context.go(R_HomeScreen);
      // }else {
      //   if(prefs.getBool(doneLandingKey) == true){
      //     context.go(R_LoginScreen);
      //   }else {
      //     context.push(R_OnBoardingScreen);
      //   }
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: context.getScreenSize.width,
          height: context.getScreenSize.height,
          decoration: const BoxDecoration(
            color: AppTheme.mainAppColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TweenAnimationBuilder<double>(
                  curve: Curves.ease,
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 4),
                  builder:
                      (BuildContext context, double opacity, Widget? child) {
                    return Opacity(
                        opacity: opacity,
                        child: SVGIcons.appLogoIcon(width: 191, height: 159));
                  }),
              const Spacer(),
            ],
          ),
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
}
