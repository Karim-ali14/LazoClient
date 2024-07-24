import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Theme/AppTheme.dart';
import '../Widgets/AppButton.dart';
import '../Widgets/AppTextField.dart';
import '../Widgets/SvgIcons.dart';

typedef OnApplyPrice = Function(int?,int?);
class SelectPriceBottomSheet extends StatefulWidget {
  final BuildContext context;
  final String? title;
  final String? priceFrom;
  final String? priceTo;
  final OnApplyPrice applyBtu;
  const SelectPriceBottomSheet({super.key, required this.context, this.title, this.priceFrom, this.priceTo, required this.applyBtu});

  @override
  State<SelectPriceBottomSheet> createState() => _SelectPriceBottomSheetState();
}

class _SelectPriceBottomSheetState extends State<SelectPriceBottomSheet> {
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback){
      priceFromController.text = "${widget.priceFrom}";
      priceToController.text = "${widget.priceTo}";
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Stack(children: [
            Align(
                alignment: AlignmentDirectional.center,
                child: Text(widget.title ?? "")),
            InkWell(
                onTap: () {
                  Navigator.pop(widget.context);
                },
                child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: SVGIcons.closeSquareSvgIcon()))
          ]),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                width: 170,
                hint: "From",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                textFieldColor: AppTheme.appGrey8,
                label: "From",
                labelStyle:
                AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500.copyWith(color: AppTheme.appGrey10),
                textEditingController: priceFromController,
              ),
              SizedBox(
                width: 5,
              ),AppTextField(
                width: 170,
                hint: "To",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                textFieldColor: AppTheme.appGrey8,
                label: "To",
                labelStyle:
                AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500.copyWith(color: AppTheme.appGrey10),
                textEditingController: priceToController,
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          AppButton(
              height: 48,
              width: double.infinity,
              onPress: () {
                if(priceFromController.text.isNotEmpty && priceToController.text.isNotEmpty){
                  widget.applyBtu.call(int.parse(priceFromController.text),int.parse(priceToController.text));
                }
              }, text: "Choose"),

          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
