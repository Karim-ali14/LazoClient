import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Theme/AppTheme.dart';

class CategoryTabs extends StatefulWidget {
  final List<String> list;
  final Function(int) onItemClick;
  const CategoryTabs({super.key, required this.list, required this.onItemClick});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {

  int activeTabProductCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              widget.onItemClick.call(index);
              setState(() {
                activeTabProductCategoryIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: activeTabProductCategoryIndex == index ? const Border(bottom: BorderSide(color: AppTheme.appRedColor,width: 2)) : const Border()
              ),
              child: Center(
                child: Text(
                    widget.list[index] ?? ""
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount:   widget.list.length ?? 0);
  }
}
