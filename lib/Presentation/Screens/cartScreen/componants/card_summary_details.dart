import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Localization/Keys.dart';
import '../../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../details/componants/ProductRowItem.dart';

class CardSummaryDetails extends StatelessWidget {
  final CheckoutTypes? type;
  const CardSummaryDetails({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var calculateSoftService = ref.watch(calculateInstantOrderStateProvider);
      var cartInfo = type == CheckoutTypes.HartCard
          ? ref.watch(cartCalculationStateNotifies)
          : ref.watch(calculationForSoftItemStateNotifies);
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ProductRowItem(
                hasDivider: false,
                title: context.tr(orderPriceKey),
                textValue:
                "${context.tr(sarKey)} ${type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalBefore ?? 0) : calculateSoftService.data?.data?.totalBeforeDiscount ?? 0}",
                titleTextStyle: AppTheme
                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                desTextStyle: AppTheme
                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
              ),
            ),
            cartInfo.data?.data?.shippingFee != null &&
                cartInfo.data?.data?.shippingFee != 0
                ? Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0),
              child: ProductRowItem(
                hasDivider: false,
                title: context.tr(shippingFeeKey),
                textValue:
                "${context.tr(sarKey)} ${(cartInfo.data?.data?.shippingFee ?? 0)}",
                titleTextStyle: AppTheme
                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                desTextStyle: AppTheme
                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
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
                hasDivider: false,
                title: context.tr(discountKey),
                textValue:
                "${context.tr(sarKey)} ${type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.discountTotal ?? 0) : calculateSoftService.data?.data?.discount ?? 0}",
                titleTextStyle: AppTheme
                    .styleColorCode167D2DFonts14w500,
                desTextStyle: AppTheme
                    .styleColorCode167D2DFonts14w500,
              ),
            )
                : const SizedBox(),
            const Divider(
              color: AppTheme.appGrey20,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ProductRowItem(
                title: context.tr(totalPriceKey),
                textValue:
                "${context.tr(sarKey)} ${type == CheckoutTypes.HartCard ? (cartInfo.data?.data?.totalAfter ?? 0) : (calculateSoftService.data?.data?.total ?? 0)}",
                titleTextStyle: AppTheme
                    .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                desTextStyle: AppTheme
                    .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                hasDivider: false,
              ),
            ),
          ],
        ),
      );
    });
  }
}
