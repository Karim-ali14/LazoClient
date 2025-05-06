import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Assets.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Data/Models/ItemSelector.dart';
import '../../../StateNotifiersViewModel/SearchBottomSheetStateNotifier.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/CustomSelector.dart';
import '../../../Widgets/SvgIcons.dart';

class CustomSelectorCitySheet extends ConsumerStatefulWidget {
  final BuildContext context;
  final String btuName;
  final bool? enableSearch;
  final String? title;
  final String? searchHint;
  final List<ItemSelector> widgetList;
  List<ItemSelector> filterWidgetList = [];
  bool showRadio;
  String searchValue = "";
  int? itemSelectedId;
  List<int>? itemSelectedIds;
  final bool isSingleSelect;
  final OnSelectItemCallback onSelectItemCallback;
  final OnSelectMultiItemsCallback onSelectMultiItemsCallback;

  CustomSelectorCitySheet({
    super.key,
    required this.context,
    this.showRadio = true,
    this.enableSearch,
    this.title,
    required this.btuName,
    required this.widgetList,
    this.searchHint,
    this.itemSelectedId,
    this.itemSelectedIds,
    required this.isSingleSelect,
    required this.onSelectMultiItemsCallback,
    required this.onSelectItemCallback,
  });

  @override
  ConsumerState createState() => _CustomSelectorCitySheetState();
}

class _CustomSelectorCitySheetState extends ConsumerState<CustomSelectorCitySheet> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.itemSelectedIds?.isNotEmpty == true) {
        widget.widgetList.forEach((item) =>
        item.isChecked = widget.itemSelectedIds?.any((id) => id == item.id));
      }
      ref.read(searchFilterStateNotifier.notifier).updateList(widget.widgetList);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Expanded(child: Center(child: Text(widget.title ?? ""))),
              InkWell(
                onTap: () {
                  Navigator.pop(widget.context);
                },
                child: SVGIcons.localSVG(closeIcons),
              ),
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
                setState(() {
                  widget.searchValue = value;
                  getListItem(widget.searchValue);
                });
              },
            )
                : const SizedBox(),
            widget.isSingleSelect
                ? Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.itemSelectedId = list[index].id;
                    });
                    widget.onSelectItemCallback(widget.itemSelectedId!);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: widget.showRadio
                            ? Radio(
                          value: list[index].id,
                          groupValue: widget.itemSelectedId,
                          activeColor: AppTheme.mainAppColor,
                          fillColor:
                          MaterialStateProperty.resolveWith(
                                (states) {
                              if (states.contains(MaterialState.selected)) {
                                return AppTheme.mainAppColor;
                              }
                              return AppTheme.appGrey10;
                            },
                          ),
                          onChanged: (value) {
                            setState(() {
                              widget.itemSelectedId = value;
                            });
                            widget.onSelectItemCallback(widget.itemSelectedId!);
                            Navigator.pop(context);
                          },
                        )
                            : Container(height: 40),
                      ),
                      const SizedBox(width: 2),
                      list[index].widget ?? const SizedBox(),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          list[index].text,
                          style: widget.itemSelectedId == list[index].id
                              ? AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500
                              : AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) =>
                const Divider(color: AppTheme.appGrey3),
                itemCount: list.length,
              ),
            )
                : Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      list[index].isChecked = !(list[index].isChecked ?? false);
                    });
                    widget.onSelectMultiItemsCallback(widget.widgetList
                        .where((item) => item.isChecked == true)
                        .map<int>((item) => item.id)
                        .toList());
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          visualDensity: VisualDensity(horizontal: -4),
                          activeColor: AppTheme.mainAppColor,
                          fillColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppTheme.mainAppColor;
                            }
                            return Colors.white;
                          }),
                          onChanged: (value) {
                            setState(() {
                              list[index].isChecked = value;
                            });
                            widget.onSelectMultiItemsCallback(widget.widgetList
                                .where((item) => item.isChecked == true)
                                .map<int>((item) => item.id)
                                .toList());
                          },
                          value: list[index].isChecked ?? false,
                        ),
                      ),
                      const SizedBox(width: 3),
                      list[index].widget ?? const SizedBox(),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          list[index].text,
                          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) =>
                const Divider(color: AppTheme.appGrey3),
                itemCount: list.length,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void getListItem(String search) {
    ref.read(searchFilterStateNotifier.notifier).updateList(
      widget.widgetList.where((w) => w.text.contains(search)).toList(),
    );
  }
}
