import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';
import '../../../Widgets/TitleWithSeeAll.dart';
import 'HorizontalCategoryListViewWithTitleSeeAll.dart';

typedef OnItemClickListener = Function(int);

class HorizontalTopSellersListViewWithTitleSeeAll extends StatefulWidget {
  final List<ProviderData> list;
  final bool showLoading;
  final OnItemClickListener itemClick;
  final OnSeeAllClickListener onSeeAllClickListener;
  const HorizontalTopSellersListViewWithTitleSeeAll(
      {super.key,
      required this.list,
      required this.showLoading,
      required this.itemClick, required this.onSeeAllClickListener});

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
            title: context.tr(topSellersKey),
            onClickOnSeeAll: () {
              widget.onSeeAllClickListener.call(null,"");
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height:200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: widget.showLoading ,
                  child: SellerItemCard(
                    height: 160,
                    width: 160,
                    providerData: widget.showLoading ? null : widget.list[index], onSellerClickListener: (sellerId ) {
                      navigateToSellerDetails(sellerId);
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
  void navigateToSellerDetails(int sellerId,) {
    context.push(R_SellerDetails , extra: {"sellerId" : sellerId});
  }
}
