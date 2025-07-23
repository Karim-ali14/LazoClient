import 'package:flutter/cupertino.dart';

import 'DataListView.dart';

class DataListViewList<T> extends StatelessWidget {
  final List<T> dataList;
  final ItemBuilder<T> builder;
  final ScrollController controller;
  final bool paginated;
  final bool? pageLoading;
  final bool? reversed;
  final EdgeInsets? padding;
  final ScrollPhysics? scrollPhysics;
  final Widget? loadingWidget;

  const DataListViewList({
    super.key,
    required this.dataList,
    required this.builder,
    required this.controller,
    required this.paginated,
    this.pageLoading,
    this.reversed,
    this.padding,
    this.scrollPhysics,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      reverse: reversed ?? false,
      padding: padding ?? const EdgeInsets.only(left: 0, right: 0, bottom: 30),
      physics: scrollPhysics ?? const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: paginated ? dataList.length + 1 : dataList.length,
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
