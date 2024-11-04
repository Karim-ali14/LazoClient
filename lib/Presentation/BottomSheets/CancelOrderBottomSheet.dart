import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

import '../../Constants/Eunms.dart';
import '../Widgets/SvgIcons.dart';

// typedef OnCancelOrderClicked = Function();
class CancelOrderBottomSheet extends StatelessWidget {
  final VoidCallback onOrderCancel ;
  const CancelOrderBottomSheet({super.key, required this.onOrderCancel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
              ),
              Text("Cancel Order",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,),
              SizedBox(
                height: 24,
              ),
              SVGIcons.wrongIcGifIcon(),
              SizedBox(
                height: 24,
              ),
              Text("Are you sure you want to cancel order?",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                        height: 46,
                        onPress: () {
                          Navigator.pop(context);
                          onOrderCancel.call();
                        },
                        child: Center(
                            child: Text(
                              "Yes",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400
                                  .copyWith(color: Colors.white),
                            )),
                      )),
                  SizedBox(width: 8),
                  Expanded(
                      child: AppButton(
                        height: 46,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        backColor: AppTheme.mainAppColorLight2,
                        child: Center(
                            child: Text(
                              "No",
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400
                                  .copyWith(color: AppTheme.mainAppColor),
                            )),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    context.push(R_LoginScreen,extra: {"type" : TypeOfMode.ViewMode});
  }
}
