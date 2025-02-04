import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/WishListStateNotifiers.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Localization/Keys.dart';
import '../../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/CustomAppBar.dart';
import '../../../Widgets/LanguageText.dart';
import '../../../Widgets/SvgIcons.dart';
import 'Componants/OTPFields.dart';
import 'Componants/TimerCounter.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String phone;
  final String? cityId;
  final String? email;
  final String? image;
  final String? name;
  final OTPType otpType;
  final TypeOfMode? typeOfMode;
  const OTPScreen( {super.key,this.typeOfMode = TypeOfMode.ViewMode,required this.phone,required this.otpType,this.cityId, this.email, this.image, this.name});

  @override
  ConsumerState<OTPScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OTPScreen> {
  final GlobalKey<OTPFieldsState> otpFieldsKeys = GlobalKey();
  final GlobalKey<TimerTextState> timerKey = GlobalKey();
  var readyToResendOtp = false;
  @override
  Widget build(BuildContext context) {

    handleState(sendOtpForLoginStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      timerKey.currentState?.restart();
    });

    handleState(confirmResetCodeStateProvider,showToast: true,onSuccess: (state){
      print("object $state");
      print("object ${state.data?.message}");
      if(widget.otpType == OTPType.Login) {
        login();
      }else if(widget.otpType == OTPType.SignUp){
        signUp();
      } else if(widget.otpType == OTPType.Update){
        updatePhone();
      }
    },onLoading: (res){
      context.showLoadingDialog();
    },onFail: (res){

    });

    handleState(loginStateNotifierProvider, onSuccess: (res) {
      ref.read(getSessionHandlerStateNotifier.notifier).clearSessionId();
      initFcmToken();
      if(context.isThereCurrentDialogShowing()){
        updateMainScreen();
        try{
          if(widget.typeOfMode == TypeOfMode.AuthMode){
            context.go(R_MainScreen);
          }else{
            context.pop();
            context.pop();
            context.pop(true);
          }
        }catch(e){
          print("NAV cannont pop");
        }
      }
    });

    handleState(signUpStateNotifierProvider, onSuccess: (res) {
      print("signUp successful");
      initFcmToken();
      ref.read(getSessionHandlerStateNotifier.notifier).clearSessionId();
      if(context.isThereCurrentDialogShowing()){
        updateMainScreen();
        try{
          if(widget.typeOfMode == TypeOfMode.AuthMode){
            context.go(R_MainScreen);
          }else{
            print("signUp successful sdf");
            context.pop();
            context.pop();
            context.pop(true);
          }
        }catch(e){
          print("NAV cannont pop $e");
        }
      }
    });

    handleState(updateProfileStateProvider, onSuccess: (res) {
      var client = ref.watch(clientStateProvider);
      client?.client = res.data?.data?.client;
      ref.read(clientStateProvider.notifier).setUser(client);
      context.pop();
      context.pop();
      context.pop(true);

    }, showLoading: true);

    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: context.tr(OTPKey),
          navigated: true,
          isCenter: false,
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: LanguageText(),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
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
              context.tr(pleaseEnterTheVerificationCodeYouKey),
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
                          text: context.tr(receivedFromKey),
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
              } ,text: context.tr(continueKey),height: 48,width: context.getScreenSize.width,)),
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
                    text: context.tr(resendVerificationCodeKey),
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
      ),
    );
  }

  void sendOtp() async {
    ref.read(sendOtpForLoginStateProvider.notifier).sendOtp(widget.phone);
  }

  void verifyPhone(String phone,String? code) async {
    ref.read(confirmResetCodeStateProvider.notifier).confirmReset(phone, code);
  }

  void initFcmToken() async{
    //FCM
    final fcmToken = await FirebaseMessaging.instance.getToken();
    ref.read(updateFcmTokenStateProvider.notifier).calculateInstantOrder(
        fcmToken: fcmToken
    );
  }

  void login() async {
    var sessionId = ref.read(getSessionHandlerStateNotifier.notifier).checkIfSessionIdExist();
    if(sessionId?.isNotEmpty == true){
      ref.read(loginStateNotifierProvider.notifier)
          .login(widget.phone,sessionId: sessionId);
    }else{
      ref.read(loginStateNotifierProvider.notifier)
          .login(widget.phone);
    }
  }

  void signUp() {
    var sessionId = ref.read(getSessionHandlerStateNotifier.notifier).checkIfSessionIdExist();
    if(sessionId?.isNotEmpty == true){
      ref.read(signUpStateNotifierProvider.notifier).signUp(
          image: widget.image,
          name: widget.name,
          phone: widget.phone,
          email: widget.email?.isNotEmpty == true ? widget.email : null,
          cityId: "${widget.cityId}",
        sessionId: sessionId
      );
    }else{
      ref.read(signUpStateNotifierProvider.notifier).signUp(
          image: widget.image,
          name: widget.name,
          phone: widget.phone,
          email: widget.email?.isNotEmpty == true ? widget.email : null,
          cityId: "${widget.cityId}",
      );
    }

  }

  void updatePhone() {
    ref.read(updateProfileStateProvider.notifier).updateProfile(
        phone: widget.phone
    );
  }

  void updateMainScreen(){
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
    ref.read(getNewOrderStateProvider.notifier).getOrders();
    ref.read(getCurrentOrderStateProvider.notifier).getOrders();
    ref.read(getFinishOrderStateProvider.notifier).getOrders();
    ref.read(getCanselOrderStateProvider.notifier).getOrders();
    ref.read(fetchCardDetailsStateNotifies.notifier).getCardDetails();
    ref.read(getWishListProductsStateNotifier.notifier).fetchAllProductsInWishlist();
    ref.read(getWishListServicesStateNotifier.notifier).fetchAllServicesInWishlist();
  }

}
