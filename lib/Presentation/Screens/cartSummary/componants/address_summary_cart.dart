import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../../../Constants/Assets.dart';

class AddressSummaryCart extends StatelessWidget {
  final AddressItem addressItem;
  const AddressSummaryCart({super.key, required this.addressItem});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 130.h,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: CupertinoColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Address",
            style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts16w500,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 62.h,
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 9),
            decoration: BoxDecoration(
              color: AppTheme.appGrey28,
              borderRadius: BorderRadius.circular(1),
            ),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SVGIcons.localSVG(markerIcons, width: 16.w, height: 19.h),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressItem.recipientAddress?.ellipsize(50) ?? "",
                      style: AppTheme
                          .styleWithTextGray18AdelleSansExtendedFonts12w400,
                    ),
                    const Spacer(),
                    Text(addressItem.city?.name ?? "",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,)
                  ],
                ),
                const Spacer(),
                const Text("Change",style: AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts12w400,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
