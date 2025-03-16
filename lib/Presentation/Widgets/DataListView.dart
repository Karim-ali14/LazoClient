import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T item);
typedef OnRefreshScreen = Function();

class DataListView<T> extends StatelessWidget {
  final List<T> dataList;
  final bool paginated;
  final ItemBuilder<T> builder;
  final VoidCallback? onBottomReached;
  final Function(T item)? onItemSelected;
  final ScrollController _paginatedListController = ScrollController();
  final bool? reversed;
  final EdgeInsets? padding;
  final bool? pageLoading;
  final Widget? loadingWidget;
  final bool? withDivider;
  final ScrollPhysics? scrollPhysics;
  final OnRefreshScreen? onRefreshScreen;
  final bool? enableSwipe;
  final bool? gridView;
  final int crossAxisCount;
  final double childAspectRatio;
  final double heightPresent;
  final double loadingHeightPresent;

  DataListView({
    Key? key,
    required this.dataList,
    required this.paginated,
    required this.builder,
    this.onBottomReached,
    this.onItemSelected,
    this.padding,
    this.pageLoading,
    this.scrollPhysics,
    this.reversed,
    this.loadingWidget,
    this.withDivider,
    this.onRefreshScreen,
    this.enableSwipe,
    this.gridView = false,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
    this.heightPresent = 0.75,
    this.loadingHeightPresent = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotificationListener<ScrollEndNotification>(
            child: dataList.isNotEmpty
                ? gridView == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height *
                            (paginated && pageLoading == true
                                ? loadingHeightPresent
                                : heightPresent),
                        child: GridView.builder(
                          physics: scrollPhysics ?? const BouncingScrollPhysics(),
                          padding: padding ?? const EdgeInsets.all(8.0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 17,
                            mainAxisSpacing: 0,
                            childAspectRatio: childAspectRatio,
                          ),
                          itemCount: dataList.length,
                          controller: _paginatedListController,
                          itemBuilder: (context, index) =>
                              (paginated && index == dataList.length)
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Visibility(
                                          visible: paginated,
                                          child: pageLoading == true
                                              ? (loadingWidget ??
                                                  const SizedBox(
                                                    height: 30,
                                                  ))
                                              : const SizedBox(),
                                        ),
                                      ),
                                    )
                                  : builder(
                                      dataList[index],
                                    ),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height *
                            (paginated && pageLoading == true
                                ? loadingHeightPresent
                                : heightPresent),
                        child: ListView.builder(
                          physics: scrollPhysics ?? const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: padding ??
                              const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 50),
                          itemCount:
                              paginated ? dataList.length + 1 : dataList.length,
                          controller: _paginatedListController,
                          reverse: reversed ?? false,
                          itemBuilder: (context, index) =>
                              (paginated && index == dataList.length)
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Visibility(
                                          visible: paginated,
                                          child: pageLoading == true
                                              ? (loadingWidget ??
                                                  const SizedBox(
                                                    height: 30,
                                                  ))
                                              : const SizedBox(),
                                        ),
                                      ),
                                    )
                                  : builder(
                                      dataList[index],
                                    ),
                        ),
                      )
                : Center(
                    child: SingleChildScrollView(
                      controller: _paginatedListController,
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Text(
                        "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
            onNotification: (scrollEnded) {
              if (_paginatedListController.position.pixels >= 0 &&
                  _paginatedListController.position.pixels ==
                      _paginatedListController.position.maxScrollExtent) {
                onBottomReached?.call();
              }
              return true;
            },
          ),
          if (paginated && pageLoading == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: loadingWidget ?? const CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
