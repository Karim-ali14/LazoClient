import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../../../Constants/Assets.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/TextWithoutPadding.dart';

class AddressCard extends StatefulWidget {
  final AddressItem? addressItem;
  final Function(AddressItem) onEditClicked;
  final Function(AddressItem) onDeleteClicked;
  const AddressCard({super.key, required this.addressItem, required this.onEditClicked, required this.onDeleteClicked});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppTheme.appGrey19)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWithoutPadding(
                "${widget.addressItem?.recipientName},${widget.addressItem?.city?.name}",
                style:
                    AppTheme.styleWithTextBlack2AdelleSansExtendedFonts16w500,
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  widget.onEditClicked.call(widget.addressItem!);
                },
                child: Row(
                  children: [
                    SVGIcons.localSVG(editAddressIcons, width: 11, height: 11),
                    SizedBox(width: 3,),
                    TextWithoutPadding("Edit",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,)
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  widget.onDeleteClicked.call(widget.addressItem!);
                },
                child: Row(
                  children: [
                    SVGIcons.localSVG(deleteAddressIcons, width: 11, height: 11),
                    SizedBox(width: 3,),
                    TextWithoutPadding("Delete",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextWithoutPadding(widget.addressItem?.recipientAddress ?? "",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,),
          SizedBox(
            height: 8,
          ),
          TextWithoutPadding("Name : ${widget.addressItem?.recipientName ?? ""}",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,),
          SizedBox(
            height: 8,
          ),
          TextWithoutPadding("Phone : ${widget.addressItem?.recipientPhone ?? ""}",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,),

        ],
      ),
    );
  }
}
