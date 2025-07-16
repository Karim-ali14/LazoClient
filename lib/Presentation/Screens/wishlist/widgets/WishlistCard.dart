import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../Data/Network/lib/api.dart';

class WishlistCard extends StatelessWidget {
  final CollectionItem? collection;

  const WishlistCard({super.key, this.collection});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.replace(
          replacement: Container(
            height: 157.h,
            width: double.infinity,
            color: Colors.white,
          ),
          child: Container(
            height: 157.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: (collection?.items.length ?? 0) >= 4
                ? GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1),
                    itemCount: (collection?.items.length ?? 0) >= 4
                        ? collection?.items.length
                        : 1,
                    itemBuilder: (context, index) {
                      if (index == 3 && (collection?.items.length ?? 0) > 4) {
                        int extraCount = collection!.items.length - 4;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              collection?.items[index].imagePath ?? "",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.black.withOpacity(.5),
                              child: Center(
                                child: Text("+$extraCount Items",style: AppTheme.styleWithTextWhiteColorAdelleSansExtendedFonts12w500,),
                              ),
                            )
                          ],
                        );
                      }
                      return Image.network(
                        collection?.items[index].imagePath ?? "",
                        fit: BoxFit.cover,
                      );
                      },
                  )
                : Expanded(
                    child: collection?.items.isEmpty == false
                        ? ImageView(
                            width: double.infinity,
                            height: double.infinity,
                            initialImg: collection?.items.first.imagePath ?? "")
                        : Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: AppTheme.appGrey20,
                          )),
          ),
        ),
        Skeleton.replace(
          replacement: Container(
            margin: const EdgeInsets.only(top: 5),
            width: 80,
            height: 20,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              collection?.name ?? "",
              style:
                  AppTheme.styleWithTextBlackColor2AdelleSansExtendedFonts16w500,
            ),
          ),
        ),
        Skeleton.replace(
          replacement: Container(
            margin: const EdgeInsets.only(top: 5),
            width: 50,
            height: 20,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('${collection?.items.length ?? 'No'} Items',
                style: AppTheme.styleWithTextGray18AdelleSansExtendedFonts12w400),
          ),
        ),
      ],
    );
  }
}
