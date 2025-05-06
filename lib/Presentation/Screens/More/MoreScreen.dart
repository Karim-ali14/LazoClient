
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/Screens/More/Componants/client_info_card.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Localization/LanguageProvider.dart';
import '../../../Localization/LanguageType.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/SvgIcons.dart';
import '../details/AskBottomSheet.dart';
import '../details/ContactUsBottomSheet.dart';
import '../mainScreen/MainScreenNavHost.dart';
import 'Componants/MoreItemCard.dart';

class MoreScreen extends ConsumerStatefulWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends ConsumerState<MoreScreen> {

  @override
  void initState() {
    ref.read(clientStateProvider.notifier).checkIfUserExist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final client = ref.watch(clientStateProvider);
     final isEnglishLang = ref.watch(langProvider.notifier).isEnglish;

    handleState(logoutStateProvider,showLoading: true , onSuccess: (res){
      rebuildMainScreen();
      updateMainScreen();
      navigateToHomeScreen();
    });

    handleState(deleteAccountStateProvider,showLoading: true , onSuccess: (res){
      rebuildMainScreen();
      navigateToLogin(TypeOfMode.AuthMode);
    });
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            client != null ?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal,vertical: 24),
                  child: ClientInfoCard(onTap: (){
                    navigateToProfileScreen();
                  },),
                )
                : const SizedBox(),
            client != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
                    child: Column(
                      children: [
                        MoreItemCard(
                          text: "Wallet",
                          startIcon: SVGIcons.localSVG(walletIcon,width: 20,height: 20,),
                          endWidget: Text(
                            "${context.tr(sarKey)} ${client.client?.balance}",
                            style: AppTheme
                                .styleWithTextBlack2AdelleSansExtendedFonts12w400,
                          ),
                          withDivider: false,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: context.tr(loginKey),
                            onPress: () {
                              navigateToLogin(TypeOfMode.ViewMode);
                            },
                            height: 46,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: AppButton(
                            backColor: AppTheme.mainAppColor,
                            outlined: true,
                            text: context.tr(signUpKey),
                            onPress: () {
                              navigateToSignUp();
                            },
                            height: 46,
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: 24,
            ),

            client != null ?
            InkWell(
              onTap: (){
                navigateToProfileScreen();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.localSVG(addressIcon,width: 20,height: 20,),
                  text: "Addresses",
                ),
              ),
            ):SizedBox(),
            InkWell(
              onTap: (){
                context.showSelectionActionSheet(["ar" , "en"], (lang){
                  changeLang(lang == 1 ? LanguageType.en : LanguageType.ar);
                }, header: "Select language");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.langIcon(),
                  text: context.tr(languageKey),
                  endWidget: Text(
                    isEnglishLang ? context.tr(englishKey) : context.tr(arabicKey),
                    style: AppTheme.styleWithTextRedAdelleSansExtendedFonts12w400,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: showContactUsBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.contactUsIcon(),
                  text: context.tr(contactUsKey),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push(R_FAQScreen);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.faqIcon(),
                  text: context.tr(faqKey),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.shareImgIcon(),
                text: context.tr(shareTheAppKey),

              ),
            ),
            InkWell(
              onTap: (){
                navigateToTermsAndConditions();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.termsConditionsImgIcon(),
                  text: context.tr(termsAndConditionsKey),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                navigateToPrivacyAndPolicyScreen();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.localSVG(privacyPolicyImg,width: 20,height: 20,),
                  text: context.tr(privacyAndPolicyKey),

                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            client != null ? InkWell(
              onTap: showSignOutBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.signOutIcon(),
                  textWidget: Text(
                    context.tr(signOutKey),
                    style:
                        AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,
                  ),

                ),
              ),
            ):SizedBox(),
            client != null ?InkWell(
              onTap: showDeleteAccountBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.deleteAccountIcon(),
                  textWidget: Text(
                    context.tr(deleteAccountKey),
                    style:
                        AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,
                  ),
                  withDivider: false,
                ),
              ),
            ):SizedBox(),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
          ],
        ),
      )),
    );
  }

  void showContactUsBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        isScrollControlled: true, // Set isScrollControlled to true
        builder: (content) => ContactUsBottomSheet());
  }

  void showSignOutBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) => AskBottomSheet(
              title: context.tr(signOutKey),
              description: context.tr(areYouSureYouWantToSignOutKey),
              icon: SVGIcons.sadFaceIcon(),
              onPositiveButtonClick: () {
                ref.read(logoutStateProvider.notifier).logout();
              },
            ));
  }

  void showDeleteAccountBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) => AskBottomSheet(
              title: context.tr(deleteAccountKey),
              description: context.tr(areYouSureYouWantToDeleteAccountKey),
              icon: SVGIcons.deleteAccountIcIcon(),
              onPositiveButtonClick: () {
                ref.read(deleteAccountStateProvider.notifier).deleteAccount();
              },
            ));
  }

  void navigateToLogin(TypeOfMode type) async{
    if(type == TypeOfMode.AuthMode){
      context.go(R_LoginScreen,extra: {"type" : type});
    }else {
      var extra = await context.push(R_LoginScreen,extra: {"type" : type});
    }
  }

  void navigateToSignUp() async{
    context.push(R_SignUp,extra: {"typeOfMode" : TypeOfMode.ViewMode});
  }

  void navigateToTermsAndConditions() {
    context.push(R_TermsAndConditionsScreen);
  }

  void navigateToPrivacyAndPolicyScreen() {
    context.push(R_PrivacyAndPolicyScreen);
  }

  void navigateToProfileScreen() {
    context.push(R_EditProfileScreen);
  }

  void navigateToHomeScreen() {
    context.go(R_MainScreen);
  }

  void updateMainScreen(){
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
    ref.read(fetchCardDetailsStateNotifies.notifier).getCardDetails();
  }

  void rebuildMainScreen(){
    (context.findAncestorStateOfType<MainScreenNavHostState>() as MainScreenNavHostState)
        .rebuildMainScreen();
  }
  void changeLang(String lang) {
    ref.read(langProvider.notifier).fetchLocale(lang);
  }
}
