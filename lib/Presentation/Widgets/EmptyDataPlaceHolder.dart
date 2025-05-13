import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';
import 'SvgIcons.dart';

class EmptyDataPlaceHolder extends StatelessWidget {
  final Widget icon;
  final String? title;
  final String description;
  final VoidCallback? onAddOrderClick;
  final bool? showButton;
  final String? buttonName;
  const EmptyDataPlaceHolder(
      {super.key,
      required this.onAddOrderClick,
      required this.icon,
      required this.title,
      required this.description,
      this.showButton = false, this.buttonName = "Login"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            height: 32,
          ),
          title?.isNotEmpty == true ? Text(title??"",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700):const SizedBox(),
          SizedBox(
            height: title?.isNotEmpty == true? 32:0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              description,
              style: AppTheme.styleWithTextAppGrey18AdelleSansExtendedFonts16w400
                  .copyWith(
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          showButton == true
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppButton(
                    width: double.infinity,
                    height: 48.h,
                    text: buttonName,
                    backColor: AppTheme.mainAppColorDark,
                    outlined: true,
                    onPress: () {
                      onAddOrderClick?.call();
                      // navigateToLogin(context);
                    }),
              )
              : const SizedBox()
        ],
      ),
    ));
  }
}
