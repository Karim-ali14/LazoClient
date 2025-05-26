import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/custom_stepper/stepper_indicator.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/cart_summary.dart';
import 'package:lazo_client/Presentation/Screens/checkout/CheckoutScreen.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';

import '../../../Constants/Eunms.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Widgets/AppButton.dart';

class OrderProcessScreen extends ConsumerStatefulWidget {
  final int? initCurrentPage;
  const OrderProcessScreen({super.key, required this.initCurrentPage});

  @override
  ConsumerState<OrderProcessScreen> createState() => _OrderProcessScreenState();
}

class _OrderProcessScreenState extends ConsumerState<OrderProcessScreen> {
  final steps = ['Customize', 'Delivery', 'Payment'];
  final screens = [
    const CartScreen(),
    const CheckoutScreen(
      withInStepper: true,
    ),
    CartSummaryScreen()
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
  }

  @override
  Widget build(BuildContext context) {
    var cartData = ref.watch(fetchCardDetailsStateNotifies);
    var cartInfo = ref.watch(cartCalculationStateNotifies);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Cart",
        isCenter: false,
        navigated: true,
      ),
      body: Stack(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 20, horizontal: 16),
                  child: StepperIndicator(
                    currentStep: _currentPage ?? 0,
                    steps: steps,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: MediaQuery.of(context).size.height - 270.h,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      CartScreen(
                        key: _keys[0],
                      ),
                      CheckoutScreen(
                        key: _keys[1],
                        withInStepper: true,
                      ),
                      CartSummaryScreen(
                        key: _keys[2],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    offset: const Offset(0, -1), // Negative Y for top shadow
                    blurRadius: 6, // How soft the shadow is
                    spreadRadius: 0, // Optional: how much it spreads
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
                        Text(
                          "SAR ${cartInfo.data?.data?.totalAfter}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts18w500,
                        ),
                        Text(
                          "${cartData.data?.data?.cartItems.length} items",
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Expanded(
                    child: AppButton(
                      onPress: () {
                        if (_currentPage == 0) {
                          (_keys[0].currentState as CartScreenState)
                              .actionClick(afterPassConditions: () {
                            setState(() {
                              _currentPage = (_currentPage ?? 0) + 1;
                              _pageController.animateToPage(
                                _currentPage, // رقم الصفحة (مثلاً الصفحة 3)
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          }, onCannotPassConditions: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Please select a gift box",
                              ),
                            ));
                          });
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
          )
        ],
      ),
    );
  }

  void cartClick() {}
}
