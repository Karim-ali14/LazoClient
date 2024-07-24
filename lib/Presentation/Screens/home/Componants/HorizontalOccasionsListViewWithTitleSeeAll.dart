import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../Widgets/TitleWithSeeAll.dart';
import 'HorizontalCategoryListViewWithTitleSeeAll.dart';

typedef OnOccasionItemClickListener = Function(Occasion);

class HorizontalOccasionsListViewWithTitleSeeAll extends StatefulWidget {
  final List<Occasion> list;
  final bool showLoading;
  final OnOccasionItemClickListener itemClick;
  final OnSeeAllClickListener onSeeAllClickListener;
  const HorizontalOccasionsListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick, required this.onSeeAllClickListener});

  @override
  State<HorizontalOccasionsListViewWithTitleSeeAll> createState() => _HorizontalOccasionsListViewWithTitleSeeAllState();
}

class _HorizontalOccasionsListViewWithTitleSeeAllState extends State<HorizontalOccasionsListViewWithTitleSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Skeletonizer(
          enabled: widget.showLoading,
          child: TitleWithSeeAll(
            title: "Occasions",
            onClickOnSeeAll: () {
              widget.onSeeAllClickListener.call();
            },
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
                  child: InkWell(
                    onTap: (){
                      widget.itemClick.call(widget.list[index]);
                    },
                    child: CategoryItemCart(
                      image: widget.showLoading ? "" : widget.list[index].imagePath ?? "",
                      title: widget.showLoading ? "" :  widget.list[index].name ?? "",
                      width: 133,
                      height: 95,
                    ),
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
