import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Screens/checkout/componantes/address_horizontal_item.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/AddressStateNotifiers.dart';
import '../../../../Constants/Constants.dart';
import '../../../Theme/AppTheme.dart';

class SavedRecipientsAddresses extends ConsumerStatefulWidget {
  final Function(AddressItem?) onItemPressed;
  const SavedRecipientsAddresses( {super.key,required this.onItemPressed,});

  @override
  ConsumerState<SavedRecipientsAddresses> createState() =>
      _SavedRecipientsAddressesState();
}

class _SavedRecipientsAddressesState
    extends ConsumerState<SavedRecipientsAddresses> {
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    final addressItem = ref.watch(fetchAddressForCheckoutStateNotifiers);
    print("asfasdfasdfsd ${addressItem.data?.data.length}");
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.appGrey28, borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.all(defaultPaddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saved recipients addresses",
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: addressItem.data?.data.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AddressHorizontalItem(
                    addressItem: addressItem.data?.data[index],
                    isSelected: isSelected == index,onItemPressed: (address){
                      widget.onItemPressed.call(address);
                  setState(() {
                    isSelected = index;
                  });
                },);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8.w);
              },
            ),
          )
        ],
      ),
    );
  }
}
