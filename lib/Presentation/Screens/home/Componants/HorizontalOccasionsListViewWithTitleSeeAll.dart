import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';
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
            title: context.tr(occasionsKey),
            onClickOnSeeAll: () {
              widget.onSeeAllClickListener.call(null,"");
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 78,
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
                      width: 127,
                      height: 78,
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
