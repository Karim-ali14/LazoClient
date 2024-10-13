import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/CartItemView.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/GiftItemView.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import '../details/componants/ProductRowItem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController voucherTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        isCenter: false,
        title: "Cart",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...(List.generate(["", "", ""].length, (index) {
                  return CartItemView(

                  );
                })),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Wrap your gift",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: GiftItemView(),
                        );
                      }),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      "Choose your gift card",
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
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: GiftItemView(),
                        );
                      }),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Save on your order",
                  style:
                      AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                SizedBox(
                  height: 24,
                ),
                AppTextField(
                  hint: "Enter Voucher code",
                  label: "Enter Voucher code",
                  textFieldBorderColor: AppTheme.appGrey3,
                  textEditingController: voucherTextController,
                  startWidget: SVGIcons.voucherIcon(),
                  endWidget: SizedBox(
                      width: 10,
                      height: 56,
                      child: Center(child: Text("submit",style: AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts14w400.copyWith(decoration: TextDecoration.underline),))),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 12),
                //   height: 56,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(1),
                //   ),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 10,
                //       ),
                //       SVGIcons.voucherIcon(),
                //       SizedBox(
                //         width: 10,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 24,
                ),
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
                          textValue: "SAR 1,200",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Shipping Fees",
                          textValue: "SAR 50",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Discount",
                          textValue: "SAR 50",
                          titleTextStyle: AppTheme
                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500
                              .copyWith(color: AppTheme.mainAppColor),
                          desTextStyle: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                              .copyWith(color: AppTheme.mainAppColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Total Price",
                          textValue: "SAR 50",
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
                    onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
