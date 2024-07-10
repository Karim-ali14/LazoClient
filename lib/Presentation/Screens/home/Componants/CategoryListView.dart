import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../Widgets/TitleWithSeeAll.dart';

typedef OnItemClickListener = Function(int);

class CategoriesListView extends StatefulWidget {
  final List<Category> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  const CategoriesListView(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Skeletonizer(
          enabled: widget.showLoading,
          child: TitleWithSeeAll(
            title: "Categories",
            onClickOnSeeAll: () {},
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 95,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: widget.showLoading ,
                  child: HorizontalCategoryItemCartWithTitleSeeAll(
                    image: widget.showLoading ? "" : widget.list[index].imagePath ?? "",
                    title: widget.showLoading ? "" :  widget.list[index].name ?? "",
                    width: 131,
                    height: 95,
                  ),
                );
              },
              separatorBuilder: (context , index) => const SizedBox(
                width: 12,
              ),
              itemCount: widget.showLoading ? 5 : widget.list.length),
        ),
      ]
    );
  }
}
