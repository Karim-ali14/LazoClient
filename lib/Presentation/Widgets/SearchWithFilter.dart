import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../Localization/Keys.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';

class AppSearchBarWithFilter extends StatefulWidget {
  final bool hasFilter;
  final VoidCallback onFilterClick;
  const AppSearchBarWithFilter({super.key, required this.hasFilter, required this.onFilterClick});

  @override
  State<AppSearchBarWithFilter> createState() => _AppSearchBarWithFilterState();
}

class _AppSearchBarWithFilterState extends State<AppSearchBarWithFilter> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w400,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              labelText: "Search",
              labelStyle: AppTheme.styleWithTextAppGrey15AdelleSansExtendedFonts14w400,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppTheme.appGrey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppTheme.appGrey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppTheme.appGrey)),
              prefixIcon: SVGIcons.searchIcon()
            ),
          ),
        ),
        widget.hasFilter ? SizedBox(
          width: 8,
        ):SizedBox(),
        widget.hasFilter ?Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppTheme.mainAppColorLight2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SVGIcons.filterIcon(),
          ),
        ) : SizedBox()
      ],
    );
  }
}
