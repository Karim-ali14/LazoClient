import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Constants/Constants.dart';
import '../../Data/Models/ItemSelector.dart';
import '../StateNotifiersViewModel/SearchBottomSheetStateNotifier.dart';
import '../Theme/AppTheme.dart';
import 'SvgIcons.dart';

typedef OnSelectItemCallback = void Function(int);
typedef OnSelectMultiItemsCallback = void Function(List<int>);

class CustomSelector extends ConsumerStatefulWidget {
  final bool? enableSearch;
  final String? title;
  final String? searchHint;
  final List<ItemSelector> widgetList;
  List<ItemSelector> filterWidgetList = [];
  String searchValue = "";
  int? itemSelectedId;
  List<int>? itemSelectedIds;
  final bool isSingleSelect;
  final OnSelectItemCallback onSelectItemCallback;
  final OnSelectMultiItemsCallback onSelectMultiItemsCallback;

  CustomSelector(
      {super.key,
        this.enableSearch,
        this.title,
        required this.widgetList,
        this.searchHint,
        this.itemSelectedId,
        this.itemSelectedIds,
        required this.isSingleSelect,
        required this.onSelectMultiItemsCallback,
        required this.onSelectItemCallback});

  @override
  ConsumerState createState() => _CustomSelectorBottomSheetState();
}

class _CustomSelectorBottomSheetState
    extends ConsumerState<CustomSelector> {
  final TextEditingController textEditingController = TextEditingController();
  double itemHeight = 0;
  List<int>? multiItemsSelectedIds = [];
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.itemSelectedIds?.isNotEmpty == true){
        widget.widgetList.forEach((item) => item.isChecked = widget.itemSelectedIds?.any((id) {
          if(id == item.id){
            multiItemsSelectedIds?.add(id);
          }
          return id == item.id;
        }));
      }else{
        widget.widgetList.forEach((item) => item.isChecked = (widget.itemSelectedId == item.id));
      }
    // });
    super.initState();
  }

  double calculateListHeight(List<ItemSelector> list) {
    // if (itemHeight == 0) return 0; // في البداية قبل القياس
    int rows = list.length; // كل عنصر في صف مستقل
    double totalHeight = (rows * 64);
    print("sdfasfsdf $totalHeight");
    return totalHeight;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: calculateListHeight(widget.widgetList),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.isSingleSelect == true)
            ...(List.generate(widget.widgetList.length, (index) =>
                GestureDetector(
                  onTap: () {
                    setState(() {
                    widget.itemSelectedId = widget.widgetList[index].id;
                    widget.onSelectItemCallback.call(widget.widgetList[index].id);
                    });
                  },
                  child:
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                        children: [
                                widget.widgetList[index].widget ?? const SizedBox(),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: defaultPaddingHorizontal),
                                  child: Expanded(
                                      child: Text(
                      widget.widgetList[index].text,
                      style: widget.itemSelectedId ==
                          widget.widgetList[index].id
                          ? AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w500
                          : AppTheme
                          .styleWithTextGray7AdelleSansExtendedFonts16w400,
                                      )),
                                ),
                                Spacer(),
                                Transform.scale(
                                  scale: 1.2,
                                  child: Radio(
                                      value: widget.widgetList.isNotEmpty
                        ? widget.widgetList[index].id
                        : 0,
                                      groupValue: widget.itemSelectedId,
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
                        widget.itemSelectedId = value;
                        widget.onSelectItemCallback.call(widget.widgetList[index].id);
                      });
                                      }),
                                ),
                        ],
                        ),
                      ),
                      index != widget.widgetList.length -1 ?
                      const Divider(color: AppTheme.appGrey3)
                          :const SizedBox()
                    ],
                  ),
                )))
          else ...(List.generate(widget.widgetList.length, (index) => GestureDetector(
            onTap: () {
              setState(() {
                handleSelectItems(index);
              });
            },
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsetsDirectional.only(start: defaultPaddingHorizontal,end: 10),
                  child: Row(
                    children: [
                      widget.widgetList[index].widget ?? const SizedBox(),const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Text(widget.widgetList[index].text,
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts16w500)),
                      Spacer(),
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                            visualDensity: VisualDensity(horizontal: -4,),
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
                                  return Colors.white;
                                }),
                            onChanged: (value) {
                              setState(() {
                                // widget.widgetList[index].isChecked = value;
                                handleSelectItems(index);
                              });
                            },
                            value: widget.widgetList.isNotEmpty
                                ? widget.widgetList[index].isChecked
                                : false),
                      ),
                    ],
                  ),
                ),
                index != widget.widgetList.length -1 ?
                const Divider(color: AppTheme.appGrey3)
                    :const SizedBox()
              ],
            ),
          ))),
        ],
      ),
    );
  }

  void handleSelectItems(int index) {
    if(multiItemsSelectedIds?.contains(widget.widgetList[index].id) == true) {
      multiItemsSelectedIds?.remove(widget.widgetList[index].id);
    } else {
      multiItemsSelectedIds?.add(widget.widgetList[index].id);
    }
    widget.widgetList[index].isChecked =
    !(widget.widgetList[index].isChecked ?? false);
    widget.onSelectMultiItemsCallback.call(multiItemsSelectedIds??[]);
  }

}
