import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        height: 200,
        width: 146,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? AppTheme.mainAppColor : AppTheme.appGrey6,
                width: 1)),
        child: Stack(children: [
          Column(
            children: [
              ImageView(
                width: double.infinity,
                height: 142,
                initialImg: type == GiftItemType.Card
                    ? giftCard?.imagePath
                    : giftBox?.imagePath,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 130,
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
                      height: 7,
                    ),
                    Text(
                      type == GiftItemType.Card
                          ? "SAR ${giftCard?.price}"
                          : "SAR ${giftBox?.price}",
                      style: AppTheme
                          .styleWithTextRedAdelleSansExtendedFonts16w500,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 33,
            height: 30,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Radio(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (value) {
                    onItemSelected.call();
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}






