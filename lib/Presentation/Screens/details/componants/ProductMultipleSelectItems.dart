import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(List<String>);

class ProductMultipleSelectItems extends StatefulWidget {
  final List<ItemSelector> list;
  final OnItemSelect onItemSelect;
  List<String>? itemSelect = [];
  ProductMultipleSelectItems(
      {super.key, required this.list, required this.onItemSelect,this.itemSelect});

  @override
  State<ProductMultipleSelectItems> createState() =>
      _ProductMultipleSelectItemsState();
}

class _ProductMultipleSelectItemsState
    extends State<ProductMultipleSelectItems> {

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
          (itemIndex) => InkWell(
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
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 18,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                              Text(
                                widget.list[itemIndex].text ?? "",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts14w500,
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.list[itemIndex].widget ?? SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        if (widget.list.length - 1 != itemIndex)
                          const Align(
                              alignment: Alignment.bottomCenter,
                              child: Divider(
                                color: AppTheme.appGrey9,
                                thickness: 3,
                              ))
                        else
                          const SizedBox()
                      ]),
                ),
              )))
    ]);
  }
}
