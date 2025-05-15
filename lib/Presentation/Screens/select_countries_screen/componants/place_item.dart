import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

class PlaceItem extends StatefulWidget {
  final bool? isLoading;
  final int id;
  final String? icon;
  final String title;
  final bool isSelect;
  final Function(int) onPress;
  const PlaceItem({super.key, required this.id, this.icon, required this.title, this.isSelect = false, required this.onPress, this.isLoading});

  @override
  State<PlaceItem> createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPress(widget.id);
      },
      child: Container(
        height: 41.h,
        margin: const EdgeInsets.symmetric(horizontal:5),
        padding: const EdgeInsets.symmetric(horizontal:10),
        decoration: widget.isLoading == false ? BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isSelect ? AppTheme.mainAppColorLight2 : Colors.white,
        ) :const BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon == null ? const SizedBox() : Skeleton.replace(
              replacement: Container(
                width: 24.w,
                height: 18.h,
                color: Colors.white,
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: ImageView(
                  initialImg: widget.icon,
                  width: 24.w,
                  height: 18.h,
                ),
              ),
            ),
            SizedBox(
              width: widget.icon == null ? 0 : 8,
            ),
            Skeleton.replace(
                replacement: Container(
                  width: 100.w,
                  height: 15.h,
                  color: Colors.white,
                ),
                child: Text(widget.title,style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,))
          ],
        ),
      ),
    );
  }
}
