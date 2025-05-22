import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../../Utils/DelayedAction.dart';
import '../../../../Utils/Snaks.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';
import 'CartItemView.dart';

class UpdateItemQuantity extends StatefulWidget {
  final CartItemsInner? cartItem;
  final OnUpdateQuantity onUpdateQuantity;
  final int? initQuantity;
  const UpdateItemQuantity(
      {super.key,
      required this.onUpdateQuantity,
      this.initQuantity, this.cartItem});

  @override
  State<UpdateItemQuantity> createState() => _UpdateItemQuantityState();
}

class _UpdateItemQuantityState extends State<UpdateItemQuantity> {

  DelayedAction delayedAction = DelayedAction();
  int? quantity;
  @override
  void initState() {
    quantity = widget.initQuantity;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                var amount = widget.cartItem?.product?.amount ?? 0;
                if((quantity??0) < amount) {
                  setState(() {
                    quantity = (quantity ?? 1) + 1;
                  });
                  delayedAction.startTimer(const Duration(seconds: 2),
                          () {
                        widget.onUpdateQuantity.call(
                            (widget.cartItem?.id ?? 0),
                            (quantity ?? 1));
                      });
                }
                else{
                  AppSnackBar.showSnackBar(context,
                      isSuccess: false, message: "amount is $amount");
                }
              },
              child: SVGIcons.incrementButtonSvgIcon()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              quantity?.toString() ?? "",
              style: AppTheme
                  .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
            ),
          ),
          InkWell(
              onTap: () {
                if ((quantity ?? 1) > 1) {
                  setState(() {
                    quantity = (quantity ?? 1) - 1;
                  });
                  delayedAction.startTimer(const Duration(seconds: 2),
                          () {
                        widget.onUpdateQuantity.call(
                            (widget.cartItem?.id ?? 0),
                            (quantity ?? 1));
                      });
                }
              },
              child: SVGIcons.decrementButtonSvgIcon()),
        ],
      );
  }
}
