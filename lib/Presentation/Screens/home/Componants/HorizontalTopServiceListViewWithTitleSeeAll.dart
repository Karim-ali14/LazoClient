import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceAndProductItemCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Widgets/TitleWithSeeAll.dart';
import 'HorizontalCategoryListViewWithTitleSeeAll.dart';

typedef OnItemClickListener = Function(int,String,List<int>);

class HorizontalTopServiceListViewWithTitleSeeAll extends StatefulWidget {
  final List<ServiceShowData> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  final OnAddItemClick onAddItemToCart;
  final OnAddItemClick onAddItemToWishList;
  final OnSeeAllClickListener onSeeAllClickListener;
  final double itemWidth;
  final String title;
  final int? rootId;
  const HorizontalTopServiceListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick, required this.onAddItemToCart, required this.onAddItemToWishList, required this.onSeeAllClickListener, required this.itemWidth, required this.title, this.rootId});

  @override
  State<HorizontalTopServiceListViewWithTitleSeeAll> createState() => _HorizontalTopServiceListViewWithTitleSeeAll();
}

class _HorizontalTopServiceListViewWithTitleSeeAll extends State<HorizontalTopServiceListViewWithTitleSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Skeletonizer(
          enabled: widget.showLoading,
          child: TitleWithSeeAll(
            title: widget.title,
            onClickOnSeeAll: () {
              widget.onSeeAllClickListener.call(widget.rootId,widget.title);
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: widget.showLoading ,
                  child: ServiceAndProductItemCardHorizontal(
                    width: widget.itemWidth,
                    service: widget.list[index],
                    type: ItemType.Services, onAddItemToCart: (id ) {
                      widget.onAddItemToCart.call(id);
                  }, onAddItemToWishList: (id ) {
                    widget.onAddItemToWishList.call(id);
                  }, onItemClick: (id,name,categoriesIds) {
                    widget.itemClick.call(id,name,categoriesIds);
                  },

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
