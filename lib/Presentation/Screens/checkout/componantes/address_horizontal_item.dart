import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Utils/Extintions.dart';

class AddressHorizontalItem extends StatelessWidget {
  final AddressItem? addressItem;
  final bool isSelected;
  final Function(AddressItem?)? onItemPressed;
  const AddressHorizontalItem({super.key, required this.addressItem, required this.isSelected, this.onItemPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onItemPressed?.call(addressItem);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: 163.w,
        height: 84.h,
        decoration: BoxDecoration(
          color: AppTheme.appGrey29,
          border: Border.all(color: isSelected ? AppTheme.mainAppColorDark : AppTheme.appGrey19,width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${addressItem?.recipientName}, ${addressItem?.city?.name}".ellipsize(20),
              style: AppTheme.styleWithTextAppGrey18AdelleSansExtendedFonts14w500,),
            SizedBox(
              height: 8.h,
            ),
            Text(addressItem?.recipientPhone ?? "",style: AppTheme.styleWithTextGray18AdelleSansExtendedFonts12w400,),
            SizedBox(
              height: 8.h,
            ),
            Text(addressItem?.recipientAddress?.ellipsize(25) ?? "",style: AppTheme.styleWithTextGray18AdelleSansExtendedFonts12w400,),
          ],
        ),
      ),
    );
  }
}
