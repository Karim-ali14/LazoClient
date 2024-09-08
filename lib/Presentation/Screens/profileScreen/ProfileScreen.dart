import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Widgets/CircleImagePicker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final fullNameTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      setClientData(ref.watch(clientStateProvider));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var client = ref.watch(clientStateProvider);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Profile",
        isCenter: false,
        navigated: true,
        trailingWidget: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 13, vertical: 13),
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme.mainAppColorLight2,
                borderRadius: BorderRadius.circular(4)),
            height: 26,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: Row(
              children: [
                SVGIcons.editIcon(),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Edit Profile",
                  style: AppTheme
                      .styleWithTextMainAppColorAdelleSansExtendedFonts12w400,
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleImgPicker(
                    enableClick: false,
                    size: 88,
                    placeHolder: SVGIcons.placeHolderForPickImagesSvgIcon(),
                    initialImg: client?.client?.imagePath,
                    onResult: (path, value46) {},
                  ),
                  // SVGIcons.defaultUseIconSvgIcon(),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Full Name",
                label: "Full Name",
                textEditingController: fullNameTextEditingController,
                disabled: true,
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w500,
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(
                textInputType: TextInputType.phone,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Phone Number",
                label: "Phone Number",
                textEditingController: phoneTextEditingController,
                disabled: true,
                endWidget: SVGIcons.editPhoneImgSvgIcon(),
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w500,
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(
                textInputType: TextInputType.emailAddress,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Email Address",
                label: "Email Address",
                textEditingController: emailTextEditingController,
                disabled: true,
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w500,
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "City",
                label: "City",
                textEditingController: cityTextEditingController,
                disabled: true,
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w500,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setClientData(ClientAuthResponseData? client) {
    fullNameTextEditingController.text = client?.client?.name ?? "";
    phoneTextEditingController.text = client?.client?.phone ?? "";
    emailTextEditingController.text = client?.client?.email ?? "";
    cityTextEditingController.text = client?.client?.city?.name ?? "";
  }
}
