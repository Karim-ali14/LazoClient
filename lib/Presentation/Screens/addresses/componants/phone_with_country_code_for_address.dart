import 'package:easy_localization/easy_localization.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Utils/ValidationEx.dart';

import '../../../../Constants/Assets.dart';
import '../../../../Localization/Keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/SvgIcons.dart';

class PhoneFieldWithCountryCodeForAddress extends StatefulWidget {
  final TextEditingController phoneController;
  final Function(String)? onSelectCountryCode;
  final bool? withCountryCode;
  final String? initCodeValue;
  final ValueNotifier<bool>? isCountryCodeEmpty;
  const PhoneFieldWithCountryCodeForAddress(
      {super.key,
      required this.phoneController,
      this.onSelectCountryCode,
      this.withCountryCode = true,
      required this.isCountryCodeEmpty,
      this.initCodeValue});

  @override
  State<PhoneFieldWithCountryCodeForAddress> createState() =>
      _PhoneFieldWithCountryCodeForAddressState();
}

class _PhoneFieldWithCountryCodeForAddressState
    extends State<PhoneFieldWithCountryCodeForAddress> {
  final ValueNotifier<String> code = ValueNotifier("");
  final countryPicker = const FlCountryCodePicker();

  @override
  void initState() {
    code.value = widget.initCodeValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneController,
      cursorColor: AppTheme.blackColor2,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: widget.withCountryCode == true
            ? GestureDetector(
                onTap: () async {
                  final country =
                      await countryPicker.showPicker(context: context);
                  if (country != null) {
                    widget.isCountryCodeEmpty?.value = false;
                    widget.onSelectCountryCode?.call(country.dialCode);
                    code.value = country.dialCode;
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable:
                      widget.isCountryCodeEmpty ?? ValueNotifier(false),
                  builder: (context, selected, _) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(top: 8.0,bottom:8.0,end: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30.h,
                        width: 74.w,
                        decoration: BoxDecoration(
                          color: AppTheme.appLightGreyV2,
                          border: Border.all(
                              width: 1,
                              color: selected
                                  ? AppTheme.mainAppColorDark
                                  : Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: code,
                              builder: (context, value, child) {
                                return Text(
                                  value.isNotEmpty ? value : "+966",
                                  style: value.isNotEmpty
                                      ? AppTheme
                                          .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                                      : AppTheme
                                          .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                );
                              },
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SVGIcons.localSVG(downArrowImg,
                                width: 16,
                                height: 16,
                                color: AppTheme.blackColor2)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox(),
        hintText: "Phone Number*",
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: AppTheme.appGrey6,
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: AppTheme.appGrey6,
        )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.appGrey20,
              ))
      ),

      validator: (value) {
        if (value?.isEmpty == true) {
          return context.tr(enterYourPhoneKey);
        }if (code.value.isEmpty) {
          return "Select Country Code";
        } else if (value?.isPhoneValidate == false) {
          return "Must start with 5 and be 9 digits long";
        } else {
          return null;
        }
      },
    );
  }
}
