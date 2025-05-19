import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/BottomSheets/SelectionBottomSheet.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';
import 'package:lazo_client/Utils/OrderExExtra.dart';
import 'package:lazo_client/Utils/ValidationEx.dart';

import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../addresses/componants/phone_with_country_code_for_address.dart';
import '../cartScreen/componants/CustomSwitch.dart';
import '../details/componants/ProductItemCard.dart';
import '../details/componants/ProductRowItem.dart';
import 'componantes/selected_item_bottom_sheet.dart';

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
  List<ItemSelectorV2> typeSendArray = [
    ItemSelectorV2(id: 0, text: "My self"),
    ItemSelectorV2(id: 1, text: "Someone")
  ];
  List<ItemSelectorV2> deliveryTimeArray = [
    ItemSelectorV2(id: 0, text: "9:00 AM to 3:00 PM"),
    ItemSelectorV2(id: 0, text: "3:00 PM to 12:00 AM")
  ];
  final formKey = GlobalKey<FormState>();
  final TextEditingController voucherTextController = TextEditingController();

  final ValueNotifier<bool> promoCodeState = ValueNotifier(false);
  final ValueNotifier<bool> isCountryCodeEmpty = ValueNotifier(false);
  String? code;

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

    handleState(showPromoCodeDetailsForSoftServiceStateNotifies,
        showLoading: true, showToast: true, onSuccess: (res) {
      promocode = res.data?.data?.code;
      promoCodeState.value = true;
      handleCalculateInstantOrder();
    });

    handleState(createOrderStateNotifiers, showLoading: true, showToast: true,
        onSuccess: (res) {
      print(
          "create order Response payment link : ${res.data?.data?.paymentLink}");
      ref.watch(fetchCardDetailsStateNotifies);
      if (res.data?.data?.paymentLink != null) {
        navigateToPaymentScreen(res.data?.data?.paymentLink ?? "");
      } else {
        context.pop(true);
      }
    });

    handleState(calculateInstantOrderStateProvider, onSuccess: (res) {
      print("calculate Response ${res.state}");

      print(res.data?.data?.orderItems);
    });

    print("type of checkout ${cartSelectionData.toString()}");
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: context.tr(checkoutKey),
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
                Text(
                  context.tr(deliveryInfoKey),
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                const SizedBox(
                  height: spaceBetweenItems,
                ),
                widget.type == CheckoutTypes.HartCard
                    ? TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        cursorColor: AppTheme.blackColor2,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  print("object");
                                  showSendTypesBottomSheet();
                                },
                                child: SVGIcons.bottomRedArrowIcon(
                                  color: AppTheme.mainAppColorDark,
                                )),
                            hintText: context.tr(sendToMyselfOrToSomeoneKey),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            )),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            ))),
                        controller: sendTypeController,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Select date of send";
                          } else {
                            return null;
                          }
                        })
                    : const SizedBox(),
                widget.type == CheckoutTypes.HartCard
                    ? const SizedBox(height: spaceBetweenItems)
                    : const SizedBox(),
                TextFormField(
                    readOnly: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    cursorColor: AppTheme.blackColor2,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: SVGIcons.calendarImageIcon()),
                        hintText: context.tr(dateKey),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: AppTheme.appGrey20,
                        )),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: AppTheme.appGrey20,
                        ))),
                    controller: calenderController,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Select date of send";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: spaceBetweenItems,
                ),
                TextFormField(
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  cursorColor: AppTheme.blackColor2,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            showDeliveryTimeBottomSheet();
                          },
                          child: SVGIcons.timeCircleIcon()),
                      hintText: context.tr(timeKey),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      )),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      ))),
                  controller: timeController,
                  validator: (value) {
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
                Text(
                  selectTypeOfSend == 0 || widget.type == CheckoutTypes.HartCard
                      ? context.tr(locationKey)
                      : context.tr(recipientInfoKey),
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
                            color: AppTheme.appGrey28,
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.all(defaultPaddingHorizontal),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  context.tr(askTheRecipientForTheAddressKey),
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                ),
                                const Spacer(),
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
                              context.tr(
                                  weWillCollectTheAddressFromTheRecipientKey),
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
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 25,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  cursorColor: AppTheme.blackColor2,
                                  decoration: InputDecoration(
                                      hintText: context.tr(recipientNameKey),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      )),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      ))),
                                  controller: recipientNameController,
                                  validator: (value) {
                                    if (value?.isEmpty == true) {
                                      return "Select type of send";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: defaultPaddingHorizontal,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 25,
                                child: PhoneFieldWithCountryCodeForAddress(
                                  phoneController: recipientPhoneController,
                                  isCountryCodeEmpty: isCountryCodeEmpty,
                                  onSelectCountryCode: (value) {
                                    code = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: spaceBetweenItems,
                          ),
                          widget.type == CheckoutTypes.HartCard
                              ? TextFormField(
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            selectLocation();
                                          },
                                          child: SVGIcons.locationIcon()),
                                      hintText:
                                          context.tr(selectLocationOnMapKey),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      )),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      ))),
                                  controller: locationController,
                                  validator: (value) {
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
                                  height: spaceBetweenItems,
                                )
                              : const SizedBox(),
                          widget.type == CheckoutTypes.HartCard
                              ? TextFormField(
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                      hintText: context.tr(addressDetailsKey),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      )),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppTheme.appGrey20,
                                      ))),
                                  controller: addressDescriptionController,
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
                      "Add a personal message",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: spaceBetweenItems,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: context.tr(toKey),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      )),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      ))),
                  controller: messageToController,
                ),
                const SizedBox(
                  height: spaceBetweenItems,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText:
                          context.tr(typeYourMessageAndExpressYourFeelingKey),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      )),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTheme.appGrey20,
                      ))),
                  controller: messageController,
                ),
                const SizedBox(
                  height: 32,
                ),
                widget.type == CheckoutTypes.HartCard
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.all(defaultPaddingHorizontal),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  context.tr(keepMyIdentitySecretKey),
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
                              context.tr(byCheckingThisBoxKey),
                              style: AppTheme
                                  .styleWithTextGray7AdelleSansExtendedFonts12w400
                                  .copyWith(height: 1.3),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                widget.type == CheckoutTypes.SoftCard
                    ? Text(
                        context.tr(saveOnYourOrderKey),
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 24,
                ),
                widget.type == CheckoutTypes.SoftCard
                    ? ValueListenableBuilder(
                        valueListenable: promoCodeState,
                        builder: (context, value, _) {
                          return AppTextField(
                            /*New Money*/
                            readOnly: value,
                            hint: context.tr(enterVoucherCodeKey),
                            label: null,
                            style: !value
                                ? TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    fontSize: 16)
                                : const TextStyle(fontSize: 0),
                            startWidget: value
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 16.0, end: 8),
                                        child: Text(
                                          "${voucherTextController.text}",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      SVGIcons.localSVG(
                                        correctVoucherIcons,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  )
                                : null,
                            textEditingController: voucherTextController,
                            endWidget: InkWell(
                              onTap: () {
                                if (value) {
                                  voucherTextController.text = "";
                                  promocode = null;
                                  promoCodeState.value = false;
                                } else if (voucherTextController
                                    .text.isNotEmpty) {
                                  getPromoCodeDetails();
                                }
                              },
                              child: SizedBox(
                                  width: 70,
                                  height: 56,
                                  child: Center(
                                      child: Text(
                                    value ? "Remove" : "Apply",
                                    style: AppTheme
                                        .styleWithTextMainAppColorAdelleSansExtendedFonts14w400
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  ))),
                            ),
                          );
                        })
                    : const SizedBox(),
                widget.type == CheckoutTypes.SoftCard
                    ? SizedBox(
                        height: 24,
                      )
                    : const SizedBox(),
                Text(
                  context.tr(paymentSummaryKey),
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
                          title: context.tr(orderPriceKey),
                          textValue:
                              "${context.tr(sarKey)} ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalBefore ?? 0) : calculateSoftService.data?.data?.totalBeforeDiscount ?? 0}",
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
                                title: context.tr(shippingFeeKey),
                                textValue:
                                    "${context.tr(sarKey)} ${(cartInfo.data?.data?.shippingFee ?? 0)}",
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
                                title: context.tr(discountKey),
                                textValue:
                                    "${context.tr(sarKey)} ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.discountTotal ?? 0) : calculateSoftService.data?.data?.discount ?? 0}",
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
                          title: context.tr(totalPriceKey),
                          textValue:
                              "${context.tr(sarKey)} ${widget.type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalAfter ?? 0) : (calculateSoftService.data?.data?.total ?? 0)}",
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
                    text: context.tr(checkoutKey),
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
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (builder) {
          return SelectedItemBottomSheet(
            items: typeSendArray,
            initSelectedIndex: selectTypeOfSend,
            title: 'Choose',
            subTitle: 'Who is this gift for',
            additionalText:
                'Choose Myself if the gift is for you, or Someone to send it to a loved one.',
            onSelect: (index){
              sendTypeController.text = typeSendArray[index].text;
              setState(() {
                selectTypeOfSend = index;
              });
            },
          );
        });
  }

  void showDeliveryTimeBottomSheet() {

    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (builder) {
          return SelectedItemBottomSheet(
            items: deliveryTimeArray,
            initSelectedIndex: selectDeliveryTimeOfSend,
            title: 'Choose',
            subTitle: 'Delivery Time',
            onSelect: (index){
              selectDeliveryTimeOfSend = index;
              timeController.text = deliveryTimeArray[index].text;
            },
          );
        });

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
        "deliveryTime : ${selectDeliveryTimeOfSend != null ? deliveryTimeArray[selectDeliveryTimeOfSend!].text : null}");
    if (formKey.currentState?.validate() == true) {
      ref.read(createOrderStateNotifiers.notifier).createOrder(
          isIdentitySecret: _enableIsSecret == true ? "1" : "0",
          giftBoxId: giftBoxId,
          giftCardId: giftCardId,
          orderType: selectTypeOfSend == 0
              ? OrderTypes.self_order.name.toString()
              : OrderTypes.receiver_order.name.toString(),
          paymentMethod: "Credit Card",
          promocode: promocode,
          latLng: latLng,
          receiverName: recipientNameController.text,
          receiverAddress: locationController.text,
          receiverAddressDetails: addressDescriptionController.text,
          receiverPhone: recipientPhoneController.text,
          deliveryDate: _selectedDate?.convertDateToString("dd MMM yyyy"),
          deliveryTime: selectDeliveryTimeOfSend != null
              ? deliveryTimeArray[selectDeliveryTimeOfSend!].text
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
              ? deliveryTimeArray[selectDeliveryTimeOfSend!].text
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
        .read(showPromoCodeDetailsForSoftServiceStateNotifies.notifier)
        .showPromoCodeDetails(code: voucherTextController.text);
  }

  void resetCartSelectionData() {
    ref.read(cartDateSelectedStateNotifiers.notifier).setCartDataSelection({});
  }

  void handleCalculateInstantOrder() {
    print("promocode : $promocode serviceId : ${(widget.service?.id ?? 0)}");
    ref.read(calculateInstantOrderStateProvider.notifier).calculateInstantOrder(
        serviceId: (widget.service?.id ?? 0).toString(),
        serviceQuantity: "1",
        serviceSelectedListIds: widget.serviceSelectedListIds,
        serviceSelectedListItemsIds: widget.serviceSelectedListItemsIds,
        promocode: promocode);
  }

  void navigateToPaymentScreen(String paymentLink) async {
    var success = await context
        .push(R_PaymentScreen, extra: {"paymentLink": paymentLink});
    if (success == true) {
      context.pop(true);
    }
  }
}
