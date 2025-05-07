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
import 'Componants/phone_field_with_country_code.dart';

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
  final ValueNotifier<String> codeSelected = ValueNotifier("");
  final ValueNotifier<bool> isCountryCodeEmpty = ValueNotifier(false);
  String? countryCode;
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
                  height: 50,
                ),
                PhoneFieldWithCountryCode(phoneController: phoneController, onSelectCountryCode: (code){
                  countryCode = code;
                  codeSelected.value = code;
                }, isCountryCodeEmpty: isCountryCodeEmpty,),
                const SizedBox(
                  height: 50,
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

  void sendOtp() async {
    isCountryCodeEmpty.value = countryCode?.isEmpty ?? true;
    if (formKey.currentState?.validate() == true && codeSelected.value.isNotEmpty) {
      ref.read(sendOtpForLoginStateProvider.notifier).sendOtp(
          phoneController.text.toString(),
          countryCode: codeSelected.value.removeFirstChar("+"));
    }
  }

  void signUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.AuthMode});
  }

  void completeLoginProcess() {
    print(codeSelected.value);
    context.push(R_OTP, extra: {
      "phone": phoneController.text.toString(),
      "type": OTPType.Login,
      "typeOfMode": widget.type,
      "codeCountry": codeSelected.value.removeFirstChar("+"),
    });
  }
}
