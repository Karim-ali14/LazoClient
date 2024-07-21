import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Data/Models/ItemSelector.dart';
import '../../../StateNotifiersViewModel/SearchBottomSheetStateNotifier.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/SvgIcons.dart';

typedef OnSelectItemCallback = void Function(int);
typedef OnSelectMultiItemsCallback = void Function(List<int>);

class CustomSelectorBottomSheet extends ConsumerStatefulWidget {
  final BuildContext context;
  final String btuName;
  final bool? enableSearch;
  final String? title;
  final String? searchHint;
  final List<ItemSelector> widgetList;
  List<ItemSelector> filterWidgetList = [];
  String searchValue = "";
  int? itemSelectedId;
  final bool isSingleSelect;
  final OnSelectItemCallback onSelectItemCallback;
  final OnSelectMultiItemsCallback onSelectMultiItemsCallback;

  CustomSelectorBottomSheet(
      {super.key,
      required this.context,
      this.enableSearch,
      this.title,required this.btuName,
      required this.widgetList,
      this.searchHint,
      this.itemSelectedId,
      required this.isSingleSelect,
      required this.onSelectMultiItemsCallback,
      required this.onSelectItemCallback});

  @override
  ConsumerState createState() => _CustomSelectorBottomSheetState();
}

class _CustomSelectorBottomSheetState
    extends ConsumerState<CustomSelectorBottomSheet> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(searchFilterStateNotifier.notifier)
          .updateList(widget.widgetList);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = ref.watch(searchFilterStateNotifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Stack(children: [
              Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(widget.title ?? "")),
              InkWell(
                  onTap: () {
                    Navigator.pop(widget.context);
                  },
                  child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: SVGIcons.closeSquareSvgIcon()))
            ]),
            const SizedBox(height: 32),
            widget.enableSearch == true
                ? AppTextField(
                    textFieldColor: AppTheme.appGrey9,
                    hint: widget.searchHint ?? "",
                    label: widget.searchHint ?? "",
                    textEditingController: textEditingController,
                    startWidget: IconButton(
                        onPressed: () {}, icon: SVGIcons.searchSvgIcon()),
                    changeValueCallback: (value) {
                      print("value of input field $value");
                      setState(() {
                        widget.searchValue = value;
                        getListItem(widget.searchValue);
                      });
                    },
                  )
                : const SizedBox(),
            widget.isSingleSelect == true
                ? Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.itemSelectedId = list[index].id;
                                });
                              },
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Radio(
                                        value: list.isNotEmpty
                                            ? list[index].id
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
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  list[index].widget ?? const SizedBox(),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    list[index].text,
                                    style: widget.itemSelectedId ==
                                            list[index].id
                                        ? AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts16w500
                                        : AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts16w400,
                                  ))
                                  // Checkbox(value: Radio(value: value, groupValue: groupValue, onChanged: onChanged), onChanged: onChanged)
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            const Divider(color: AppTheme.appGrey3),
                        itemCount: list.length))
                : Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  list[index].isChecked =
                                      !(list[index].isChecked ?? false);
                                });
                              },
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Checkbox(
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
                                            list[index].isChecked = value;
                                          });
                                        },
                                        value: list.isNotEmpty
                                            ? list[index].isChecked
                                            : false),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  list[index].widget ?? const SizedBox(),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(list[index].text,
                                          style: AppTheme
                                              .styleWithTextBlackAdelleSansExtendedFonts16w500))
                                  // Checkbox(value: Radio(value: value, groupValue: groupValue, onChanged: onChanged), onChanged: onChanged)
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            const Divider(color: AppTheme.appGrey3),
                        itemCount: list.length)),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              height: 46,
              width: double.maxFinite,
              onPress: () {
                if (widget.isSingleSelect) {
                  if (widget.itemSelectedId != null) {
                    widget.onSelectItemCallback
                        .call(widget.itemSelectedId ?? 0);
                  }
                } else if (!widget.isSingleSelect) {
                  widget.onSelectMultiItemsCallback.call(widget.widgetList
                      .where((item) => item.isChecked == true)
                      .map<int>((item) => item.id)
                      .toList());
                }
              },
              child: Text(
                widget.btuName,
                style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void getListItem(String search) {
    ref.read(searchFilterStateNotifier.notifier).updateList(
        widget.widgetList.where((w) => w.text.contains(search)).toList());
    print("filtration ${widget.filterWidgetList}");
  }
}
