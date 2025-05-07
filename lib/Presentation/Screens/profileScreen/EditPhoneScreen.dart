import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/ValidationEx.dart';

import '../../../Constants.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/Snaks.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../Auth/Componants/phone_field_with_country_code.dart';

class EditPhoneScreen extends ConsumerStatefulWidget {
  const EditPhoneScreen({super.key});

  @override
  ConsumerState<EditPhoneScreen> createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends ConsumerState<EditPhoneScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneTextEditingController = TextEditingController();
  final ValueNotifier<bool> isCountryCodeEmpty = ValueNotifier(false);
  String? countryCode;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((call) {
      countryCode = ref.watch(clientStateProvider)?.client?.countryCode;
      setClientData(ref.watch(clientStateProvider));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var client = ref.watch(clientStateProvider);
    handleState(sendOtpForLoginStateProvider, showLoading: true,
        onSuccess: (res) {
          if (res.data?.isExist == true) {

            AppSnackBar.showSnackBar(context,
                isSuccess: false, message: "this phone is already exist");

          } else {
            completeEditPhone();
          }
        }, onFail: (res) {
          AppSnackBar.showSnackBar(context,
              isSuccess: false, message: res.message ?? "");
        });


    return Scaffold(
      appBar: CustomAppBar(
        title: context.tr(editPhoneNumberKey),
        navigated: true,
        isCenter: false, appContext: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPaddingHorizontal),
        child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              PhoneFieldWithCountryCode(
                initCodeValue: "+${client?.client?.countryCode}",
                phoneController: phoneTextEditingController,
                onSelectCountryCode: (code) {
                  countryCode = code;
                },
                isCountryCodeEmpty: isCountryCodeEmpty,
              ),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              AppButton(
                width: context.getScreenSize.width,
                height: 48,
                onPress: () {
                  if (formKey.currentState?.validate() == true) {
                    sendOtp();
                  }
                },
                child: Text(
                  context.tr(saveKey),
                  style: AppTheme
                      .styleWithTextBlackAdelleSansExtendedFonts16w400
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
            ),
      )
    );
  }

  void setClientData(ClientAuthResponseData? client) {
    phoneTextEditingController.text = client?.client?.phone?.toString() ?? "";
  }

  void sendOtp() async {
    if (formKey.currentState?.validate() == true) {
      ref
          .read(sendOtpForLoginStateProvider.notifier)
          .sendOtp(phoneTextEditingController.text.toString(),countryCode: countryCode);
    }
  }

  void completeEditPhone() {
    print(countryCode?.removeFirstChar("+"));
    context.push(R_OTP, extra: {
      "phone": phoneTextEditingController.text.toString(),
      "type": OTPType.Update,
      "typeOfMode": TypeOfMode.ViewMode,
      "codeCountry" : countryCode?.removeFirstChar("+"),
    });
  }

}
