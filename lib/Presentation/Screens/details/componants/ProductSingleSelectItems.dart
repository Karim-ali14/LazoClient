import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(int);

class ProductSingleSelectItems extends StatefulWidget {
  final List<ItemSelector> list;
  final OnItemSelect onItemSelect;
  const ProductSingleSelectItems(
      {super.key, required this.list, required this.onItemSelect});

  @override
  State<ProductSingleSelectItems> createState() =>
      _ProductSingleSelectItemsState();
}

class _ProductSingleSelectItemsState
    extends State<ProductSingleSelectItems> {
  int? itemSelectedId = null;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(List.generate(
          widget.list.length ?? 0,
          (itemIndex) => InkWell(
                onTap: () {
                  setState(() {
                    itemSelectedId = widget.list[itemIndex].id;
                  });
                  if(itemSelectedId != null) {
                    widget.onItemSelect.call(itemSelectedId!);
                  }
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
                                child: Radio(
                                    value: widget.list.isNotEmpty
                                        ? widget.list[itemIndex].id
                                        : 0,
                                    groupValue: itemSelectedId,
                                    activeColor: AppTheme.mainAppColor,
                                    fillColor:
                                    MaterialStateProperty.resolveWith(
                                            (states) {
                                          // active
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return AppTheme.mainAppColor;
                                          }
                                          // inactive
                                          return AppTheme.appGrey10;
                                        }),
                                    onChanged: (value) {
                                      setState(() {
                                        itemSelectedId = value;
                                      });
                                      if(itemSelectedId != null) {
                                        widget.onItemSelect.call(itemSelectedId!);
                                      }
                                    }),
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
