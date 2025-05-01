import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/WishListStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/collection_item_in_bottom_sheet.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class CollectionsBottomSheet extends ConsumerStatefulWidget {
  final Function onCreateCollection;
  final Function(String) onChangeCollection;
  final int? selectedCollectionId;
  const CollectionsBottomSheet(  {super.key, required this.onCreateCollection,required this.onChangeCollection,this.selectedCollectionId,});

  @override
  ConsumerState<CollectionsBottomSheet> createState() => _AddCollectionBottomSheetState();
}

class _AddCollectionBottomSheetState extends ConsumerState<CollectionsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final collectionsList = ref.watch(showWishlistCollectionsStateNotifier);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.appGrey11.withOpacity(0.6), // Shadow color
                  blurRadius: .5, // Blur effect
                  spreadRadius: .1, // Spread effect
                  offset: const Offset(0, .5), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          "Collections",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPaddingHorizontal),
                          child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: SVGIcons.localSVG(closeIconSvg,
                                  width: 32, height: 32)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){
                    context.pop();
                    widget.onCreateCollection.call();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: AppTheme.appGrey23,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SVGIcons.localSVG(plusEmptyIcon,width: 20,height: 20),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("New Collection",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .45,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: CollectionItemInBottomSheet(
                      collectionItem: collectionsList.data?.data[index],
                      isSelected: collectionsList.data?.data[index].id == widget.selectedCollectionId, onChangeCollection: (collectionId) {
                        widget.onChangeCollection.call(collectionId);
                    },
                    ),
                  );
                },
                itemCount: collectionsList.data?.data.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
