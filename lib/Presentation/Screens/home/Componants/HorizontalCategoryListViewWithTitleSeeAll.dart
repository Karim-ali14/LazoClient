import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';
import '../../../Widgets/TitleWithSeeAll.dart';

typedef OnItemClickListener = Function(Category);
typedef OnSeeAllClickListener = Function(int?, String);

class HorizontalCategoryListViewWithTitleSeeAll extends StatefulWidget {
  final List<Category> list;
  final bool showLoading;
  final bool isGrid;
  final OnItemClickListener itemClick;
  final OnSeeAllClickListener onSeeAllClickListener;

  const HorizontalCategoryListViewWithTitleSeeAll({
    super.key,
    required this.list,
    required this.showLoading,
    required this.itemClick,
    required this.onSeeAllClickListener,
    this.isGrid = false, // Added isGrid flag
  });

  @override
  State<HorizontalCategoryListViewWithTitleSeeAll> createState() =>
      _HorizontalCategoryListViewWithTitleSeeAllState();
}

class _HorizontalCategoryListViewWithTitleSeeAllState
    extends State<HorizontalCategoryListViewWithTitleSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeletonizer(
          enabled: widget.showLoading,
          child: TitleWithSeeAll(
            title: context.tr(categoriesKey),
            onClickOnSeeAll: () {
              widget.onSeeAllClickListener.call(null, "");
            },
          ),
        ),
        const SizedBox(height: 16),

        /// ListView or GridView based on isGrid
        SizedBox(
          height: widget.isGrid ? 160 : 78, // Adjust height for grid
          child:
          widget.isGrid
              ? GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two rows
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .6, // Adjust for better fit
                  ),
                  itemCount: widget.showLoading ? 5 : widget.list.length,
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      enabled: widget.showLoading,
                      child: InkWell(
                        onTap: () {
                          widget.itemClick.call(widget.list[index]);
                        },
                        child: CategoryItemCart(
                          image: widget.showLoading
                              ? ""
                              : widget.list[index].imagePath ?? "",
                          title: widget.showLoading
                              ? ""
                              : widget.list[index].name ?? "",
                          width: 127,
                          height: 78,
                        ),
                      ),
                    );
                  },
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      enabled: widget.showLoading,
                      child: InkWell(
                        onTap: () {
                          widget.itemClick.call(widget.list[index]);
                        },
                        child: CategoryItemCart(
                          image: widget.showLoading
                              ? ""
                              : widget.list[index].imagePath ?? "",
                          title: widget.showLoading
                              ? ""
                              : widget.list[index].name ?? "",
                          width: 127,
                          height: 78,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: widget.showLoading ? 5 : widget.list.length,
                ),
        ),
      ],
    );
  }
}
