import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

typedef OnItemSelected = Function();

class GiftItemView extends StatelessWidget {
  final GiftItemType type;
  final GiftBox? giftBox;
  final GiftCard? giftCard;
  final OnItemSelected onItemSelected;
  final bool isSelected; // New parameter

  const GiftItemView({
    super.key,
    required this.type,
    this.giftBox,
    this.giftCard,
    required this.onItemSelected,
    required this.isSelected, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemSelected.call();
      },
      child: Container(
        width: 146.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? AppTheme.mainAppColor : AppTheme.appGrey6,
                width: 1)),
        child: Column(
          children: [
            Skeleton.replace(
              replacement: Container(
                width: double.infinity,
                height: 142.h,
                color: Colors.white,
              ),
              child: ImageView(
                width: double.infinity,
                height: 142,
                initialImg: type == GiftItemType.Card
                    ? "${giftCard?.imagePath}"
                    : "${giftBox?.imagePath}"
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 130.w,
                      child: Text(
                        type == GiftItemType.Card
                            ? giftCard?.name ?? ""
                            : giftBox?.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400,
                      )),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    type == GiftItemType.Card
                        ? "${context.tr(sarKey)} ${giftCard?.price}"
                        : giftBox?.price == 0 ? "Free" : "(+ ${context.tr(sarKey)} ${giftBox?.price})",
                    style: AppTheme
                        .styleWithTextRedAdelleSansExtendedFonts16w500.copyWith(
                      color: giftBox?.price == 0 ? AppTheme.mainAppColorDark : AppTheme.appGrey26,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






