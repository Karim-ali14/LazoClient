import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/BottomSheets/SelectionBottomSheet.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/card_summary_details.dart';
import 'package:lazo_client/Presentation/Screens/checkout/componantes/saved_recipients_addresses.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/ClientStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';
import 'package:lazo_client/Utils/OrderExExtra.dart';
import 'package:lazo_client/Utils/ValidationEx.dart';

import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Utils/HalperMethods.dart';
import '../../StateNotifiersViewModel/AddressStateNotifiers.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/AppTextField.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/map_view_container.dart';
import '../addresses/componants/phone_with_country_code_for_address.dart';
import '../cartScreen/componants/CustomSwitch.dart';
import '../cartScreen/componants/service_info_view.dart';
import '../details/componants/ProductItemCard.dart';
import '../details/componants/ProductRowItem.dart';
import 'componantes/selected_item_bottom_sheet.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  final CheckoutTypes? type;
  final ServiceShowData? service;
  final String? serviceSelectedListIds;
  final String? serviceSelectedListItemsIds;
  final bool? withInStepper;
  const CheckoutScreen(
      {this.type = CheckoutTypes.HartCard,
      this.service,
      this.serviceSelectedListIds,
      this.serviceSelectedListItemsIds,
      this.withInStepper,
      super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => CheckoutScreenState();
}

class CheckoutScreenState extends ConsumerState<CheckoutScreen>  with AutomaticKeepAliveClientMixin{
  final ValueNotifier<String> codeNotifier = ValueNotifier("");
  final ValueNotifier<bool> saveAddressValueNotifier = ValueNotifier(false);
  final sendTypeController = TextEditingController();
  final calenderController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final recipientNameController = TextEditingController();
  final recipientPhoneController = TextEditingController();
  final addressDescriptionController = TextEditingController();
  final messageToController = TextEditingController();
  final messageFromController = TextEditingController();
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

  City? city;

  @override
  void initState() {
    initCity();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(fetchAddressForCheckoutStateNotifiers.notifier).fetchAddresses();
      if (widget.type == CheckoutTypes.SoftCard) {
        print("calculateData: serviceid : ${widget.service?.id}");
        handleCalculateInstantOrder();
      }
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true; // This keeps the screen alive
  @override
  Widget build(BuildContext context) {
    super.build(context); // Required to call in widgets with AutomaticKeepAliveClientMixin
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

    handleState(calculateInstantOrderStateProvider, onSuccess: (res) {
      print("calculate Response ${res.state}");

      print(res.data?.data?.orderItems);
    });

    print("type of checkout ${cartSelectionData.toString()}");
    return Scaffold(
      appBar: widget.withInStepper == true
          ? null
          : CustomAppBar(
              appContext: context,
              title: context.tr(checkoutKey),
              isCenter: false,
              navigated: true,
            ),
      body: SafeArea(
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
                        const SizedBox(
                          height: 16,
                        ),
                        ServiceInfoView(
                          item: widget.service,
                          selectedServicesListItemsNames: cartSelectionData[serviceSelectedListItemsNamesKey]?.toString() ?? "",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPaddingHorizontal, vertical: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(deliveryInfoKey),
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                    ),
                    const SizedBox(
                      height: spaceBetweenItems,
                    ),
                    widget.type == CheckoutTypes.HartCard
                        ? TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            cursorColor: AppTheme.blackColor2,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      showSendTypesBottomSheet();
                                    },
                                    child: SVGIcons.bottomRedArrowIcon(
                                      color: AppTheme.mainAppColorDark,
                                    )),
                                hintText:
                                    context.tr(sendToMyselfOrToSomeoneKey),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal, vertical: 24),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectTypeOfSend == 0 || widget.type == CheckoutTypes.HartCard
                              ? context.tr(locationKey)
                              : context.tr(recipientInfoKey),
                          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                        ),
                        selectTypeOfSend != 0
                            ? const SizedBox(
                          height: 8,
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
                                context
                                    .tr(weWillCollectTheAddressFromTheRecipientKey),
                                style: AppTheme
                                    .styleWithTextGray7AdelleSansExtendedFonts12w400
                                    .copyWith(height: 1.3),
                              )
                            ],
                          ),
                        )
                            : const SizedBox(),
                        SizedBox(
                          height: 8.h,
                        ),
                        selectTypeOfSend != null || widget.type == CheckoutTypes.SoftCard
                            ? Column(
                          children: [
                            widget.type == CheckoutTypes.HartCard
                                ? SavedRecipientsAddresses(
                              onItemPressed: (addressItem) {
                                autoFillAddress(addressItem);
                              },
                            )
                                : const SizedBox(),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 - 25,
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
                                  width: MediaQuery.of(context).size.width / 2 - 25,
                                  child: PhoneFieldWithCountryCodeForAddress(
                                    phoneController: recipientPhoneController,
                                    isCountryCodeEmpty: isCountryCodeEmpty,
                                    onSelectCountryCode: (value) {
                                      code = value;
                                    },
                                    code: codeNotifier,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            const SizedBox(
                              height: spaceBetweenItems,
                            ),
                            widget.type == CheckoutTypes.HartCard
                                ? MapViewContainer(
                              onMapSelectedLocation: (location) {
                                selectedLocation = location;
                                setAddressName(location);
                              },
                              city: city,
                              selectedLocation: selectedLocation,
                            )
                                : const SizedBox(),
                            const SizedBox(
                              height: spaceBetweenItems,
                            ),
                            widget.type == CheckoutTypes.HartCard
                                ? TextFormField(
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
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
                                  return "Select location of send";
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
                            widget.type == CheckoutTypes.HartCard
                                ? Row(
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: saveAddressValueNotifier,
                                    builder: (context, value, _) {
                                      return Transform.scale(
                                        scale: 1,
                                        child: Checkbox(
                                          visualDensity: VisualDensity(horizontal: -4),
                                          activeColor: AppTheme.mainAppColor,
                                          fillColor: MaterialStateProperty.resolveWith((states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return AppTheme.mainAppColor;
                                            }
                                            return Colors.white;
                                          }),
                                          onChanged: (newValue) {
                                            saveAddressValueNotifier.value =
                                                newValue ?? false;
                                          },
                                          value: value,
                                        ),
                                      );
                                    }),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Save this address for future orders",
                                  style: AppTheme
                                      .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                )
                              ],
                            )
                                : const SizedBox(),
                          ],
                        )
                            : const SizedBox(),
                      ])),
              /*selectTypeOfSend == 1 ?*/ Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddingHorizontal, vertical: 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        hintText:"To Fatma (Optional)",
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
                        hintText:"Eg: Get well soon*",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            )),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            ))),
                    controller: messageController,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Enter message";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: spaceBetweenItems,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText:"From Sara (Optional)",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            )),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.appGrey20,
                            ))),
                    controller: messageFromController,
                  ),

                  widget.type == CheckoutTypes.HartCard && selectTypeOfSend == 1
                      ? Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsetsDirectional.only(start: defaultPaddingHorizontal,end: defaultPaddingHorizontal,top: 24),
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
                  ])) /*:const SizedBox()*/,
              SizedBox(
                height: 16,
              ),
              widget.type == CheckoutTypes.SoftCard
                  ? ValueListenableBuilder(
                      valueListenable: promoCodeState,
                      builder: (context, value, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppTextField(
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
                                        padding: const EdgeInsetsDirectional.only(
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
                                            decoration: TextDecoration.underline),
                                  ))),
                            ),
                          ),
                        );
                      })
                  : const SizedBox(),
              widget.type == CheckoutTypes.SoftCard
                  ? SizedBox(
                      height: 16,
                    )
                  : const SizedBox(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CardSummaryDetails(
                  type: widget.type,
                ),
              ),
              SizedBox(
                height: widget.type == CheckoutTypes.SoftCard? 200:0,
              ),
              // widget.withInStepper == true
              //     ? const SizedBox()
              //     : AppButton(
              //         text: context.tr(checkoutKey),
              //         width: double.infinity,
              //         height: 46,
              //         onPress: () {})
            ],
          ),
        ),
      )),
    );
  }

  void continueToPayment({Function? afterPassConditions}) {
    var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);
    if ((cartSelectionData[orderTypeKey]).toString() ==
        OrderTypes.receiver_order.name) {
      navigateToPaymentOrder(afterPassConditions: afterPassConditions);
    } else {
      createInstantOrder(afterPassConditions: afterPassConditions);
    }
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
            onSelect: (index) {
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
            onSelect: (index) {
              selectDeliveryTimeOfSend = index;
              timeController.text = deliveryTimeArray[index].text;
            },
          );
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    var cart = ref.read(fetchCardDetailsStateNotifies);
    final DateTime now = DateTime.now();
    final int disabledDays = widget.type == CheckoutTypes.HartCard ? int.parse(cart.data?.data?.expectedProcessingTime ?? "0") : 1; // Number of days to disable from today

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now.add(Duration(days: disabledDays)),
      firstDate: now,
      lastDate: DateTime(7200),
      selectableDayPredicate: (DateTime day) {

        final DateTime allowedFrom = now.add(Duration(days: disabledDays - 1));

        if (day.isBefore(allowedFrom)) {
          return false;
        }

        return true; // الباقي مسموح
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;

      calenderController.text =
          _selectedDate?.convertDateToString("dd MMM yyyy") ?? "";
    }
  }

  void navigateToPaymentOrder({Function? afterPassConditions}) {
    if (formKey.currentState?.validate() == true) {
      var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);
      cartSelectionData[selectTypeOfSendKey] = selectTypeOfSend.toString();
      cartSelectionData[enableIsSecretKey] = _enableIsSecret.toString();
      cartSelectionData[cartLatLngKey] =
          "${selectedLocation?.latitude}, ${selectedLocation?.longitude}" ?? "";
      cartSelectionData[receiverAddressKey] = locationController.text;
      cartSelectionData[receiverAddressDetailsKey] =
          addressDescriptionController.text;
      cartSelectionData[receiverNameKey] = recipientNameController.text;
      cartSelectionData[receiverPhoneKey] = recipientPhoneController.text;
      cartSelectionData[deliveryDateKey] =
          _selectedDate?.convertDateToString("dd MMM yyyy") ?? "";
      cartSelectionData[deliveryTimeKey] = selectDeliveryTimeOfSend != null
          ? deliveryTimeArray[selectDeliveryTimeOfSend!].text
          : null;
      cartSelectionData[saveAddressKey] = saveAddressValueNotifier.value.toString();

      ref
          .read(cartDateSelectedStateNotifiers.notifier)
          .setCartDataSelection(cartSelectionData);
      afterPassConditions?.call();
    }
  }

  void createInstantOrder({Function? afterPassConditions}) {
    var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);

    if (formKey.currentState?.validate() == true) {
      cartSelectionData[serviceIdKey] = widget.service?.id ?? "";
      cartSelectionData[receiverPhoneNumberKey] = recipientPhoneController.text;
      cartSelectionData[receiverNameKey] = recipientNameController.text;
      cartSelectionData[cardMessageKey] = messageController.text;
      cartSelectionData[cardToKey] = messageToController.text;
      cartSelectionData[cardFromKey] = messageFromController.text;
      cartSelectionData[deliveryDateKey] =
          _selectedDate?.convertDateToString("dd MMM yyyy") ?? "";
      cartSelectionData[deliveryTimeKey] = selectDeliveryTimeOfSend != null
          ? deliveryTimeArray[selectDeliveryTimeOfSend!].text
          : null;
      ref
          .read(cartDateSelectedStateNotifiers.notifier)
          .setCartDataSelection(cartSelectionData);
      afterPassConditions?.call();
    }
  }

  void getPromoCodeDetails() {
    ref
        .read(showPromoCodeDetailsForSoftServiceStateNotifies.notifier)
        .showPromoCodeDetails(code: voucherTextController.text);
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

  void setAddressName(LatLng location) async {
    var address = await LocationHandler.getAddressFromLatLng(selectedLocation!);
    locationController.text = address;
  }

  void initCity() async {
    city = await getObject<City>(
            citySelectedKey, (json) => City.fromJson(json) ?? City()) ??
        City();
  }

  void autoFillAddress(AddressItem? addressItem) {
    if (addressItem != null) {
      codeNotifier.value = addressItem.recipientPhone?.split(" ").first ?? "";
      recipientNameController.text = addressItem.recipientName ?? "";
      recipientPhoneController.text =
          addressItem.recipientPhone?.split(" ").last ?? "";
      locationController.text = addressItem.recipientAddress ?? "";
      addressDescriptionController.text = addressItem.recipientLandmark ?? "";
      selectedLocation = LatLng(double.parse(addressItem.lat ?? "0.0"),
          double.parse(addressItem.lng ?? "0.0"));
    }
  }
}
