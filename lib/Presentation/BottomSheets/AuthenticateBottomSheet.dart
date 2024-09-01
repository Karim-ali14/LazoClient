import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

import '../../Constants/Eunms.dart';
import '../Widgets/SvgIcons.dart';

class AuthenticateBottomSheet extends StatelessWidget {
  const AuthenticateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      child: SizedBox(
        height: 360,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: SVGIcons.closeSquareSvgIcon())),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SVGIcons.existGifIcon(),
                SizedBox(
                  height: 32,
                ),
                Text("You need you login first",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,),
                SizedBox(
                  height: 24,
                ),
                Text("You can see your notifications when you login.",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
                SizedBox(
                  height: 32,
                ),
                AppButton(
                    width: double.infinity,
                    height: 40,
                    text: "Login",
                    onPress: (){
                      context.pop();
                      navigateToLogin(context);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    context.push(R_LoginScreen,extra: {"type" : TypeOfMode.ViewMode});
  }
}
