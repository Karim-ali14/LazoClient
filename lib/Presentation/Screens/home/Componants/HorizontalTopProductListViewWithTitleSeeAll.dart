import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceAndProductItemCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Widgets/TitleWithSeeAll.dart';

typedef OnItemClickListener = Function(int);

class HorizontalTopProductListViewWithTitleSeeAll extends StatefulWidget {
  final List<ProviderProduct> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  final OnItemClick onAddItemToCart;
  final OnItemClick onAddItemToWishList;
  const HorizontalTopProductListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick, required this.onAddItemToCart, required this.onAddItemToWishList});

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
            title: "Best products",
            onClickOnSeeAll: () {},
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
                    type: ItemType.Product, onAddItemToCart: (id ) {
                    widget.onAddItemToCart.call(id);
                  }, onAddItemToWishList: (id ) {
                    widget.onAddItemToWishList.call(id);
                  }, onItemClick: (id ) {
                    widget.itemClick.call(id);
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
