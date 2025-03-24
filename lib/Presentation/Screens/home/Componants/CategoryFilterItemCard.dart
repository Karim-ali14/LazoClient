import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

typedef OnSelectCategory = Function(bool);
class CategoryFilterItemCard extends StatefulWidget {
  final String image;
  final String title;
  final double? width;
  final double height;
  final bool? initSelected;
  final OnSelectCategory onSelectCategory;
  const CategoryFilterItemCard(
      {super.key,
      required this.image,
      required this.title,
      this.width,
      required this.height,
      this.initSelected = false, required this.onSelectCategory});

  @override
  State<CategoryFilterItemCard> createState() => _CategoryFilterItemCardState();
}

class _CategoryFilterItemCardState extends State<CategoryFilterItemCard> {
  bool isSelected = false;
  @override
  void initState() {
    isSelected = widget.initSelected ?? false;
    super.initState();
  }

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
            isSelected = !isSelected;
            widget.onSelectCategory.call(isSelected);
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
                width: isSelected == true ? 2 : 0),
          ),
          child: Stack(
            children: [
              ImageView(
                width: widget.width ?? MediaQuery.of(context).size.width,
                height: widget.height,
                initialImg: widget.image,
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
                      Text(widget.title,
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
