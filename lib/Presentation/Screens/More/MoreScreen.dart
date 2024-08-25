
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import '../../../Constants.dart';
import '../../../Constants/Constants.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/SvgIcons.dart';
import '../details/AskBottomSheet.dart';
import '../details/ContactUsBottomSheet.dart';
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

    handleState(logoutStateProvider,showLoading: true , onSuccess: (res){
      navigateToLogin(TypeOfMode.AuthMode);
    });

    handleState(deleteAccountStateProvider,showLoading: true , onSuccess: (res){
      navigateToLogin(TypeOfMode.AuthMode);
    });
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            client != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 72,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.mainAppColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              SVGIcons.walletWithWhiteBackgroundIcon(),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wallet Balance",
                                    style: AppTheme
                                        .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                                  ),
                                  Spacer(),
                                  Text(
                                    "SAR ${client.client?.balance}",
                                    style: AppTheme
                                        .styleWithTextWhiteAdelleSansExtendedFonts20w700,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: "Log In",
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
                            text: "Sign Up",
                            onPress: () {},
                            height: 46,
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.langIcon(),
                text: "Language",
                endIcon: Text(
                  "English",
                  style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                ),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            InkWell(
              onTap: showContactUsBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.contactUsIcon(),
                  text: "Contact Us",
                  endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
                ),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            InkWell(
              onTap: () {
                context.push(R_FAQScreen);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.faqIcon(),
                  text: "FAQ",
                  endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
                ),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.shareImgIcon(),
                text: "Share The App",
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.termsConditionsImgIcon(),
                text: "Terms & Conditions",
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.langIcon(),
                text: "Privacy & Policy",
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
            ),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            client != null ? InkWell(
              onTap: showSignOutBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.signOutIcon(),
                  textWidget: Text(
                    "Sign out",
                    style:
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                  ),
                  endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
                ),
              ),
            ):SizedBox(),
            SizedBox(
              height: defaultPaddingHorizontal,
            ),
            client != null ?InkWell(
              onTap: showDeleteAccountBottomSheet,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MoreItemCard(
                  startIcon: SVGIcons.deleteAccountIcon(),
                  textWidget: Text(
                    "Delete Account",
                    style:
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                  ),
                  endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
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
              title: "Sign Out",
              description: "Are you sure you want to sign out?",
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
              title: "Delete Account",
              description: "Are you sure you want to delete account?",
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
}
