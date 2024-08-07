import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Theme/AppTheme.dart';
import '../Widgets/AppButton.dart';
import '../Widgets/AppTextField.dart';
import '../Widgets/SvgIcons.dart';

typedef OnApplyPrice = Function(int?, int?);

class SelectPriceBottomSheet extends StatefulWidget {
  final BuildContext context;
  final String? title;
  final String? priceFrom;
  final String? priceTo;
  final OnApplyPrice applyBtu;
  const SelectPriceBottomSheet(
      {super.key,
      required this.context,
      this.title,
      this.priceFrom,
      this.priceTo,
      required this.applyBtu});

  @override
  State<SelectPriceBottomSheet> createState() => _SelectPriceBottomSheetState();
}

class _SelectPriceBottomSheetState extends State<SelectPriceBottomSheet> {
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      priceFromController.text = "${widget.priceFrom}";
      priceToController.text = "${widget.priceTo}";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                  textFieldBorderColor: AppTheme.appGrey8,
                  textFieldColor: AppTheme.appGrey8,
                  textInputType: TextInputType.phone,
                  label: "From",
                  labelStyle: AppTheme
                      .styleWithTextBlackAdelleSansExtendedFonts16w500
                      .copyWith(color: AppTheme.appGrey10),
                  textEditingController: priceFromController,
                  validate: (value) {
                    if (priceToController.text.isNotEmpty &&
                        value?.isNotEmpty == true) {
                      if (int.parse(value!) <
                          int.parse(priceToController.text)) {
                        return null;
                      } else {
                        errorMessage = "price from should less then to ";
                        return "";
                      }
                    } else if (priceToController.text.isEmpty &&
                        value?.isEmpty == true) {
                      return null;
                    } else if (value?.isEmpty == true) {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                AppTextField(
                    width: 170,
                    hint: "To",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                    textFieldBorderColor: AppTheme.appGrey8,
                    textFieldColor: AppTheme.appGrey8,
                    label: "To",
                    textInputType: TextInputType.phone,
                    labelStyle: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500
                        .copyWith(color: AppTheme.appGrey10),
                    textEditingController: priceToController,
                    validate: (value) {
                      if (priceFromController.text.isNotEmpty &&
                          value?.isNotEmpty == true) {
                        if (int.parse(value!) >
                            int.parse(priceFromController.text)) {
                          return null;
                        } else {
                          return "";
                        }
                      } else if (priceFromController.text.isEmpty &&
                          value?.isEmpty == true) {
                        return null;
                      } else if (value?.isEmpty == true) {
                        return null;
                      }

                    })
              ],
            ),
            formKey.currentState?.validate() == false ?
            Text(errorMessage,style: AppTheme.styleWithTextRedAdelleSansExtendedFonts11w500,) : SizedBox(),
            SizedBox(
              height: 24,
            ),
            AppButton(
                height: 48,
                width: double.infinity,
                onPress: () {
                  if (formKey.currentState?.validate() == true) {
                  print("object");
                  widget.applyBtu.call(
                      priceFromController.text.isNotEmpty
                          ? int.parse(priceFromController.text)
                          : null,
                      priceToController.text.isNotEmpty
                          ? int.parse(priceToController.text)
                          : null);
                  Navigator.pop(context);
                  }
                },
                text: "Choose"),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
