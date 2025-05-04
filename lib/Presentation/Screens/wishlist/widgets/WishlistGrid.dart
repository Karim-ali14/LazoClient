import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/widgets/WishlistCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Data/Network/lib/api.dart';

class WishlistGrid extends StatelessWidget {
  final bool? showLoading;
  final List<CollectionItem>? collections;
  final Function(CollectionItem?) onCollectionClick;
  const WishlistGrid({super.key, this.showLoading, this.collections, required this.onCollectionClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 0,
          childAspectRatio: .8,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:collections?.length ?? 0,
        itemBuilder: (context, index) {
          return Skeletonizer(
              enabled: showLoading ?? false,
              child: InkWell(
                 onTap: (){
                   if(showLoading == false){
                     onCollectionClick.call(collections?[index]);
                   }
                 },
                  child: WishlistCard(collection: collections?[index])));
        },
      ),
    );
  }
}
