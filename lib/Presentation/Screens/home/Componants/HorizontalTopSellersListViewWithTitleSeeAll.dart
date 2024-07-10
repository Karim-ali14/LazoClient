import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';
import '../../../Widgets/TitleWithSeeAll.dart';

typedef OnItemClickListener = Function(int);

class HorizontalTopSellersListViewWithTitleSeeAll extends StatefulWidget {
  final List<ProviderData> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  const HorizontalTopSellersListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick});

  @override
  State<HorizontalTopSellersListViewWithTitleSeeAll> createState() => _HorizontalTopSellersListViewWithTitleSeeAllState();
}

class _HorizontalTopSellersListViewWithTitleSeeAllState extends State<HorizontalTopSellersListViewWithTitleSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Skeletonizer(
          enabled: widget.showLoading,
          child: TitleWithSeeAll(
            title: "Top Sellers",
            onClickOnSeeAll: () {},
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: widget.showLoading ? 270 : 280,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: widget.showLoading ,
                  child: SellerItemCard(
                    providerData: widget.showLoading ? null : widget.list[index],
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
