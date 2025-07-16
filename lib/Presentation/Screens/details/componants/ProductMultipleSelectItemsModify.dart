import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(List<String> ids, List<String> names, double totalExtraPrice);

class ProductMultipleSelectItemsModify extends StatefulWidget {
  final List<ItemSelectorV3> list;
  final OnItemSelect onItemSelect;
  List<String>? itemSelect = [];
  ProductMultipleSelectItemsModify(
      {super.key, required this.list, required this.onItemSelect,this.itemSelect});

  @override
  State<ProductMultipleSelectItemsModify> createState() =>
      _ProductMultipleSelectItemsModifyState();
}

class _ProductMultipleSelectItemsModifyState
    extends State<ProductMultipleSelectItemsModify> {
  double extraPrice = 0.0;

  List<String> listItemSelectIds = [];
  List<String> listItemSelectNames = [];

  @override
  void initState() {
    listItemSelectIds = widget.itemSelect ?? [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(List.generate(
          widget.list.length ?? 0,
          (itemIndex) => Container(
            child: InkWell(
              onTap: () => _handleSelection(widget.list[itemIndex]),
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.list[itemIndex].text ?? "",
                              style: AppTheme
                                  .styleWithTextAppGrey21AdelleSansExtendedFonts14w400,
                            ),
                            const Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.list[itemIndex].widget ?? const SizedBox()
                              ],
                            ),
                            Transform.scale(
                              scale: .8,
                              child: Checkbox(
                                visualDensity: VisualDensity(
                                  horizontal: -4,
                                ),
                                activeColor: AppTheme.mainAppColor,
                                fillColor: MaterialStateProperty.resolveWith(
                                        (states) {
                                      // active
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return AppTheme.mainAppColor;
                                      }
                                      // inactive
                                      return Colors.white;
                                    }),
                                value:
                                listItemSelectIds.contains(widget.list[itemIndex].id.toString()),
                                onChanged: (bool? value) => _handleSelection(widget.list[itemIndex]),
                              ),
                            ),
                          ],
                        ),
                      ]),
            ),
          )))
    ]);
  }
  void _handleSelection(ItemSelectorV3 item) {
    setState(() {
      final id = item.id.toString();
      final name = item.text.toString();
      final price = item.price ?? 0.0;

      if (!listItemSelectIds.contains(id)) {
        listItemSelectIds.add(id);
        listItemSelectNames.add(name);
        extraPrice += price;
      } else {
        listItemSelectIds.remove(id);
        listItemSelectNames.remove(name);
        extraPrice -= price;
      }
    });

    widget.onItemSelect.call(listItemSelectIds, listItemSelectNames,extraPrice);
  }
}
