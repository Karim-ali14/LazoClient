import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Localization/Keys.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../cartScreen/componants/CustomSwitch.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final sendTypeController = TextEditingController();
  bool _enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(defaultPaddingHorizontal),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                endWidget: InkWell(
                    onTap: () {
                      showSendTypesBottomSheet();
                    },
                    child: SVGIcons.bottomRedArrowIcon()),
                readOnly: true,
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Send to (myself or to someone)",
                label: "Send to (myself or to someone)",
                textEditingController: sendTypeController,
                validate: (value) {
                  if (value?.isEmpty == true) {
                    return "Select type of send";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Recipient Info",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.appGrey9,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.appGrey6,width: 1)
                ),
                padding: EdgeInsets.all(defaultPaddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Ask the recipient for the address",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,),
                        Spacer(),
                        CustomSwitch(
                          value: _enable,
                          onChanged: (bool val){
                            setState(() {
                              _enable = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("We will collect the address from the recipient. Delivery time may be impacted if recipient is unreachable",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400.copyWith(height: 1.3),)
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Recipient Name",
                label: "Recipient Name",
                textEditingController: sendTypeController,
                validate: (value) {
                  if (value?.isEmpty == true) {
                    return "Select type of send";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Recipient Phone",
                label: "Recipient Phone",
                textEditingController: sendTypeController,
                validate: (value) {
                  if (value?.isEmpty == true) {
                    return "Select type of send";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    "Add your message",
                    style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                  ),
                  Spacer(),
                  Text(
                    "(optional)",
                    style: AppTheme
                        .styleWithTextAppGrey15AdelleSansExtendedFonts14w400,
                  )
                ],
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "To: (optional)",
                label: "To: (optional)",
                textEditingController: sendTypeController,
                validate: (value) {
                  if (value?.isEmpty == true) {
                    return "Select type of send";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              AppTextField(
                textInputType: TextInputType.text,
                textFieldBorderColor: AppTheme.appGrey3,
                mode: AutovalidateMode.onUserInteraction,
                hint: "Type your message and express your feeling",
                label: "Type your message and express your feeling",
                textEditingController: sendTypeController,
                validate: (value) {
                  if (value?.isEmpty == true) {
                    return "Select type of send";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              Text(
                "Recipient Info",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
            ],
          ),
        ),
      )),
    );
  }

  void showSendTypesBottomSheet() {

  }

}
