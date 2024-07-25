import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Localization/Keys.dart';
import '../../../Utils/Snaks.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    handleState(sendOtpForLoginStateProvider,showLoading: true, onSuccess: (res) {
      print("formLogin $res");
      if(res.data?.isExist == true){
        AppSnackBar.showSnackBar(context, isSuccess: true, message: res.data?.message ?? "Success !");

        context.push(R_OTP, extra: {
          "phone": phoneController.text.toString(),
          "type": OTPType.Login
        });
      }else{
        AppSnackBar.showSnackBar(context, isSuccess: false, message: context.tr(thisPhoneIsNotExitsKey));
      }
    },onFail: (res){
      AppSnackBar.showSnackBar(context, isSuccess: false, message: res.message ?? "");
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPaddingHorizontal),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.tr(loginKey),
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts20w700,
                    ),
                    Spacer(),
                    Text(
                      context.tr(arabicKey),
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w400,
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SVGIcons.appLogoIcon(
                    width: 113, height: 95, color: Colors.black),
                const SizedBox(
                  height: 40,
                ),
                AppTextField(
                  textInputType: TextInputType.phone,
                  textFieldBorderColor: AppTheme.appGrey3,
                  mode: AutovalidateMode.onUserInteraction,
                  hint: context.tr(phoneNumberKey),
                  label: context.tr(phoneNumberKey),
                  textEditingController: phoneController,
                  validate: (value) {
                    if (value?.isEmpty == true) {
                      return context.tr(enterYourPhoneKey);
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                AppButton(
                  width: context.getScreenSize.width,
                  height: 46,
                  onPress: sendOtp,
                  child: Text(
                    loginKey,
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w400
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.tr(dontHaveAnAccountKey),
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w400,
                    ),
                    InkWell(
                      onTap: signUp,
                      child: Text(
                        context.tr(signUpKey),
                        style: AppTheme
                            .styleWithTextRedAdelleSansExtendedFonts16w400
                            .copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppTheme.mainAppColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      ref
          .read(loginStateNotifierProvider.notifier)
          .login(phoneController.text.toString());
    }
  }

  void sendOtp() async {
    if (formKey.currentState?.validate() == true) {
      ref.read(sendOtpForLoginStateProvider.notifier).sendOtp(phoneController.text.toString());
    }
  }

  void signUp() async {
    context.push(R_SignUp);
  }
}
