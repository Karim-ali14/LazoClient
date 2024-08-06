import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(List<int>);

class ProductMultipleSelectItems extends StatefulWidget {
  final List<ItemSelector> list;
  final OnItemSelect onItemSelect;
  const ProductMultipleSelectItems(
      {super.key, required this.list, required this.onItemSelect});

  @override
  State<ProductMultipleSelectItems> createState() =>
      _ProductMultipleSelectItemsState();
}

class _ProductMultipleSelectItemsState
    extends State<ProductMultipleSelectItems> {
  List<int> list = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(List.generate(
          widget.list.length ?? 0,
          (itemIndex) => InkWell(
                onTap: () {
                  setState(() {
                    if (!list.contains(widget.list[itemIndex].id)) {
                      list.add(widget.list[itemIndex].id);
                    } else {
                      list.remove(widget.list[itemIndex].id);
                    }
                  });
                  widget.onItemSelect.call(list);
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
                                      list.contains(widget.list[itemIndex].id),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (!list
                                          .contains(widget.list[itemIndex].id)) {
                                        list.add(widget.list[itemIndex].id);
                                      } else {
                                        list.remove(widget.list[itemIndex].id);
                                      }
                                    });
                                    widget.onItemSelect.call(list);
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
