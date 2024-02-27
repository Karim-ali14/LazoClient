import 'package:base_flutter_app/Utils/Extintions.dart';

import '../../../../../Data/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants.dart';
import '../../Data/Models/User.dart';
import '../../Localization/LanguageProvider.dart';
import '../../main.dart';
import '../Theme/AppColors.dart';
import '../Theme/AppThemeHandler.dart';


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
    Future.delayed(const Duration(seconds: 2),(){
      User? user = ref.read(userProvider);
      print("User $user");
      if(user != null){
        context.push(R_MainScreen);
      }else{
        setState(() => _opc = 1.0);
      }
    });
    //setupInteractedMessage(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: SingleChildScrollView(
        child: Center(
          child:  Container(
            width: context.getScreenSize.width,
            height: context.getScreenSize.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainAppColorLight,
                    AppColors.secondaryAppColorLight
                  ],
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                AnimatedPadding(duration: const Duration(milliseconds: 500),padding: EdgeInsets.only(top: _opc == 1.0 ? 0 : 130), child: Image.asset(whiteAppLogo,height: 200) ,),
                const Spacer(),
                AnimatedOpacity(opacity: _opc , duration: const Duration(milliseconds: 500),
                  child: Container(),)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.mainBackgroundLightColor,
    );
  }
}
