import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/cart_items_with_notes.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/componants/address_summary_cart.dart';
import 'package:lazo_client/Presentation/Screens/cartSummary/componants/payment_methods_card.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/PaymentMethod.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';

class CartSummaryScreen extends StatelessWidget {
  final CheckoutTypes? type;

  CartSummaryScreen({super.key, this.type});
  ValueNotifier<bool> expandedCardItem = ValueNotifier(false);
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(id: 'apple', name: 'Apple Pay', icon: Icons.phone_iphone),
    PaymentMethod(
        id: 'card', name: 'Debit/Credit Card', icon: Icons.credit_card),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AddressSummaryCart(
              addressItem: AddressItem(),
            ),
            Consumer(builder: (context, ref, _) {
              var cartData = ref.watch(fetchCardDetailsStateNotifies);
              return ValueListenableBuilder(
                  valueListenable: expandedCardItem,
                  builder: (context, expanded, _) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 16),
                          color: expanded
                              ? AppTheme.mainAppColorLight2
                              : Colors.white,
                          child: Row(
                            children: [
                              Text(
                                "View your order",
                                style: AppTheme
                                    .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                              ),
                              Spacer(),
                              Text(
                                "(${calculateItemInCart(cartData.data?.data?.cartItems)} Items)",
                                style: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts11w400,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SVGIcons.localSVG(
                                  expanded ? upArrowIcon : downArrowIcon,
                                  width: 24,
                                  height: 24,
                                  color: AppTheme.mainAppColorDark)
                            ],
                          ),
                        ),
                        expanded ? const CartItemsWithNotes() : const SizedBox()
                      ],
                    );
                  });
            }),
            PaymentMethodSelector(
                methods: paymentMethods, onSelected: (methodId) {}),

          ],
        ),
      ),
    );
  }

  calculateItemInCart(List<ProviderData>? cartItems) {
    return cartItems?.fold(0, (sum, store) => sum + (store.items?.length ?? 0));
  }
}
