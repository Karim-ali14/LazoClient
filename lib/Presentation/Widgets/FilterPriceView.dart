import 'package:flutter/cupertino.dart';

import '../Theme/AppTheme.dart';
import 'AppTextField.dart';

typedef OnPriceChanges = Function(String?, String?);

class FilterPriceView extends StatefulWidget {
  final String? priceFrom;
  final String? priceTo;
  final OnPriceChanges onPriceChanges;
  const FilterPriceView(
      {super.key, this.priceFrom, this.priceTo, required this.onPriceChanges});

  @override
  State<FilterPriceView> createState() => _FilterPriceViewState();
}

class _FilterPriceViewState extends State<FilterPriceView> {
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      priceFromController.text = widget.priceFrom ?? "";
      priceToController.text = widget.priceTo ?? "";
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
                      if (double.parse(value!) <
                          double.parse(priceToController.text)) {
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
                  changeValueCallback: (value) {
                    widget.onPriceChanges.call(value, priceToController.text);
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                AppTextField(
                  width: 170,
                  hint: "To",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
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
                      if (double.parse(value!) >
                          double.parse(priceFromController.text)) {
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
                  },
                  changeValueCallback: (value) {
                    widget.onPriceChanges.call(priceFromController.text, value);
                  },
                )
              ],
            ),
            formKey.currentState?.validate() == false
                ? Text(
                    errorMessage,
                    style:
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts11w500,
                  )
                : SizedBox(),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
