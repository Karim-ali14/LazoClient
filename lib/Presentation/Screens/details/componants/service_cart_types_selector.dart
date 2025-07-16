import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import '../../../../Constants/Eunms.dart';
import '../../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/TextWithoutPadding.dart';
import 'ProductSingleSelectItemsModify.dart';

class ServiceCartTypesSelector extends StatefulWidget {
  final OnItemSelect onCartTypeSelect;
  final OnItemSelect onServiceLocationSelect;
  final int? initialCartTypeSelectedId;
  final int? initialServiceLocationSelectedId;

  const ServiceCartTypesSelector({
    super.key,
    required this.onCartTypeSelect,
    required this.onServiceLocationSelect,
    this.initialCartTypeSelectedId,
    this.initialServiceLocationSelectedId,
  });

  @override
  State<ServiceCartTypesSelector> createState() =>
      _ServiceCartTypesSelectorState();
}

class _ServiceCartTypesSelectorState extends State<ServiceCartTypesSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final serviceItemState = ref.watch(getServiceDetails);
      List<ItemSelectorV3> listOfCartType = [];
      List<ItemSelectorV3> listOfServiceLocation = [
        ItemSelectorV3(id: 0, text: "Inside the store"),
        ItemSelectorV3(id: 1, text: "Outside the store"),
      ];
      if (serviceItemState.state == DataState.SUCCESS) {
        listOfCartType = [
          ItemSelectorV3(id: 0, text: "Soft card"),
          ItemSelectorV3(
              id: 1,
              text: "Hard card",
              widget: TextWithoutPadding(
                "(+SAR ${serviceItemState.data?.data?.cardPrice?.toString()})",
                style: AppTheme
                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
              ),
              price: double.parse(
                  serviceItemState.data?.data?.cardPrice?.toString() ?? "0")),
        ];
      }
      return Column(
        children: [
          serviceItemState.data?.data?.cardType == ServiceTypes.both.name && widget.initialCartTypeSelectedId == null
              ? Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithoutPadding(
                          "Choose card type",
                          style: AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.appPink,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: TextWithoutPadding(
                              "Required",
                              style: AppTheme
                                  .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    IntrinsicHeight(
                      child: ProductSingleSelectItemsModify(
                        list: listOfCartType,
                        onItemSelect: widget.onCartTypeSelect,
                        itemSelectedId: widget.initialCartTypeSelectedId,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          serviceItemState.data?.data?.isServiceDeliverableOutsideStore == 1
              ? Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithoutPadding(
                          "Choose service location",
                          style: AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.appPink,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: TextWithoutPadding(
                              "Required",
                              style: AppTheme
                                  .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    IntrinsicHeight(
                      child: ProductSingleSelectItemsModify(
                        list: listOfServiceLocation,
                        onItemSelect: widget.onServiceLocationSelect,
                        itemSelectedId: widget.initialServiceLocationSelectedId,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: 8.h,
          ),
        ],
      );
    });
  }
}
