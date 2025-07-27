import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/custom_stepper/stepper_indicator.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/cart_summary.dart';
import 'package:lazo_client/Presentation/Screens/checkout/CheckoutScreen.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/TextPrice.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/TextWithoutPadding.dart';

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
  List<String> steps = ['Customize', 'Delivery', 'Payment'];
  List<Widget> screens = [
    const CartScreen(),
    const CheckoutScreen(
      withInStepper: true,
    ),
    CartSummaryScreen(changeAddressAction: (){},),
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

    handleState(createOrderStateNotifiers, showLoading: true, showToast: true, onSuccess: (res) {
      print("create order Response payment link : ${res.data?.data?.paymentLink}");
      ref.watch(fetchCardDetailsStateNotifies);
      if (res.data?.data?.paymentLink != null) {
        navigateToPaymentScreen(res.data?.data?.paymentLink ?? "");
      } else {
        context.pop(true);
      }
    });

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
          Expanded(
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
          Consumer(builder: (context,ref,_){
            var cartData = ref.watch(fetchCardDetailsStateNotifies);
            return cartData.data?.data?.cartItems.isNotEmpty == true || widget.type == CheckoutTypes.SoftCard ? Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
              ),
            ):const SizedBox();
          }),
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
}