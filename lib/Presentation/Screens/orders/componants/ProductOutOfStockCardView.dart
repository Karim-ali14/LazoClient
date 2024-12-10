import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      height: 122,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? CupertinoColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppTheme.appGrey6,
          width: 1
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.description,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,textAlign: TextAlign.center,),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Row(
            children: [
              Expanded(
                  child: AppButton(
                    height: 40,
                    onPress: () {
                      widget.onButtonClickListener
                          ?.call(ButtonsClickType.CompleteOrder);
                    },
                    child: Center(
                        child: Text(
                          context.tr(completeOrderKey),
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                              .copyWith(color: Colors.white),
                        )),
                  )),
              SizedBox(width: 8),
              Expanded(
                  child: AppButton(
                    height: 40,
                    onPress: () {
                      widget.onButtonClickListener
                          ?.call(ButtonsClickType.Cancel);
                    },
                    backColor: AppTheme.mainAppColorLight2,
                    child: Center(
                        child: Text(
                          context.tr(cancelOrderKey),
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                              .copyWith(color: AppTheme.mainAppColor),
                        )),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
