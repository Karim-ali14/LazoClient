import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import 'DataListView.dart';
import 'ServiceAndProductItemCard.dart';
import 'TitleWithSeeAll.dart';

class ProductGridListviewWithCategoryName extends StatefulWidget {
  final List<ProviderProduct>? list;
  final bool? showLoading;
  final bool? showSeeMore;
  final OnAddItemClick onAddItemToCart;
  final OnAddItemClick onAddItemToWishList;
  final OnItemClick onItemClick;
  final String title;
  final int? rootId;
  final ScrollController? scrollProductCategoriesController;
  const ProductGridListviewWithCategoryName(
      {super.key,
      this.list,
      this.showLoading,
      required this.onAddItemToCart,
      required this.onAddItemToWishList,
      required this.onItemClick,
      required this.title,
      this.rootId,
      this.scrollProductCategoriesController, this.showSeeMore = true,
      });

  @override
  State<ProductGridListviewWithCategoryName> createState() =>
      _ProductGridListviewWithCategoryNameState();
}

class _ProductGridListviewWithCategoryNameState
    extends State<ProductGridListviewWithCategoryName> {
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
        SizedBox(
          height: 16,
        ),
        GridView.builder(
            itemCount: widget.list?.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      type: ItemType.Products,
                      product: widget.list?[gridIndex],
                      height: 160,
                      onAddItemToCart: (id) {
                        widget.onAddItemToCart(id);
                      },
                      onAddItemToWishList: (id) {
                        widget.onAddItemToWishList(id);
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
