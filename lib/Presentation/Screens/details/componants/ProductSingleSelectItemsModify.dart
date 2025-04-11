import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductRowItem.dart';

import '../../../../Data/Models/ItemSelector.dart';
import '../../../Theme/AppTheme.dart';

typedef OnItemSelect = Function(ItemSelector?,int);

class ProductSingleSelectItemsModify extends StatefulWidget {
  final List<ItemSelector> list;
  final OnItemSelect onItemSelect;
  final int? itemSelectedId;
  const ProductSingleSelectItemsModify(
      {super.key, required this.list, required this.onItemSelect,this.itemSelectedId});

  @override
  State<ProductSingleSelectItemsModify> createState() =>
      _ProductSingleSelectItemsModifyState();
}

class _ProductSingleSelectItemsModifyState
    extends State<ProductSingleSelectItemsModify> {

  int? itemSelectedId = null;
  @override
  void initState() {
    itemSelectedId = widget.itemSelectedId;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(List.generate(
          widget.list.length ?? 0,
          (itemIndex) => InkWell(
                onTap: () {
                  setState(() {
                    if(itemSelectedId == null) {
                      itemSelectedId = widget.list[itemIndex].id;
                    }else if(itemSelectedId != null && itemSelectedId != widget.list[itemIndex].id){
                      itemSelectedId = widget.list[itemIndex].id;
                    }else{
                      itemSelectedId = null;
                    }
                  });
                  if(itemSelectedId != null) {
                    widget.onItemSelect.call(widget.list[itemIndex],widget.list[itemIndex].id);
                  }else{
                    widget.onItemSelect.call(null,widget.list[itemIndex].id);
                  }
                },
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
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
                              scale: 1,
                              child: Radio(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact, // Makes it tighter

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
                                        return AppTheme.appGrey18;
                                      }),
                                  onChanged: (value) {
                                    setState(() {
                                      if(itemSelectedId == null) {
                                        itemSelectedId = widget.list[itemIndex].id;
                                      }else if(itemSelectedId != null && itemSelectedId != widget.list[itemIndex].id){
                                        itemSelectedId = widget.list[itemIndex].id;
                                      }else{
                                        itemSelectedId = null;
                                      }
                                    });
                                    if(itemSelectedId != null) {
                                      widget.onItemSelect.call(widget.list[itemIndex],widget.list[itemIndex].id);
                                    }else{
                                      widget.onItemSelect.call(null,widget.list[itemIndex].id);
                                    }
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ]),
                ),
              )))
    ]);
  }
}
