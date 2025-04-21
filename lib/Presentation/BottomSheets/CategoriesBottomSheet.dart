import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class CategoriesBottomSheet extends StatefulWidget {
  final List<Category>? categories;
  final FilterScreenTypes type;
  final int initSelected;
  final Function(int index)? onSelected;
  const CategoriesBottomSheet({super.key, this.categories, required this.type, required this.initSelected, this.onSelected});

  @override
  State<CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet> {
  int? selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.initSelected;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            margin: EdgeInsetsDirectional.only(bottom: 12),
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Categories",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddingHorizontal),
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SVGIcons.localSVG(closeIconSvg,
                            width: 32, height: 32)),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.appGrey11.withOpacity(0.6),
                  blurRadius: .5,
                  spreadRadius: .1,
                  offset: const Offset(0, .5),
                ),
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: widget.categories?.length ?? 0,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return InkWell(
                  onTap: () {
                    setState(() {
                      print("$index");
                      selectedIndex = index;
                      widget.onSelected?.call(selectedIndex??0);
                      context.pop();
                    });
                  },
                  child: Container(
                    margin:
                    const EdgeInsetsDirectional.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin:
                          const EdgeInsetsDirectional.only(end: 16),
                          width: 7,
                          height: 25,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.transparent,
                            borderRadius: const BorderRadiusDirectional.only(
                                topEnd: Radius.circular(2),
                                bottomEnd: Radius.circular(2)),
                          ),
                        ),
                        Text(
                          widget.categories?[index].name ?? "",
                          style: AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                        ),
                        const Spacer(),
                        Text(
                          "(${widget.type == FilterScreenTypes.Products ? (widget.categories?[index].products?.length ?? 0) : (widget.categories?[index].services?.length ?? 0)})",
                          style: AppTheme.styleWithTextAppGrey22ColorAdelleSansExtendedFonts16w400,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
