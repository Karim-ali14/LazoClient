import 'package:flutter/cupertino.dart';

import 'DataListView.dart';

class DataListViewGrid<T> extends StatelessWidget {
  final List<T> dataList;
  final ItemBuilder<T> builder;
  final ScrollController controller;
  final bool paginated;
  final bool? pageLoading;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final int crossAxisCount;
  final EdgeInsets? padding;
  final ScrollPhysics? scrollPhysics;
  final Widget? loadingWidget;

  const DataListViewGrid({
    super.key,
    required this.dataList,
    required this.builder,
    required this.controller,
    required this.paginated,
    this.pageLoading,
    required this.crossAxisSpacing,
    required this.childAspectRatio,
    required this.crossAxisCount,
    this.padding,
    this.scrollPhysics,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: padding ?? const EdgeInsets.all(8),
      physics: scrollPhysics ?? const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: 0,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        if (paginated && index == dataList.length) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: pageLoading == true
                  ? (loadingWidget ?? const SizedBox(height: 30))
                  : const SizedBox(),
            ),
          );
        }
        return builder(dataList[index]);
      },
    );
  }
}
