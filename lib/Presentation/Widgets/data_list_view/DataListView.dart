import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import 'DataListViewGrid.dart';
import 'DataListViewList.dart';

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
  final double crossAxisSpacing;
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
    this.crossAxisSpacing = 17,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotificationListener<ScrollEndNotification>(
            child: dataList.isNotEmpty
                ? SizedBox(
              height: MediaQuery.of(context).size.height *
                  (paginated && pageLoading == true
                      ? loadingHeightPresent
                      : heightPresent),
              child: gridView == true
                  ? DataListViewGrid<T>(
                dataList: dataList,
                builder: builder,
                controller: _paginatedListController,
                paginated: paginated,
                pageLoading: pageLoading,
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: crossAxisSpacing,
                padding: padding,
                scrollPhysics: scrollPhysics,
                loadingWidget: loadingWidget,
              )
                  : enableSwipe == true
                  ? RefreshIndicator(
                onRefresh: () async => onRefreshScreen?.call(),
                child: DataListViewList<T>(
                  dataList: dataList,
                  builder: builder,
                  controller: _paginatedListController,
                  paginated: paginated,
                  pageLoading: pageLoading,
                  reversed: reversed,
                  padding: padding,
                  scrollPhysics: scrollPhysics,
                  loadingWidget: loadingWidget,
                ),
              )
                  : DataListViewList<T>(
                dataList: dataList,
                builder: builder,
                controller: _paginatedListController,
                paginated: paginated,
                pageLoading: pageLoading,
                reversed: reversed,
                padding: padding,
                scrollPhysics: scrollPhysics,
                loadingWidget: loadingWidget,
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
                child: loadingWidget ??
                    const CircularProgressIndicator(
                      color: AppTheme.mainAppColorDark,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
