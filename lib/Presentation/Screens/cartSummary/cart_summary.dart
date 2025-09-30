import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/cart_items_with_notes.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/componants/address_summary_cart.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/componants/payment_methods_card.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/PaymentMethod.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/LocationHandler.dart';
import '../../../Utils/Snaks.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/TextWithoutPadding.dart';
import '../cartScreen/componants/card_summary_details.dart';
import '../cartScreen/componants/service_info_view.dart';

class CartSummaryScreen extends ConsumerStatefulWidget {
  final CheckoutTypes? type;
  final ServiceShowData? service;
  final String? serviceSelectedListIds;
  final String? serviceSelectedListItemsIds;
  final Function changeAddressAction;
  // final Function(String) afterCreateOrderAction;
  const CartSummaryScreen(  {
    super.key,
    this.type,
    this.service,
    this.serviceSelectedListIds,
    this.serviceSelectedListItemsIds, required this.changeAddressAction,
  });

  @override
  ConsumerState<CartSummaryScreen> createState() => CartSummaryScreenState();
}

class CartSummaryScreenState extends ConsumerState<CartSummaryScreen> {
  ValueNotifier<bool> expandedCardItem = ValueNotifier(false);
  PaymentMethod? paymentMethodSelected;
  // late FlutterHyperPay flutterHyperPay;
  static const platform = const MethodChannel('Hyperpay.demo.fultter/channel');

  String? address, cityName;
  @override
  void initState() {
    // flutterHyperPay = FlutterHyperPay(
    //   shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
    //   paymentMode: PaymentMode.test, // test | live
    //   lang: InAppPaymentSetting.getLang(),
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);

      List<String>? parts =
          (cartSelectionData[cartLatLngKey] as String?)?.split(',');
      double? latitude = double.tryParse(parts?[0].trim() ?? "");
      double? longitude = double.tryParse(parts?[1].trim() ?? "");

      print("$latitude, $longitude");
      if (longitude != null && latitude != null) {
        initAddress(latitude, longitude);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var calculateSoftService = ref.watch(calculateInstantOrderStateProvider);
    var cartSelectionData = ref.watch(cartDateSelectedStateNotifiers);

    handleState(createOrderStateNotifiers, showLoading: true, showToast: true, onSuccess: (res) {
      print("create order Response payment link : ${res.data?.data?.checkoutId}");
      ref.watch(fetchCardDetailsStateNotifies);
      if (res.data?.data?.checkoutId != null) {
        // navigateToPaymentScreen(res.data?.data?.paymentLink ?? "");
        payWithReadyUI(res.data?.data?.checkoutId ?? "");
      } else {
        context.pop(true);
      }
    });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
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
                          selectedServicesListItemsNames: cartSelectionData[
                                      serviceSelectedListItemsNamesKey]
                                  ?.toString() ??
                              "",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        address?.isNotEmpty == true && cityName?.isNotEmpty == true ? AddressSummaryCart(
                          addressItem: AddressItem(
                            recipientAddress: address,
                            city: AddressItemCity(name: cityName),
                          ), changeAddressAction: widget.changeAddressAction,
                        ):const SizedBox(),
                        Consumer(builder: (context, ref, _) {
                          var cartData =
                              ref.watch(fetchCardDetailsStateNotifies);
                          return ValueListenableBuilder(
                              valueListenable: expandedCardItem,
                              builder: (context, expanded, _) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        expandedCardItem.value = !expanded;
                                      },
                                      child: Container(
                                        padding: const EdgeInsetsDirectional
                                            .symmetric(
                                            horizontal: 16, vertical: 20),
                                        color: expanded
                                            ? AppTheme.mainAppColorLight2
                                            : Colors.white,
                                        child: Row(
                                          children: [
                                            TextWithoutPadding(
                                              "View your order",
                                              style: AppTheme
                                                  .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                                            ),
                                            Spacer(),
                                            TextWithoutPadding(
                                              "(${calculateItemInCart(cartData.data?.data?.cartItems)} Items)",
                                              style: AppTheme
                                                  .styleWithTextBlack2AdelleSansExtendedFonts11w400,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SVGIcons.localSVG(
                                                expanded
                                                    ? upArrowIcon
                                                    : downArrowIcon,
                                                width: 24,
                                                height: 24,
                                                color:
                                                    AppTheme.mainAppColorDark)
                                          ],
                                        ),
                                      ),
                                    ),
                                    expanded
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: const CartItemsWithNotes(
                                              isReadOnlyMode: true,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                );
                              });
                        }),
                      ],
                    ),
              PaymentMethodSelector(
                  methods: getPaymentMethods(), onSelected: (methodSelected) {
                    paymentMethodSelected = methodSelected;
              }),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CardSummaryDetails(
                  type: widget.type,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PaymentMethod> getPaymentMethods() {
    List<PaymentMethod> methods = [];

    if (Platform.isIOS) {
      methods.add(PaymentMethod(
          id: 'APPLEPAY', name: 'Apple Pay', icon: Icons.phone_iphone));
    }

    methods.addAll([
      PaymentMethod(id: 'VISA', name: 'Debit/Credit Card', icon: Icons.credit_card),
      PaymentMethod(id: 'STC_PAY', name: 'STC', icon: Icons.credit_card),
    ]);

    return methods;
  }

  Future<void> payWithReadyUI(String checkId) async {

    String transactionStatus;
    try {
      final String result = await platform.invokeMethod('gethyperpayresponse',
          {"type": "ReadyUI", "mode": "TEST", "checkoutid": checkId,"brand": "VISA",
          });
      transactionStatus = '$result';
    } on PlatformException catch (e) {
      transactionStatus = "${e.message}";
    }

    if (transactionStatus != null ||
        transactionStatus == "success" ||
        transactionStatus == "SYNC") {
      print(transactionStatus);
      // getpaymentstatus();
    } else {
      // setState(() {
      //   _resultText = transactionStatus;
      // });
    }

    // final checkoutId = checkId;
    //
    // List<String> methods = [];
    // if(paymentMethodSelected?.id == "VISA"){
    //   methods = ["VISA", "MASTER", "MADA"];
    // }else{
    //   methods = [paymentMethodSelected?.id ?? ""];
    // }
    // final paymentResult = await flutterHyperPay.readyUICards(
    //   readyUI: ReadyUI(
    //     brandsName: methods,
    //     checkoutId: checkoutId,
    //     merchantIdApplePayIOS: InAppPaymentSetting.merchantId,
    //     countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
    //     companyNameApplePayIOS: "Test Co",
    //     setStorePaymentDetailsMode: true,
    //   ),
    // );
    //
    // _handleResult();
  }

  void _handleResult() {
    // if (result.paymentResult == PaymentResult.success ||
    //     result.paymentResult == PaymentResult.sync) {
    //   AppSnackBar.showSnackBar(context, isSuccess: true, message: "✅ Payment Success");
    //   context.pop(true);
    // } else if (result.paymentResult == PaymentResult.error) {
    //   AppSnackBar.showSnackBar(context, isSuccess: false,message:  "❌ Payment Failed");
    // } else {
    //   AppSnackBar.showSnackBar(context, isSuccess: false,message:  "⚠️ Payment Canceled/Unknown");
    // }
  }

  calculateItemInCart(List<ProviderData>? cartItems) {
    return cartItems?.fold(0, (sum, store) => sum + (store.items?.length ?? 0));
  }

  void initAddress(double latitude, double longitude) async {
    var map = await LocationHandler.getAddressInfo(
      latitude,
      longitude,
    );
    setState(() {
      address = map?.values.first ?? "";
      cityName = map?.keys.first ?? "";
    });
  }

  void createInstantOrder() {
    var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);

    ref.read(createOrderStateNotifiers.notifier).createInstantOrder(
        serviceId: cartSelectionData.containsKey(serviceIdKey)
            ? cartSelectionData[serviceIdKey].toString()
            : null,
        serviceSelectedListItemsIds:
            cartSelectionData.containsKey(serviceSelectedListItemsIdsKey)
                ? cartSelectionData[serviceSelectedListItemsIdsKey].toString()
                : null,
        serviceSelectedListIds:
            cartSelectionData.containsKey(serviceSelectedListIdsKey)
                ? cartSelectionData[serviceSelectedListIdsKey].toString()
                : null,
        promocode: cartSelectionData.containsKey(promocodeKey)
            ? cartSelectionData[promocodeKey].toString()
            : null,
        serviceQuantity: "1",
        paymentMethod:paymentMethodSelected?.name,
        receiverPhoneNumber:
            cartSelectionData.containsKey(receiverPhoneNumberKey)
                ? cartSelectionData[receiverPhoneNumberKey].toString()
                : null,
        receiverName: cartSelectionData.containsKey(receiverNameKey)
            ? cartSelectionData[receiverNameKey].toString()
            : null,
        cardMessage: cartSelectionData.containsKey(cardMessageKey)
            ? cartSelectionData[cardMessageKey].toString()
            : null,
        cardFrom: cartSelectionData.containsKey(cardFromKey)
            ? cartSelectionData[cardFromKey].toString()
            : null,
        cardTo: cartSelectionData.containsKey(cardToKey)
            ? cartSelectionData[cardToKey].toString()
            : null,
        deliveryDate: cartSelectionData.containsKey(deliveryDateKey)
            ? cartSelectionData[deliveryDateKey].toString()
            : null,
        deliveryTime: cartSelectionData.containsKey(deliveryTimeKey)
            ? cartSelectionData[deliveryTimeKey].toString()
            : null,isOutsideDelivery: cartSelectionData.containsKey(isOutSideKey) ? int.parse(cartSelectionData[isOutSideKey]?.toString() ?? "0") : null);

    print("${cartSelectionData.containsKey(promocodeKey)}");
  }

  void createOrderHardType() {
    var cartSelectionData = ref.read(cartDateSelectedStateNotifiers);

    ref.read(createOrderStateNotifiers.notifier)
        .createOrder(
        isIdentitySecret: bool.parse(
                    cartSelectionData[enableIsSecretKey]?.toString() ??
                        "false") ==
                true
            ? "1"
            : "0",
        giftBoxId: cartSelectionData.containsKey(giftBoxIdKey)
            ? cartSelectionData[giftBoxIdKey].toString()
            : null,
        giftCardId: cartSelectionData.containsKey(giftCardIdKey)
            ? cartSelectionData[giftCardIdKey].toString()
            : null,
        orderType:
            int.parse((cartSelectionData[selectTypeOfSendKey] ?? "0").toString()) ==
                    0
                ? OrderTypes.self_order.name.toString()
                : OrderTypes.receiver_order.name.toString(),
        paymentMethod: paymentMethodSelected?.name,
        promocode: cartSelectionData.containsKey(promocodeKey)
            ? cartSelectionData[promocodeKey].toString()
            : null,
        latLng: cartSelectionData[cartLatLngKey].toString(),
        receiverName: cartSelectionData[receiverNameKey].toString(),
        receiverAddress: cartSelectionData[receiverAddressKey].toString(),
        receiverAddressDetails:
            cartSelectionData[receiverAddressDetailsKey].toString(),
        receiverPhone: cartSelectionData[receiverPhoneKey].toString(),
        deliveryDate: cartSelectionData[deliveryDateKey]?.toString(),
        deliveryTime: cartSelectionData[deliveryTimeKey]?.toString(),
        saveAddress: bool.parse(
            cartSelectionData[saveAddressKey]?.toString() ?? "false"));
  }

  void createOrder() {
    if(paymentMethodSelected != null) {
      if (widget.type == CheckoutTypes.HartCard) {
        createOrderHardType();
      } else if (widget.type == CheckoutTypes.SoftCard) {
        createInstantOrder();
      }
    }else{
      AppSnackBar.showSnackBar(context, isSuccess: false, message:"Select payment method");
    }
  }

  @override
  void dispose() {
    resetCartSelectionData();
    super.dispose();
  }

  void resetCartSelectionData() {
    ref.read(cartDateSelectedStateNotifiers.notifier).setCartDataSelection({});
  }
}
