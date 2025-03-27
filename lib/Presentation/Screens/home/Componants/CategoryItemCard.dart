import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

typedef OnSelectCategory = Function(Category?);
class CategoryItemCard extends StatefulWidget {
  final Category? category;
  final double? width;
  final double height;
  final OnSelectCategory onSelectCategory;
  const CategoryItemCard(
      {super.key,
      this.width,
      required this.height, required this.onSelectCategory, this.category});

  @override
  State<CategoryItemCard> createState() => _CategoryItemCardState();
}

class _CategoryItemCardState extends State<CategoryItemCard> {

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        width: widget.width ??
            MediaQuery.of(context).size.width, // Adjust dimensions as needed
        height: widget.height,
        color: AppTheme.appGrey9,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.category?.isChecked = !(widget.category?.isChecked ?? false);
            widget.onSelectCategory.call(widget.category);
          });
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppTheme.appRedColor,
                width: widget.category?.isChecked == true ? 2 : 0),
          ),
          child: Stack(
            children: [
              ImageView(
                width: widget.width ?? MediaQuery.of(context).size.width,
                height: widget.height,
                initialImg: widget.category?.imagePath,
              ),
              Container(
                width: widget.width,
                height: widget.height,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black
                          .withOpacity(0.8), // Dark shadow at the bottom
                      Colors.transparent, // Fades to transparent at the top
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.category?.name??"",
                          style: AppTheme
                              .styleWithTextWhiteColor15PoppinsFonts14w500
                              .copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
