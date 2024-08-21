import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fullNameTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    fullNameTextEditingController.text = "dsfasdfsdaf";
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Profile",
        isCenter: false,
        navigated: true,
        trailingWidget: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 13,vertical: 13),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.mainAppColorLight2,
              borderRadius: BorderRadius.circular(4)
            ),
            height: 26,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: Row(
              children: [
                SVGIcons.editIcon() ,
                SizedBox(
                  width: 2,
                ),
                Text("Edit Profile",style: AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts12w400,)
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
                  SVGIcons.defaultUseIconSvgIcon(),
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
                textEditingController: fullNameTextEditingController,
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
                textEditingController: fullNameTextEditingController,
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
                textEditingController: fullNameTextEditingController,
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
}
