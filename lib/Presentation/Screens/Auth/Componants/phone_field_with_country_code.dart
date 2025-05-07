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

class PhoneFieldWithCountryCode extends StatefulWidget {
  final TextEditingController phoneController;
  final Function(String)? onSelectCountryCode;
  final bool? withCountryCode;
  final String? initCodeValue;
  final ValueNotifier<bool>? isCountryCodeEmpty;

  const PhoneFieldWithCountryCode({super.key, required this.phoneController, this.onSelectCountryCode, this.withCountryCode = true, required this.isCountryCodeEmpty, this.initCodeValue});

  @override
  State<PhoneFieldWithCountryCode> createState() => _PhoneFieldWithCountryCodeState();
}

class _PhoneFieldWithCountryCodeState extends State<PhoneFieldWithCountryCode> {

  final ValueNotifier<String> code = ValueNotifier("");
  final countryPicker = const FlCountryCodePicker();

  @override
  void initState() {
    code.value = widget.initCodeValue ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.withCountryCode == true?
        GestureDetector(
          onTap: () async {
            final country =
            await countryPicker.showPicker(context: context);
            if (country != null) {
              widget.isCountryCodeEmpty?.value = false;
              widget.onSelectCountryCode?.call(country.dialCode);
              code.value = country.dialCode;
            }
          },
          child:ValueListenableBuilder(
            valueListenable: widget.isCountryCodeEmpty ?? ValueNotifier(false),
            builder: (context,selected,_){
              return Container(
                width: 84,
                height: 58.h,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  border: Border.all(width: 1,color: selected ? AppTheme.mainAppColorDark : Colors.white ),
                  borderRadius:  const BorderRadius.all(Radius.circular(8)),
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
                        width: 10,
                        height: 10,
                        color: AppTheme.blackColor2)
                  ],
                ),
              );
            },
          ),
        ) : const SizedBox(),
        SizedBox(width: widget.withCountryCode == true ? 8 : 0),
        Expanded(
          child: AppTextField(
            textInputType: TextInputType.phone,
            textFieldBorderColor: Colors.white,
            mode: AutovalidateMode.onUserInteraction,
            hint: context.tr(phoneNumberKey),
            label: context.tr(phoneNumberKey),
            textEditingController: widget.phoneController,
            validate: (value) {
              if (value?.isEmpty == true) {
                return context.tr(enterYourPhoneKey);
              } else if (value?.isPhoneValidate == false) {
                return "Must start with 5 and be 9 digits long";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
