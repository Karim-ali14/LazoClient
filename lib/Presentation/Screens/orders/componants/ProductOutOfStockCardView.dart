import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Localization/Keys.dart';
import '../../../Widgets/AppButton.dart';
import 'OrderButtons.dart';

class ProductOutOfStockCardView extends StatefulWidget {
  final Color? backgroundColor;
  final String description;
  final OnButtonClickListener? onButtonClickListener;
  const ProductOutOfStockCardView({super.key, required this.description,this.backgroundColor, this.onButtonClickListener});

  @override
  State<ProductOutOfStockCardView> createState() => _ProductOutOfStockCardViewState();
}

class _ProductOutOfStockCardViewState extends State<ProductOutOfStockCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
      height: 120.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? CupertinoColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.description,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,textAlign: TextAlign.center,),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                    child: AppButton(
                      height: 33.h,
                      onPress: () {
                        widget.onButtonClickListener
                            ?.call(ButtonsClickType.Cancel);
                      },
                      backColor: AppTheme.mainAppColorDark,
                      outlined: true,
                      child: Center(
                          child: Text(
                            context.tr(cancelOrderKey),
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400
                                .copyWith(color: AppTheme.mainAppColorDark),
                          )),
                    )),
                SizedBox(width: 11),
                Expanded(
                    child: AppButton(
                      height: 33.h,
                      onPress: () {
                        widget.onButtonClickListener
                            ?.call(ButtonsClickType.CompleteOrder);
                      },
                      backColor: AppTheme.mainAppColorLight2,
                      child: Center(
                          child: Text(
                            context.tr(completeOrderKey),
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400
                                .copyWith(color: AppTheme.mainAppColorDark),
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
