
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/AppButton.dart';
import '../Widgets/AppTextField.dart';
import '../Widgets/SvgIcons.dart';

typedef SelectionCallBack = void Function(int);
class SelectionBottomSheetItem {
  final String item;
  bool? disabled;
  final Color? color;
  SelectionBottomSheetItem({required this.item,this.disabled,this.color});
}
class SelectionBottomSheet extends StatefulWidget {
  final int? initialValue;
  final SelectionCallBack onSelection;
  final List<SelectionBottomSheetItem> items;
  final String header;
  final bool? directSelection;
  final bool? searchEnabled;
  final String? searchHint;
  const SelectionBottomSheet(
      {super.key,
      required this.onSelection,
      required this.items,
      required this.header,
      this.initialValue,
      this.directSelection,this.searchEnabled,this.searchHint});

  @override
  State<SelectionBottomSheet> createState() => _SelectionBottomSheetState();
}

class _SelectionBottomSheetState extends State<SelectionBottomSheet> {
  var groupValue = 0;
  final TextEditingController textEditingController = TextEditingController();
  List<SelectionBottomSheetItem> items = [];
  @override
  void initState() {
    if (widget.initialValue != null) {
      groupValue = widget.initialValue ?? 0;
    }
    items = [...widget.items.map((e) => e)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          widget.header,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
        ),
        const SizedBox(
          height: 25,
        ),
        if(widget.searchEnabled == true) Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextField(
            hint: widget.searchHint ?? "",
            label: widget.searchHint ?? "",
            maxLines: 1,
            textEditingController: textEditingController,
            startWidget:
            IconButton(onPressed: () {}, icon: SVGIcons.searchIcon()),
            changeValueCallback: (value){
              setState(() {
                items = widget.items.where((element) => element.item.toLowerCase().startsWith(value.toLowerCase())).toList();
              });
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) => IgnorePointer(
              ignoring: items[index].disabled == true ,
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.1,
                    child: Radio(
                        value: index,
                        groupValue: groupValue,
                        fillColor: MaterialStateProperty.all(groupValue == index
                            ? AppTheme.mainAppColorLight
                            : AppTheme.appGrey3),
                        onChanged: select),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        select(index);
                      },
                      child: Text(
                        items[index].item,
                        style: AppTheme.appTextTheme.bodyMedium?.copyWith(
                            color: items[index].disabled == true ? AppTheme.appGrey3 : Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) => const Divider(
              color: AppTheme.appGrey3,
              indent: 30,
              endIndent: 30,
            ),
          ),
        ),
        if(widget.directSelection != true) Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: AppButton(onPress: (){
            widget.onSelection(groupValue);
            context.pop();
          } , text: "done" ,width: context.getScreenSize.width,),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void select(val) {
    setState(() => groupValue = val ?? 0);

    if(widget.directSelection == true){
      widget.onSelection(groupValue);
      context.pop();
    }
  }
}

void showBottomSheetSelection(BuildContext context, String header,
    List<SelectionBottomSheetItem> items, SelectionCallBack onSelection,
    {int? initialValue, bool? directSelection,String? searchHint,bool? searchEnabled}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.getScreenSize.height * 0.6),
          child: SelectionBottomSheet(
                header: header,
                items: items,
                onSelection: onSelection,
                searchEnabled: searchEnabled,
                searchHint: searchHint,
                initialValue: initialValue,
                directSelection: directSelection,
              ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))));
}
