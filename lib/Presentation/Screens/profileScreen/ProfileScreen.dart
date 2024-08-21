import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
