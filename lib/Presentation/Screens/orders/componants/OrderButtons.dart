import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import '../../../../../Constants/Eunms.dart';
import '../../../../Localization/Keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';

typedef OnButtonClickListener = Function(ButtonsClickType?);

class OrderButtons extends StatelessWidget {
  final bool isOrderDetail;
  final ButtonsType type;
  final OnButtonClickListener? onButtonClickListener;
  const OrderButtons( this.type,this.onButtonClickListener,{this.isOrderDetail = false,super.key,});

  @override
  Widget build(BuildContext context) {
    print("handle show buttons : ${(type == ButtonsType.ViewDetails && !isOrderDetail)}");
    return Column(children: [
      if (type == ButtonsType.ViewDetails && !isOrderDetail)
        InkWell(
          onTap: (){
            onButtonClickListener?.call(ButtonsClickType.ViewDetails);
          },
          child: SizedBox(
            height: 20.h,
            child: Row(
              children: [
                Text(
                  context.tr(viewDetailsKey),
                  style: AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400
                ),
                Spacer(),
                SVGIcons.localSVG(enterArrowIcons,
                    width: 8.w, height: 15.h)
              ],
            ),
          ),
        )
      else if(type == ButtonsType.ShowAcceptOrCancel)
        Row(
          children: [
            Expanded(
                child: AppButton(
                  height: 40,
              onPress: (){
                onButtonClickListener?.call(ButtonsClickType.Accept);
              },
              child: Center(
                  child: Text(
                context.tr(acceptKey),
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                    .copyWith(color: Colors.white),
              )),
            )),
            SizedBox(width: 8),
            Expanded(
                child: AppButton(
                  height: 40,
              onPress:(){
                onButtonClickListener?.call(ButtonsClickType.Cancel);
              },
              backColor: AppTheme.mainAppColorLight2,
              child: Center(
                  child: Text(
                context.tr(rejectKey),
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                    .copyWith(color: AppTheme.mainAppColor),
              )),
            ))
          ],
        )
      else if(type == ButtonsType.Finish)
          AppButton(
            height: 40,
            onPress:(){
              onButtonClickListener?.call(ButtonsClickType.Finish);
            },
            child: Center(
                child: Text(
                  context.tr(finishedKey),
                  style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                      .copyWith(color: Colors.white),
                )),
          )
        else if(type == ButtonsType.ReadyToShipping)
          AppButton(
            height: 40,
            onPress:(){
              onButtonClickListener?.call(ButtonsClickType.ReadyToShipping);
            },
            backColor: AppTheme.mainAppColorLight2,
            child: const Center(
                child: Text(
                  "Ready to shipping",
                  style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w400,
                )),
          )
      else
        const SizedBox()
    ]);
  }
  void viewDetails() {}

}
