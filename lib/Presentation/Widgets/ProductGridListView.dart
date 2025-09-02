import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';
import 'data_list_view/DataListView.dart';
import 'ServiceAndProductItemCard.dart';
import 'TitleWithSeeAll.dart';

class ProductGridListviewWithCategoryName extends StatefulWidget {
  final List<ProviderProduct>? list;
  final bool? showLoading;
  final bool? showSeeMore;
  final OnAddItemClick onAddItemToCart;
  final OnAddToWishlistItemClick onAddItemToWishList;
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

        GridView.builder(
            padding: EdgeInsets.only(top: 12),
            primary: false,
            itemCount: widget.list?.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 15,
              childAspectRatio: .77,
            ),
            itemBuilder: (context, gridIndex) => Skeletonizer(
                  enabled: widget.showLoading ?? false,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 0, vertical: 0),
                    child: ServiceAndProductItemCardHorizontal(
                      type: ItemType.Products,
                      product: widget.list?[gridIndex],
                      height: 158.h,
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
