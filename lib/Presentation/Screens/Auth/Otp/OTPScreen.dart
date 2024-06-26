import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Localization/Keys.dart';
import '../../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/CustomAppBar.dart';
import '../../../Widgets/SvgIcons.dart';
import 'Componants/OTPFields.dart';
import 'Componants/TimerCounter.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String phone;
  final OTPType otpType;
  const OTPScreen({super.key,required this.phone,required this.otpType});

  @override
  ConsumerState<OTPScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OTPScreen> {
  final GlobalKey<OTPFieldsState> otpFieldsKeys = GlobalKey();
  final GlobalKey<TimerTextState> timerKey = GlobalKey();
  var readyToResendOtp = false;
  @override
  Widget build(BuildContext context) {

    handleState(sendOtpStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      timerKey.currentState?.restart();
    });

    handleState(confirmResetCodeStateProvider,onSuccess: (state){
      login();
    },onLoading: (res){
      context.showLoadingDialog();
    });

    handleState(loginStateNotifierProvider,showLoading: true, onSuccess: (res) {
      if(context.isThereCurrentDialogShowing()){
        try{
          context.pop();
        }catch(e){
          print("NAV cannont pop");
        }
      }
      context.go(R_HomeScreen);
    });

    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: "OTP",
          navigated: true,
          isCenter: false,
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: Text(
              context.tr(arabicKey),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SVGIcons.appLogoIcon(width: 113, height: 95, color: Colors.black),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Please enter the verification code you",
              style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "received from ",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts16w400,
                        children: <TextSpan>[
                          TextSpan(
                              text: widget.phone,
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts16w700)
                        ])),
                const SizedBox(
                  width: 8,
                ),
                InkWell(child: SVGIcons.editIcon(),onTap: (){
                  context.pop();
                }),
              ],
            ),
            const SizedBox(height: 40,),
            OTPFields(key: otpFieldsKeys,),
            const SizedBox(height: 24,),
            Padding(padding : const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal), child: AppButton(onPress: () {
              if(otpFieldsKeys.currentState?.formKey.currentState?.validate() == true){
                verifyPhone(widget.phone,otpFieldsKeys.currentState?.getCode);
              }
            } ,text: "Continue",height: 48,width: context.getScreenSize.width,)),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TimerText(key: timerKey,onTimerFinish: (){
                  setState(() {
                    readyToResendOtp = true;
                  });
                },)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: TextSpan(
                  text: "Resend verification code",
                  style: TextStyle(
                    color: readyToResendOtp ? AppTheme.mainAppColor : AppTheme.appGrey3, // Set the color to green
                    fontSize: 16.0,
                    decoration: TextDecoration.underline, // Underline the text
                  ),
                  recognizer: TapGestureRecognizer()..onTap = !readyToResendOtp ? null : (){
                    sendOtp();
                    setState(() {
                      readyToResendOtp = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendOtp() async {
    ref.read(sendOtpStateProvider.notifier).sendOtp(widget.phone);
  }

  void verifyPhone(String phone,String? code) async {
    ref.read(confirmResetCodeStateProvider.notifier).confirmReset(phone, code);
  }

  void login() async {
    ref.read(loginStateNotifierProvider.notifier)
        .login(widget.phone);
  }
}
