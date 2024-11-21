import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/BottomSheets/SelectionBottomSheet.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../cartScreen/componants/CustomSwitch.dart';
import '../details/componants/ProductItemCard.dart';
import '../details/componants/ProductRowItem.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  final CheckoutTypes? type;
  final ServiceShowData? service;
  final String? serviceSelectedListIds;
  final String? serviceSelectedListItemsIds;
  const CheckoutScreen(
      {this.type = CheckoutTypes.HartCard,
      this.service,
      this.serviceSelectedListIds,
      this.serviceSelectedListItemsIds,
      super.key});

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
  String? promocode;

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
  final TextEditingController voucherTextController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.type == CheckoutTypes.SoftCard) {
        print("calculateData: serviceid : ${widget.service?.id}");
        handleCalculateInstantOrder();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var calculateSoftService = ref.watch(calculateInstantOrderStateProvider);
    var cartInfo = widget.type == CheckoutTypes.HartCard
        ? ref.watch(cartCalculationStateNotifies)
        : ref.watch(calculationForSoftItemStateNotifies);
    var cartSelectionData = ref.watch(cartDateSelectedStateNotifiers);

    handleState(showPromoCodeDetailsStateNotifies, showLoading: true,
        onSuccess: (res) {
      promocode = res.data?.data?.code;
      handleCalculateInstantOrder();
    });

    handleState(createOrderStateNotifiers, showLoading: true, onSuccess: (res) {
      print("create order Response payment link : ${res.data?.paymentLink}");
      ref.watch(fetchCardDetailsStateNotifies);
      // navigateToPaymentScreen(res.data?.paymentLink ?? "");
      context.pop(true);
    });

    handleState(calculateInstantOrderStateProvider, onSuccess: (res) {
      print("calculate Response ${res.state}");

      print(res.data?.data?.orderItems);
    });

    print("type of checkout ${cartSelectionData.toString()}");
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
                widget.type == CheckoutTypes.SoftCard &&
                        calculateSoftService.state == DataState.SUCCESS
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          ProductItemCard(
                            insideWidth: 260,
                            item: calculateSoftService
                                    .data?.data?.orderItems.first ??
                                ClientOrderDetailsOrderItemsInner(
                                    service:
                                        ProviderOrderDetailsOrderItemsInnerService(
                                            coverImagePath:
                                                widget.service?.imagePath,
                                            name: widget.service?.name,
                                            price: widget.service?.price,
                                            priceAfterDiscount: widget
                                                .service?.priceAfterDiscount)),
                            onItemClick: (itemId) {},
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.HartCard
                    ? AppTextField(
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
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.HartCard
                    ? const SizedBox(
                        height: 30,
                      )
                    : const SizedBox(),
                Text(
                  selectTypeOfSend == 0 || widget.type == CheckoutTypes.HartCard
                      ? "Location"
                      : "Recipient Info",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                selectTypeOfSend != 0
                    ? const SizedBox(
                        height: 24,
                      )
                    : const SizedBox(
                        height: 5,
                      ),
                selectTypeOfSend != 0 && widget.type == CheckoutTypes.HartCard
                    ? Container(
                        decoration: BoxDecoration(
                            color: AppTheme.appGrey9,
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: AppTheme.appGrey6, width: 1)),
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
                                    print(val);
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
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.HartCard
                    ? const SizedBox(
                        height: 24,
                      )
                    : const SizedBox(),
                selectTypeOfSend != null ||
                        widget.type == CheckoutTypes.SoftCard
                    ? Column(
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
                          widget.type == CheckoutTypes.HartCard
                              ? AppTextField(
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
                                    if (value?.isEmpty == true &&
                                        (!_enable && selectTypeOfSend == 1)) {
                                      return "Select type of send";
                                    } else {
                                      return null;
                                    }
                                  },
                                )
                              : const SizedBox(),
                          widget.type == CheckoutTypes.HartCard
                              ? const SizedBox(
                                  height: defaultPaddingHorizontal,
                                )
                              : const SizedBox(),
                          widget.type == CheckoutTypes.HartCard
                              ? AppTextField(
                                  textInputType: TextInputType.text,
                                  textFieldBorderColor: AppTheme.appGrey3,
                                  mode: AutovalidateMode.onUserInteraction,
                                  hint: "Address Details (optional)",
                                  label: "Address Details (optional)",
                                  textEditingController:
                                      addressDescriptionController,
                                )
                              : const SizedBox(),
                        ],
                      )
                    : const SizedBox(),
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
                AppTextField(
                  // 13/5/2024
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
                widget.type == CheckoutTypes.HartCard
                    ? Container(
                        decoration: BoxDecoration(
                            color: AppTheme.appGrey9,
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: AppTheme.appGrey6, width: 1)),
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
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.SoftCard ? Text(
                  "Save on your order",
                  style:
                  AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ): const SizedBox(),
                SizedBox(
                  height: 24,
                ),
                widget.type == CheckoutTypes.SoftCard
                    ? AppTextField(
                        // XGFSF35
                        hint: "Enter Voucher code",
                        label: "Enter Voucher code",
                        textFieldBorderColor: AppTheme.appGrey3,
                        textEditingController: voucherTextController,
                        startWidget: SVGIcons.voucherIcon(),
                        endWidget: InkWell(
                          onTap: () {
                            if (voucherTextController.text.isNotEmpty) {
                              getPromoCodeDetails();
                            }
                          },
                          child: SizedBox(
                              width: 70,
                              height: 56,
                              child: Center(
                                  child: Text(
                                "submit",
                                style: AppTheme
                                    .styleWithTextMainAppColorAdelleSansExtendedFonts14w400
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ))),
                        ),
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.SoftCard
                    ? SizedBox(
                        height: 24,
                      )
                    : const SizedBox(),
                Text(
                  "Payment Summary",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
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
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Order Price",
                          textValue:
                              "SAR ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalBefore ?? 0) : calculateSoftService.data?.data?.totalBeforeDiscount ?? 0}",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ),
                      cartInfo.data?.data?.shippingFee != null &&
                              cartInfo.data?.data?.shippingFee != 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                      (cartInfo.data?.data?.discountTotal != null &&
                                  cartInfo.data?.data?.discountTotal != 0) ||
                              (calculateSoftService.data?.data?.discount !=
                                      null &&
                                  calculateSoftService.data?.data?.discount !=
                                      0)
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: ProductRowItem(
                                title: "Discount",
                                textValue:
                                    "SAR ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.discountTotal ?? 0) : calculateSoftService.data?.data?.discount ?? 0}",
                                titleTextStyle: AppTheme
                                    .styleWithTextBlackColorAdelleSansExtendedFonts12w500
                                    .copyWith(color: AppTheme.mainAppColor),
                                desTextStyle: AppTheme
                                    .styleWithTextGray7AdelleSansExtendedFonts12w400
                                    .copyWith(color: AppTheme.mainAppColor),
                              ),
                            )
                          : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Total Price",
                          textValue:
                              "SAR ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalAfter ?? 0) : (calculateSoftService.data?.data?.total ?? 0)}",
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
                      if ((cartSelectionData[orderTypeKey]).toString() ==
                          OrderTypes.receiver_order.name) {
                        createOrder(
                            cartSelectionData.containsKey(giftBoxIdKey)
                                ? cartSelectionData[giftBoxIdKey].toString()
                                : null,
                            cartSelectionData.containsKey(giftCardIdKey)
                                ? cartSelectionData[giftCardIdKey].toString()
                                : null,
                            cartSelectionData.containsKey(promocodeKey)
                                ? cartSelectionData[promocodeKey].toString()
                                : null,
                            "${selectedLocation?.latitude}, ${selectedLocation?.longitude}");
                      } else {
                        createInstantOrder(
                          serviceId: cartSelectionData.containsKey(serviceIdKey)
                              ? cartSelectionData[serviceIdKey].toString()
                              : null,
                          serviceSelectedListItemsIds: cartSelectionData
                                  .containsKey(serviceSelectedListItemsIdsKey)
                              ? cartSelectionData[
                                      serviceSelectedListItemsIdsKey]
                                  .toString()
                              : null,
                          serviceSelectedListIds: cartSelectionData
                                  .containsKey(serviceSelectedListIdsKey)
                              ? cartSelectionData[serviceSelectedListIdsKey]
                                  .toString()
                              : null,
                          promocode: cartSelectionData.containsKey(promocodeKey)
                              ? cartSelectionData[promocodeKey].toString()
                              : null,
                        );
                      }
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
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(7200),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;

      calenderController.text =
          _selectedDate?.convertDateToString("dd MMM yyyy") ?? "";
    }
  }

  void selectLocation() async {
    var location = await context
        .push(R_GoogleMapScreen, extra: {"locationSelected": selectedLocation});
    if (location != null) {
      selectedLocation = location as LatLng?;
      var address =
          await LocationHandler.getAddressFromLatLng(selectedLocation!);
      locationController.text = address;
    }
  }

  void createOrder(
    String? giftBoxId,
    String? giftCardId,
    String? promocode,
    String? latLng,
  ) {
    print("isIdentitySecret : ${_enableIsSecret == true ? "1" : "0"} "
        "giftBoxId : $giftBoxId "
        "giftCardId : $giftCardId "
        "promocode: $promocode "
        "latLng: $latLng "
        "receiverAddress : ${locationController.text} "
        "receiverAddressDetails : ${addressDescriptionController.text} "
        "receiverPhone : ${recipientPhoneController.text}"
        "deliveryDate : ${_selectedDate?.convertDateToString("dd MMM yyyy")} "
        "deliveryTime : ${selectDeliveryTimeOfSend != null ? deliveryTimeArray[selectDeliveryTimeOfSend!].item : null}");
    if (formKey.currentState?.validate() == true) {
      ref.read(createOrderStateNotifiers.notifier).createOrder(
          isIdentitySecret: _enableIsSecret == true ? "1" : "0",
          giftBoxId: giftBoxId,
          giftCardId: giftCardId,
          orderType: OrderTypes.receiver_order.name.toString(),
          paymentMethod: "Credit Card",
          promocode: promocode,
          latLng: latLng,
          receiverName: recipientNameController.text,
          receiverAddress: locationController.text,
          receiverAddressDetails: addressDescriptionController.text,
          receiverPhone: recipientPhoneController.text,
          deliveryDate: _selectedDate?.convertDateToString("dd MMM yyyy"),
          deliveryTime: selectDeliveryTimeOfSend != null
              ? deliveryTimeArray[selectDeliveryTimeOfSend!].item
              : null);
    }
  }

  void createInstantOrder({
    String? serviceId,
    String? serviceQuantity,
    String? serviceSelectedListIds,
    String? serviceSelectedListItemsIds,
    String? paymentMethod,
    String? promocode,
    String? receiverName,
    String? receiverPhoneNumber,
    String? cardMessage,
    String? cardFrom,
    String? cardTo,
  }) {
    print("serviceId : $serviceId"
        "\n serviceSelectedListIds :$serviceSelectedListIds"
        "\n serviceSelectedListItemsIds: $serviceSelectedListItemsIds"
        "\n paymentMethod: $paymentMethod");
    if (formKey.currentState?.validate() == true) {
      ref.read(createOrderStateNotifiers.notifier).createInstantOrder(
          serviceId: serviceId,
          serviceQuantity: "1",
          serviceSelectedListIds: serviceSelectedListIds,
          serviceSelectedListItemsIds: serviceSelectedListItemsIds,
          paymentMethod: paymentMethod,
          promocode: promocode,
          receiverPhoneNumber: recipientPhoneController.text,
          receiverName: recipientNameController.text,
          cardMessage: messageController.text,
          cardFrom: cardFrom,
          cardTo: messageToController.text,
          deliveryDate: _selectedDate?.convertDateToString("dd MMM yyyy"),
          deliveryTime: selectDeliveryTimeOfSend != null
              ? deliveryTimeArray[selectDeliveryTimeOfSend!].item
              : null);
    }
  }

  @override
  void dispose() {
    resetCartSelectionData();
    super.dispose();
  }

  void getPromoCodeDetails() {
    ref
        .read(showPromoCodeDetailsStateNotifies.notifier)
        .showPromoCodeDetails(code: voucherTextController.text);
  }

  void resetCartSelectionData() {
    ref.read(cartDateSelectedStateNotifiers.notifier).setCartDataSelection({});
  }

  void handleCalculateInstantOrder() {
    ref.read(calculateInstantOrderStateProvider.notifier).calculateInstantOrder(
        serviceId: (widget.service?.id ?? 0).toString(),
        serviceQuantity: "1",
        serviceSelectedListIds: widget.serviceSelectedListIds,
        serviceSelectedListItemsIds: widget.serviceSelectedListItemsIds,
        promocode: promocode);
  }

  void navigateToPaymentScreen(String paymentLink) async{
    var success = await context.push(R_PaymentScreen, extra: {"paymentLink" : paymentLink});
    if(success == true){
      context.pop(true);
    }
  }
}
