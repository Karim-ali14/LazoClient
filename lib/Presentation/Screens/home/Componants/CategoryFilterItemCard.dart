import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';
import '../../../Widgets/TextWithoutPadding.dart';

typedef OnSelectCategory = Function(ItemSelected?);

class CategoryFilterItemCard extends StatefulWidget {
  final ItemSelected? item;
  final double height;
  final OnSelectCategory onSelectCategory;
  const CategoryFilterItemCard(
      {super.key,
      required this.height,
      required this.onSelectCategory,
      this.item});

  @override
  State<CategoryFilterItemCard> createState() => _CategoryFilterItemCardState();
}

class _CategoryFilterItemCardState extends State<CategoryFilterItemCard> {
  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container( // Adjust dimensions as needed
        height: widget.height,
        color: AppTheme.appGrey9,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.appGrey8, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWithoutPadding(widget.item?.text ?? "",
                  style: AppTheme.styleWithTextBlackColor2AdelleSansExtendedFonts13w400
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                  textAlign: TextAlign.center),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    widget.onSelectCategory.call(widget.item);
                  },
                  child: SVGIcons.localSVG(deleteImg,width: 20,height: 20))
            ],
          ),
        ),
      ),
    );
  }
}
