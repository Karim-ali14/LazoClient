import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImagePicker.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/ItemSelector.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/Snaks.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/CustomAppBar.dart';
import 'Componants/CustomSelectorBottomSheet.dart';

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
  List<City> cities = [];
  List<String> images = [];
  int? cityItemSelected;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((call) {
      ref.read(getCities.notifier).getCities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    handleState(getCities, onSuccess: (res) {
      cities = res.data?.data ?? [];
    });

    handleState(sendOtpForSignUpStateProvider, showLoading: true,
        onSuccess: (res) {
      print("formSignUp $res");
      if (res.data?.isExist == false) {
        AppSnackBar.showSnackBar(context,
            isSuccess: true, message: res.data?.message ?? "Success !");
        signUp();
      } else {
        AppSnackBar.showSnackBar(context,
            isSuccess: false, message: context.tr(thisPhoneIsExitsKey));
      }
    }, onFail: (res) {
      AppSnackBar.showSnackBar(context,
          isSuccess: false, message: res.message ?? "");
    });

    handleState(uploadFilesStateNotifiers, onSuccess: (res) {
      images = res.data?.data ?? [];
      sendCode();
    }, showLoading: true);

    // handleState(signUpStateNotifierProvider, onSuccess: (res) {
    //   print(res);
    //   if (context.isThereCurrentDialogShowing()) {
    //     try {
    //       context.pop();
    //     } catch (e) {
    //       print("NAV cannont pop");
    //     }
    //   }
    //   context.go(R_HomeScreen);
    // });

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
                        onTap: () {
                          showCitesBottomSheet();
                        },
                        child: SVGIcons.bottomRedArrowIcon()),
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
                    height: 48,
                    onPress: () {
                      // cityController.text = "sdafsd";
                      // if (formKey.currentState?.validate() == true) {
                      //   context.showSuccessDialog(description: "description");
                      // }
                      uploadFiles();
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

  void signUp() {
    context.push(R_OTP, extra: {
      "phone": phoneController.text,
      "name": fullNameController.text,
      "email": emailController.text.isNotEmpty ? emailController.text : null,
      "image": images.first,
      "cityId": "$cityItemSelected",
      "type": OTPType.SignUp
    });
  }

  void sendCode() {
    ref
        .read(sendOtpForSignUpStateProvider.notifier)
        .sendOtp(phoneController.text.toString());
  }

  void uploadFiles() {
    ref.read(uploadFilesStateNotifiers.notifier).uploadFilesPost([imageFile!]);
  }

  void showCitesBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext context) {
          return CustomSelectorBottomSheet(
              context: context,
              btuName: context.tr("Ok"),
              enableSearch: true,
              title: context.tr("chooseManufacturingYearsKey"),
              widgetList: cities
                  .map((e) => ItemSelector(e.id ?? 0, e.name ?? "", null))
                  .toList(),
              searchHint: "Search by",
              itemSelectedId: cityItemSelected,
              isSingleSelect: true,
              onSelectMultiItemsCallback: (items) {},
              onSelectItemCallback: (itemid) {
                cityItemSelected = itemid;

                if (cityItemSelected != null) {
                  cityController.text =
                      cities.firstWhere((item) => item.id == itemid).name ?? "";
                }

                Navigator.pop(context);
              });
        });
  }
}
