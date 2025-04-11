import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(List<String>);

class ProductMultipleSelectItemsModify extends StatefulWidget {
  final List<ItemSelector> list;
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

  List<String> listItemSelect = [];

  @override
  void initState() {
    listItemSelect = widget.itemSelect ?? [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(List.generate(
          widget.list.length ?? 0,
          (itemIndex) => Container(
            child: InkWell(
              onTap: () {
                    print(listItemSelect.contains(widget.list[itemIndex].id.toString()).toString());
                    print(listItemSelect.toString());
                    setState(() {
                      if (!listItemSelect.contains(widget.list[itemIndex].id.toString())) {
                        listItemSelect.add(widget.list[itemIndex].id.toString());
                      } else {
                        listItemSelect.remove(widget.list[itemIndex].id.toString());
                      }
                    });
                    widget.onItemSelect.call(listItemSelect);
                  },
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
                                widget.list[itemIndex].widget ?? SizedBox()
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
                                listItemSelect.contains(widget.list[itemIndex].id.toString()),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (!listItemSelect
                                        .contains(widget.list[itemIndex].id.toString())) {
                                      listItemSelect.add(widget.list[itemIndex].id.toString());
                                    } else {
                                      listItemSelect.remove(widget.list[itemIndex].id.toString());
                                    }
                                  });
                                  widget.onItemSelect.call(listItemSelect);
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
            ),
          )))
    ]);
  }
}
