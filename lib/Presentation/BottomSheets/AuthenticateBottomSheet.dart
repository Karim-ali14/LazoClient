import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Eunms.dart';
import '../Widgets/SvgIcons.dart';

// typedef OnLoginClicked = Function()
class AuthenticateBottomSheet extends StatelessWidget {
  final VoidCallback onLoginClicked ;
  final VoidCallback onSignUpClicked ;
  const AuthenticateBottomSheet({super.key, required this.onLoginClicked, required this.onSignUpClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                height: 55.h,
                margin: EdgeInsets.only(bottom: 32.h),
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "You need to login/Create\n Account first",
                        style: AppTheme
                            .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPaddingHorizontal),
                        child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: SVGIcons.localSVG(closeIconSvg,
                                width: 32, height: 32)),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                              width: double.infinity,
                              height: 48.h,
                              text: "Sign In",
                              outlined : true,
                              onPress: (){
                                context.pop();
                                onLoginClicked.call();
                                // navigateToLogin(context);
                              }),
                        ),
                        SizedBox(width: 16.w,),
                        Expanded(
                          child: AppButton(
                              width: double.infinity,
                              height: 48.h,
                              text: "Create Account",
                              onPress: (){
                                context.pop();
                                onSignUpClicked.call();
                                // navigateToLogin(context);
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
  void navigateToLogin(BuildContext context) {
    context.push(R_LoginScreen,extra: {"type" : TypeOfMode.ViewMode});
  }
}
