import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Presentation/BottomSheets/SelectionBottomSheet.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';

import '../../../Constants/Constants.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../cartScreen/componants/CustomSwitch.dart';
import '../details/componants/ProductRowItem.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final sendTypeController = TextEditingController();
  final calenderController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final recipientNameController = TextEditingController();
  final recipientPhoneController = TextEditingController();
  final addressDescriptionController = TextEditingController();
  final messageToController = TextEditingController();
  final messageController = TextEditingController();
  bool _enable = false;
  bool _enableIsSecret = false;

  DateTime? _selectedDate;
  int? selectTypeOfSend;
  int? selectDeliveryTimeOfSend;
  LatLng? selectedLocation;
  List<SelectionBottomSheetItem> typeSendArray = [
    SelectionBottomSheetItem(item: "My self"),
    SelectionBottomSheetItem(item: "Someone")
  ];
  List<SelectionBottomSheetItem> deliveryTimeArray = [
    SelectionBottomSheetItem(item: "9:00 AM to 3:00 PM"),
    SelectionBottomSheetItem(item: "3:00 PM to 12:00 AM")
  ];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cartInfo = ref.watch(cartCalculationStateNotifies);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Check Out",
        isCenter: false,
        navigated: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(defaultPaddingHorizontal),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  endWidget: InkWell(
                      onTap: () {
                        print("object");
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
                  selectTypeOfSend == 1 ? "Location" : "Recipient Info" ,
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                selectTypeOfSend != 1 ? const SizedBox(
                  height: 24,
                ) : const SizedBox(
                  height: 5,
                ),
                selectTypeOfSend != 1 ? Container(
                  decoration: BoxDecoration(
                      color: AppTheme.appGrey9,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppTheme.appGrey6, width: 1)),
                  padding: EdgeInsets.all(defaultPaddingHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ask the recipient for the address",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts16w500,
                          ),
                          Spacer(),
                          CustomSwitch(
                            value: _enable,
                            onChanged: (bool val) {
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
                      Text(
                        "We will collect the address from the recipient. Delivery time may be impacted if recipient is unreachable",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400
                            .copyWith(height: 1.3),
                      )
                    ],
                  ),
                ): const SizedBox(),
                const SizedBox(
                  height: 24,
                ),
                selectTypeOfSend == 1 || (selectTypeOfSend == 0 && _enable) ? Column(
                  children: [
                    AppTextField(
                      textInputType: TextInputType.text,
                      textFieldBorderColor: AppTheme.appGrey3,
                      mode: AutovalidateMode.onUserInteraction,
                      hint: "Recipient Name",
                      label: "Recipient Name",
                      textEditingController: recipientNameController,
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
                      textInputType: TextInputType.phone,
                      textFieldBorderColor: AppTheme.appGrey3,
                      mode: AutovalidateMode.onUserInteraction,
                      hint: "Recipient Phone",
                      label: "Recipient Phone",
                      textEditingController: recipientPhoneController,
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
                      endWidget: InkWell(
                          onTap: () {
                            selectLocation();
                          },
                          child: SVGIcons.locationIcon()),
                      readOnly: true,
                      textInputType: TextInputType.text,
                      textFieldBorderColor: AppTheme.appGrey3,
                      mode: AutovalidateMode.onUserInteraction,
                      hint: "Select Location on map",
                      label: "Select Location on map",
                      textEditingController: locationController,
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
                      hint: "Address Details (optional)",
                      label: "Address Details (optional)",
                      textEditingController: addressDescriptionController,
                    ),
                  ],
                ): const SizedBox(),

                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      "Add your message",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
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
                  textEditingController: messageToController,
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
                  textEditingController: messageController,
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                Text(
                  "Delivery info",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                AppTextField( // 13/5/2024
                  endWidget: InkWell(
                      onTap: () {
                        print("object");
                        _selectDate(context);
                      },
                      child: SVGIcons.calendarImageIcon()),
                  readOnly: true,
                  textInputType: TextInputType.text,
                  textFieldBorderColor: AppTheme.appGrey3,
                  mode: AutovalidateMode.onUserInteraction,
                  hint: "Date",
                  label: "Date",
                  textEditingController: calenderController,
                  validate: (value) {
                    if (value?.isEmpty == true) {
                      return "Select date of send";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                AppTextField(
                  endWidget: InkWell(
                      onTap: () {
                        print("object");
                        showDeliveryTimeBottomSheet();
                      },
                      child: SVGIcons.timeCircleIcon()),
                  readOnly: true,
                  textInputType: TextInputType.text,
                  textFieldBorderColor: AppTheme.appGrey3,
                  mode: AutovalidateMode.onUserInteraction,
                  hint: "Time",
                  label: "Time",
                  textEditingController: timeController,
                  validate: (value) {
                    if (value?.isEmpty == true) {
                      return "Select Time of send";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.appGrey9,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppTheme.appGrey6, width: 1)),
                  padding: EdgeInsets.all(defaultPaddingHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Keep my identity secret",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts16w500,
                          ),
                          Spacer(),
                          CustomSwitch(
                            value: _enableIsSecret,
                            onChanged: (bool val) {
                              setState(() {
                                _enableIsSecret = val;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "By checking this box, we will not share any of your personal details with the recipient even if they call to ask.",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400
                            .copyWith(height: 1.3),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Payment Summary",
                  style: AppTheme
                      .styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.appGrey8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Order Price",
                          textValue:
                          "SAR ${(cartInfo.data?.data?.totalBefore ?? 0)}",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ),
                      cartInfo.data?.data?.shippingFee != null &&
                          cartInfo.data?.data?.shippingFee != 0
                          ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Shipping Fees",
                          textValue:
                          "SAR ${(cartInfo.data?.data?.shippingFee ?? 0)}",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      )
                          : SizedBox(),
                      cartInfo.data?.data?.discountTotal != null &&
                          cartInfo.data?.data?.discountTotal != 0
                          ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Discount",
                          textValue:
                          "SAR ${(cartInfo.data?.data?.discountTotal ?? 0)}",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500
                              .copyWith(
                              color: AppTheme.mainAppColor),
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                              .copyWith(
                              color: AppTheme.mainAppColor),
                        ),
                      )
                          : SizedBox(),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Total Price",
                          textValue:
                          "SAR ${(cartInfo.data?.data?.totalAfter ?? 0)}",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w700,
                          desTextStyle: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w700,
                          hasDivider: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                AppButton(
                    text: "Check Out",
                    width: double.infinity,
                    height: 46,
                    onPress: () {
                      createOrder();
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }

  void showSendTypesBottomSheet() {
    showBottomSheetSelection(context, "Send to", typeSendArray, (index) {
      setState(() {
        selectTypeOfSend = index;
      });
      sendTypeController.text = typeSendArray[index].item;
    }, initialValue: selectTypeOfSend);
  }

  void showDeliveryTimeBottomSheet() {
    showBottomSheetSelection(context, "Delivery time", deliveryTimeArray,
        (index) {
      selectDeliveryTimeOfSend = index;
      timeController.text = deliveryTimeArray[index].item;
    }, initialValue: selectDeliveryTimeOfSend);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(7200),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;

      calenderController.text = _selectedDate.toString();

    }
  }

  void selectLocation() async{
    var location = await context.push(R_GoogleMapScreen,extra: {"locationSelected" : selectedLocation});
    if(location != null){
      selectedLocation = location as LatLng?;
      var address = await LocationHandler.getAddressFromLatLng(selectedLocation!);
      locationController.text = address;
    }
  }

  void createOrder(){
    if (formKey.currentState?.validate() == true) {
      ref.read(createOrderStateNotifiers.notifier).createOrder(
        isIdentitySecret: _enableIsSecret == true ? "1" : "0"
      );
    }
  }
}
