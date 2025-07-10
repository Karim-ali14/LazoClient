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

class HorizontalTopProductListViewWithTitleSeeAll extends StatefulWidget {
  final List<ProviderProduct> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  final OnAddItemClick onAddItemToCart;
  final OnAddToWishlistItemClick onAddItemToWishList;
  final OnSeeAllClickListener onSeeAllClickListener;
  final double itemWidth;
  final String title;
  final int? rootId;
  const HorizontalTopProductListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick, required this.onAddItemToCart, required this.onAddItemToWishList, required this.onSeeAllClickListener, required this.itemWidth, required this.title, this.rootId = null});

  @override
  State<HorizontalTopProductListViewWithTitleSeeAll> createState() => _HorizontalTopProductListViewWithTitleSeeAll();
}

class _HorizontalTopProductListViewWithTitleSeeAll extends State<HorizontalTopProductListViewWithTitleSeeAll> {
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
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: widget.showLoading ,
                  child: ServiceAndProductItemCardHorizontal(
                    height: widget.itemWidth,
                    width: widget.itemWidth,
                    product: widget.list[index],
                    type: ItemType.Products, onAddItemToCart: (id ) {
                    widget.onAddItemToCart.call(id);
                  }, onAddItemToWishList: (id,collectionId,inWishlist) {
                    widget.onAddItemToWishList.call(id,collectionId,inWishlist);
                  }, onItemClick: (id,name,categoriesIds ) {
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
