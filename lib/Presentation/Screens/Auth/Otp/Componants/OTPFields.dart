import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Theme/AppTheme.dart';

class OTPFields extends StatefulWidget {
  const OTPFields({super.key});

  @override
  State<OTPFields> createState() => OTPFieldsState();
}

class OTPFieldsState extends State<OTPFields> {
  final formKey = GlobalKey<FormState>();
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();

  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 40,
              showCursor: false,
              controller: otp1,
              focusNode: focusNode1,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextFormatters.nonArabicPhone,
                LengthLimitingTextInputFormatter(1)
              ],
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: const TextStyle(fontSize: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.appGrey6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppTheme.secondaryAppColorLight),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.appGrey6),
                      borderRadius: BorderRadius.circular(8))),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts32w400,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                if(value.isNotEmpty){
                  FocusScope.of(context).requestFocus(focusNode2);
                }
              },
                validator: (value){
                  if(value?.isEmpty == true){
                    return "";
                  }else{
                    return null;
                  }
                }
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 56,
            height: 56,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 40,
              showCursor: false,
              controller: otp2,
              focusNode: focusNode2,
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextFormatters.nonArabicPhone,
                LengthLimitingTextInputFormatter(1)
              ],
              decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.appGrey6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppTheme.secondaryAppColorLight),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.appGrey6),
                      borderRadius: BorderRadius.circular(8))),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts32w400,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                if(value.isNotEmpty){
                  FocusScope.of(context).requestFocus(focusNode3);
                }else {
                  FocusScope.of(context).requestFocus(focusNode1);
                }
              },
                validator: (value){
                  if(value?.isEmpty == true){
                    return "";
                  }else{
                    return null;
                  }
                }
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 56,
            height: 56,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 40,
              showCursor: false,
              controller: otp3,
              focusNode: focusNode3,
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextFormatters.nonArabicPhone,
                LengthLimitingTextInputFormatter(1)
              ],
              decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.appGrey6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppTheme.secondaryAppColorLight),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.appGrey6),
                      borderRadius: BorderRadius.circular(8))),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts32w400,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                if(value.isNotEmpty){
                  FocusScope.of(context).requestFocus(focusNode4);
                }else{
                  FocusScope.of(context).requestFocus(focusNode2);
                }
              },
              validator: (value){
                if(value?.isEmpty == true){
                  return "";
                }else{
                  return null;
                }
              },
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 56,
            height: 56,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 40,
              showCursor: false,
              controller: otp4,
              focusNode: focusNode4,
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextFormatters.nonArabicPhone,
                LengthLimitingTextInputFormatter(1)
              ],
              decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.appGrey6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppTheme.secondaryAppColorLight),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.appGrey6),
                      borderRadius: BorderRadius.circular(8))),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts32w400,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                if(value.isEmpty){
                  FocusScope.of(context).requestFocus(focusNode3);
                }
              },
                validator: (value){
                  if(value?.isEmpty == true){
                    return "";
                  }else{
                    return null;
                  }
                }
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
  @override
  void dispose() {
    for (var element in [otp1,otp2,otp3,otp4]) {
      element.dispose();
    }

    super.dispose();
  }

  String get getCode => [otp1,otp2,otp3,otp4].map((e) => e.text).join("");

}
