import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/custom_ui.dart';
import 'package:hyperpay_plugin/model/custom_ui_stc.dart';
import 'package:hyperpay_plugin/model/ready_ui.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/custom_stepper/stepper_indicator.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/cart_summary.dart';
import 'package:lazo_client/Presentation/Screens/checkout/CheckoutScreen.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/TextPrice.dart';
import 'dart:developer';
import '../../../Constants.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/TextWithoutPadding.dart';
import 'package:http/http.dart' as http;

class OrderProcessScreen extends ConsumerStatefulWidget {
  final int? initCurrentPage;
  final CheckoutTypes? type;
  final ServiceShowData? service;
  final String? serviceSelectedListIds;
  final String? serviceSelectedListItemsIds;

  const OrderProcessScreen({
    super.key,
    required this.initCurrentPage,
    this.type,
    this.service,
    this.serviceSelectedListIds,
    this.serviceSelectedListItemsIds,
  });

  @override
  ConsumerState<OrderProcessScreen> createState() => _OrderProcessScreenState();
}

class _OrderProcessScreenState extends ConsumerState<OrderProcessScreen> {
  late FlutterHyperPay flutterHyperPay;

  List<String> steps = ['Customize', 'Delivery', 'Payment'];
  List<Widget> screens = [
    const CartScreen(),
    const CheckoutScreen(
      withInStepper: true,
    ),
    CartSummaryScreen(changeAddressAction: (){}),
  ];
  final PageController _pageController = PageController();
  final List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    flutterHyperPay = FlutterHyperPay(
      shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
      paymentMode: PaymentMode.test, // test | live
      lang: InAppPaymentSetting.getLang(),
    );
    if (widget.type == CheckoutTypes.SoftCard) {
      steps = ['Delivery', 'Payment'];
      screens = [
        CheckoutScreen(
          key: _keys[1],
          type: widget.type,
          service: widget.service,
          serviceSelectedListIds: widget.serviceSelectedListIds,
          serviceSelectedListItemsIds: widget.serviceSelectedListItemsIds,
          withInStepper: true,
        ),
        CartSummaryScreen(
          type: widget.type,
          service: widget.service,
          serviceSelectedListIds: widget.serviceSelectedListIds,
          serviceSelectedListItemsIds: widget.serviceSelectedListItemsIds,
          key: _keys[2],
          changeAddressAction: (){
            print("object");
            context.pop();
          },
        ),
      ];
    } else {
      screens = [
        CartScreen(key: _keys[0]),
        CheckoutScreen(
          key: _keys[1],
          type: widget.type,
          withInStepper: true,
        ),
        CartSummaryScreen(
          type: widget.type,
          key: _keys[2], changeAddressAction: (){

          print("object");
          navigateToPage(--_currentPage);
        },
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    var cartInfo = ref.watch(cartCalculationStateNotifies);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: _currentPage == 0
            ? "Cart"
            : _currentPage == 1
            ? "Checkout"
            : "Summary",
        isCenter: false,
        navigated: true,
        customCallBack: () {
          print("object");
          if (_currentPage != 0) {
            navigateToPage(--_currentPage);
          } else {
            context.pop();
          }
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.type == CheckoutTypes.HartCard
                      ? Container(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 16),
                    child: StepperIndicator(currentStep: _currentPage ?? 0, steps: steps),
                  )
                      : const SizedBox(),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: MediaQuery.of(context).size.height - (widget.type == CheckoutTypes.HartCard ? 270.h : 0.h),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),  // Disable user swipe
                      controller: _pageController,
                      children: screens,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer(builder: (context,ref,_){
              var cartData = ref.watch(fetchCardDetailsStateNotifies);
              return cartData.data?.data?.cartItems.isNotEmpty == true || widget.type == CheckoutTypes.SoftCard ?
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -1),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWithoutPadding(
                            widget.type == CheckoutTypes.HartCard
                                ? "${cartData.data?.data?.cartItems.length ?? 0} items"
                                : "1 Item",
                            style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                          ),
                          TextPrice(
                            "${widget.type == CheckoutTypes.HartCard ? cartInfo.data?.data?.totalAfter ?? 0 : widget.service?.priceAfterDiscount ?? 0}",
                            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w500,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 26),
                    Expanded(
                      child: AppButton(
                        onPress: () {
                          if (_currentPage == 0 && widget.type == CheckoutTypes.HartCard) {
                            (_keys[0].currentState as CartScreenState).actionClick(afterPassConditions: () {
                              navigateToPage(++_currentPage);
                            }, onCannotPassConditions: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: TextWithoutPadding("Please select a gift box"),
                              ));
                            });
                          } else if (_currentPage == 1 || (_currentPage == 0 && widget.type == CheckoutTypes.SoftCard)) {
                            (_keys[1].currentState as CheckoutScreenState).continueToPayment(afterPassConditions: () {
                              navigateToPage(++_currentPage);
                            });
                          } else if (_currentPage == 2 || (_currentPage == 1 && widget.type == CheckoutTypes.SoftCard)) {
                            (_keys[2].currentState as CartSummaryScreenState).createOrder();
                          }
                        },
                        text: _currentPage == 0
                            ? "Continue to Delivery"
                            : _currentPage == 1
                            ? "Continue to Payment"
                            : "Complete Payment",
                        height: 48,
                        backColor: AppTheme.mainAppColorDark,
                      ),
                    ),
                  ],
                ),
              ):const SizedBox();
            }),
          ),
        ],
      ),
    );
  }

  void navigateToPaymentScreen(String paymentLink) async {
    var success = await context.push(R_PaymentScreen, extra: {"paymentLink": paymentLink});
    if (success == true) {
      context.pop(true);
    }
  }

  void navigateToPage(int page) {
    setState(() {
      _currentPage = page;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  /*void paymentOrder(String checkoutId) {
    _payWithReadyUI(checkoutId);
  }

  Future<void> _payWithReadyUI(String checkId) async {
    print("checkouitd: $checkId");
    final checkoutId = checkId;
    print(checkoutId);
    final paymentResult = await flutterHyperPay.readyUICards(
      readyUI: ReadyUI(
        brandsName: ["VISA", "MASTER", "MADA", "STC_PAY", "APPLEPAY"],
        checkoutId: checkoutId,
        merchantIdApplePayIOS: InAppPaymentSetting.merchantId,
        countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
        companyNameApplePayIOS: "Test Co",
        themColorHexIOS: "#000000",
        setStorePaymentDetailsMode: true,
      ),
    );

    _handleResult(paymentResult);
  }

  Future<void> _payWithCustomUI(String checkoutId) async {

    final paymentResult = await flutterHyperPay.customUICards(
      customUI: CustomUI(
        brandName: "MADA",
        checkoutId: checkoutId,
        cardNumber: "5212345678901234", // test card
        holderName: "test",
        month: "01",
        year: "2026",
        cvv: "123",
        enabledTokenization: false,
      ),
    );

    _handleResult(paymentResult);
  }

  Future<void> _payWithSTCPay() async {
    final checkoutId = "5056AD0F4072A534909F748CE476660A.uat01-vm-tx04";

    final paymentResult = await flutterHyperPay.customUISTC(
      customUISTC: CustomUISTC(
        checkoutId: checkoutId,
        phoneNumber: "0588987147", // test phone
      ),
    );

    _handleResult(paymentResult);
  }

  void _handleResult(PaymentResultData result) {
    print("errorMessage: ${result.errorString}");
    print("errorMessage: ${result.paymentResult.name}");
    if (result.paymentResult == PaymentResult.success ||
        result.paymentResult == PaymentResult.sync) {
      print("✅ Payment Success");
      // context.pop();

    } else if (result.paymentResult == PaymentResult.error) {
      print("❌ Payment Failed");
    } else {
      print("⚠️Payment Canceled/Unknown");
    }
  }*/
}