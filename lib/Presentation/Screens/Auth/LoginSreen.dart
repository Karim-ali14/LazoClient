import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Assets.dart';
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
import '../../Widgets/LanguageText.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final TypeOfMode? type;
  const LoginScreen({this.type = TypeOfMode.AuthMode, super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  final TextEditingController codeController =
      TextEditingController(text: '+966');
  final ValueNotifier<String> code = ValueNotifier("+966");
  @override
  Widget build(BuildContext context) {
    handleState(sendOtpForLoginStateProvider, showLoading: true,
        onSuccess: (res) {
      print("formLogin $res");
      if (res.data?.isExist == true) {
        AppSnackBar.showSnackBar(context,
            isSuccess: true, message: res.data?.message ?? "Success !");
        completeLoginProcess();
      } else {
        AppSnackBar.showSnackBar(context,
            isSuccess: false, message: context.tr(thisPhoneIsNotExitsKey));
      }
    }, onFail: (res) {
      AppSnackBar.showSnackBar(context,
          isSuccess: false, message: res.message ?? "");
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
                    widget.type == TypeOfMode.ViewMode
                        ? Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    context.pop(context);
                                  },
                                  child: SVGIcons.backArrowIcon()),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        : const SizedBox(),
                    Text(
                      context.tr(loginKey),
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts20w700,
                    ),
                    Spacer(),
                    LanguageText()
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SVGIcons.localSVG(lazoLogoAuth, width: 113, height: 95),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // كود الدولة (TextField + Picker)
                    GestureDetector(
                      onTap: () async {
                        final country =
                            await countryPicker.showPicker(context: context);
                        if (country != null) {
                            code.value = country.dialCode;
                        }
                      },
                      child: Container(
                        width: 84,
                        height: 58,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: code,
                              builder: ( context, value,  child){
                                return Text(
                                  value,

                                  style: AppTheme
                                      .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                );
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SVGIcons.localSVG(downArrowImg,width: 10,height: 10,color: AppTheme.appGrey11)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        textInputType: TextInputType.phone,
                        textFieldBorderColor: Colors.white,
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
                    ),
                  ],
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
                /*Row(
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
                )*/
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
      ref
          .read(sendOtpForLoginStateProvider.notifier)
          .sendOtp(phoneController.text.toString());
    }
  }

  void signUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.AuthMode});
  }

  void completeLoginProcess() {
    context.push(R_OTP, extra: {
      "phone": phoneController.text.toString(),
      "type": OTPType.Login,
      "typeOfMode": widget.type,
      "codeCountry" : code.value.removeFirstChar("+"),
    });
  }
}
