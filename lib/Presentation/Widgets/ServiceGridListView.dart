import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import 'data_list_view/DataListView.dart';
import 'ServiceAndProductItemCard.dart';
import 'TitleWithSeeAll.dart';

class ServiceGridListviewWithCategoryName extends StatefulWidget {
  final List<ServiceShowData>? list;
  final bool? showLoading;
  final bool? showSeeMore;
  final OnAddItemClick onAddItemToCart;
  final OnAddToWishlistItemClick onAddItemToWishList;
  final OnItemClick onItemClick;
  final String title;
  final int? rootId;
  const ServiceGridListviewWithCategoryName(
      {super.key,
      this.list,
      this.showLoading,
      required this.onAddItemToCart,
      required this.onAddItemToWishList,
      required this.onItemClick,
      required this.title,
      this.rootId,
      this.showSeeMore = true});

  @override
  State<ServiceGridListviewWithCategoryName> createState() =>
      _ServiceGridListviewWithCategoryNameState();
}

class _ServiceGridListviewWithCategoryNameState
    extends State<ServiceGridListviewWithCategoryName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeletonizer(
          enabled: widget.showLoading ?? false,
          child: TitleWithSeeAll(
            showSeeMore: widget.showSeeMore,
            title: widget.title,
            onClickOnSeeAll: () {},
          ),
        ),
        GridView.builder(
            itemCount: widget.list?.length,
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // disable internal scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 15,
              childAspectRatio: .78,
            ),
            itemBuilder: (context, gridIndex) => Skeletonizer(
                  enabled: widget.showLoading ?? false,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 0, vertical: 0),
                    child: ServiceAndProductItemCardHorizontal(
                      type: ItemType.Services,
                      service: widget.list?[gridIndex],
                      height: 160,
                      onAddItemToCart: (id) {
                        widget.onAddItemToCart(id);
                      },
                      onAddItemToWishList: (id,collectionId,inWishlist) {
                        widget.onAddItemToWishList(id,collectionId,inWishlist);
                      },
                      onItemClick: (id, name, categoriesIds) {
                        widget.onItemClick.call(id, name, categoriesIds);
                      },
                    ),
                  ),
                )),
      ],
    );
  }
}
