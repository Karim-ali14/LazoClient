import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

import '../../../../Constants/Assets.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Data/Models/ItemSelector.dart';
import '../../../Widgets/SvgIcons.dart';

class SelectedItemBottomSheet extends StatefulWidget {
  final List<ItemSelectorV2> items;
  final int? initSelectedIndex;
  final String title;
  final String subTitle;
  final String? additionalText;
  final Function(int)? onSelect;
  const SelectedItemBottomSheet({super.key, required this.items, this.initSelectedIndex, required this.title, required this.subTitle, this.additionalText, this.onSelect});

  @override
  State<SelectedItemBottomSheet> createState() => _SelectedItemBottomSheetState();
}

class _SelectedItemBottomSheetState extends State<SelectedItemBottomSheet> {

  @override
  void initState() {
    if(widget.initSelectedIndex != null && widget.initSelectedIndex != -1 && widget.items.isNotEmpty){
      for (var element in widget.items) {
        element.isChecked = widget.initSelectedIndex == widget.items.indexOf(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 64,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Text(
                  widget.title,
                  style: AppTheme
                      .styleWithTextBlackAdelleSansExtendedFonts16w500,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal),
                  child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: SVGIcons.localSVG(closeIconSvg,
                          width: 32, height: 32)),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            boxShadow: [
              BoxShadow(
                color: AppTheme.appGrey11.withOpacity(0.6), // Shadow color
                blurRadius: .5, // Blur effect
                spreadRadius: .1, // Spread effect
                offset: const Offset(0, .5), // Shadow position
              ),
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8), topLeft: Radius.circular(8)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.subTitle,style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w500,
              ),
              SizedBox(
                height: 16.h,),
              Wrap(
                spacing: 10,
                children: widget.items.map((item) {
                  return AppButton(
                    height: 40.h,
                    outlined: item.isChecked == false,
                    backColor: AppTheme.mainAppColorDark,
                    width: MediaQuery.of(context).size.width / 2 - 23.w,
                    text:item.text
                    , onPress: () {
                      context.pop();
                    widget.onSelect!(widget.items.indexOf(item));
                  },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.h,
              ),
              if(widget.additionalText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    widget.additionalText!,
                    style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
