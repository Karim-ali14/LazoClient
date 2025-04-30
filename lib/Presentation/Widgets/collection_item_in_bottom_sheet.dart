import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Constants/Assets.dart';

class CollectionItemInBottomSheet extends StatefulWidget {
  final bool? isSelected;
  final CollectionItem? collectionItem;
  final Function(String) onChangeCollection;
  const CollectionItemInBottomSheet({super.key, this.collectionItem, this.isSelected, required this.onChangeCollection});

  @override
  State<CollectionItemInBottomSheet> createState() => _CollectionItemInBottomSheetState();
}

class _CollectionItemInBottomSheetState extends State<CollectionItemInBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ImageView(
                initialImg: widget.collectionItem?.items.isNotEmpty == true ? widget.collectionItem?.items.first.imagePath : "",
                width: 40.w,
                height: 40.h,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.collectionItem?.name ?? "",style: AppTheme.styleWithTextBlackColor2AdelleSansExtendedFonts14w500,),
                SizedBox(
                  height: 5,
                ),
                Text("${widget.collectionItem?.itemsCount??0} Items",style: AppTheme.styleWithTextGray18AdelleSansExtendedFonts12w400,),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: (){
                  if(widget.isSelected == false){
                    widget.onChangeCollection.call((widget.collectionItem?.id??0).toString());
                    context.pop();
                  }
                },
                child: SVGIcons.localSVG(widget.isSelected == true ? plusFullIcon : plusEmptyIcon,width: 20,height: 20))
          ],
        ),
      ),
    );
  }
}
