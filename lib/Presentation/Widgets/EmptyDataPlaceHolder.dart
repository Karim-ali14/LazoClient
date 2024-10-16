
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import 'SvgIcons.dart';

class EmptyDataPlaceHolder extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final VoidCallback? onAddOrderClick;
  const EmptyDataPlaceHolder({super.key, required this.onAddOrderClick, required this.icon, required this.title, required this.description});

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
                height: defaultPaddingHorizontal,
              ),
              Text(title,style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(description,
                  style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400.copyWith(height: 1.5,),textAlign: TextAlign.center,),
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              )
            ],
          ),
        ));
  }
}
