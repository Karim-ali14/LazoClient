import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImagePicker.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Localization/Keys.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/CustomAppBar.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? imageFile = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: context.tr(signUpKey),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPaddingHorizontal),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  CircleImgPicker(
                      size: 88,
                      placeHolder: SVGIcons.placeHolderForPickImagesSvgIcon(),
                      onResult: (path, value46) {
                        imageFile = File(path);
                  }),
                  const SizedBox(
                    height: 32,
                  ),
                  AppTextField(
                    textInputType: TextInputType.name,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(fullNameKey),
                    label: context.tr(fullNameKey),
                    textEditingController: fullNameController,
                    validate: (value) {
                      if (value?.isEmpty == true) {
                        return context.tr(enterYourFullNameKey);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
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
                    height: defaultPaddingHorizontal,
                  ),
                  AppTextField(
                    textInputType: TextInputType.emailAddress,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(emailAddressOptionalKey),
                    label: context.tr(emailAddressOptionalKey),
                    textEditingController: emailController,
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
                  ),
                  AppTextField(
                    endWidget: InkWell(
                        onTap: () {}, child: SVGIcons.bottomRedArrowIcon()),
                    readOnly: true,
                    textInputType: TextInputType.text,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(chooseCityKey),
                    label: context.tr(chooseCityKey),
                    textEditingController: cityController,
                    validate: (value) {
                      if (value?.isEmpty == true) {
                        return context.tr(enterYourPhoneKey);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
                  ),
                  AppButton(
                    width: context.getScreenSize.width,
                    height: 46,
                    onPress: () {
                      // cityController.text = "sdafsd";
                      // if (formKey.currentState?.validate() == true) {
                      //   context.showSuccessDialog(description: "description");
                      // }
                      signUp();
                    },
                    child: Text(
                      signUpKey,
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w400
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(){
    ref.read(uploadFilesStateNotifiers.notifier).uploadFilesPost([imageFile!]);
  }

  void uploadFiles(){

  }

}
