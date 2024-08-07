import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Data/Network/lib/api.dart';
import 'AppButton.dart';

class SellerItemCard extends StatefulWidget {
  final ProviderData? providerData;
  final int? width;
  const SellerItemCard({super.key, required this.providerData, this.width});

  @override
  State<SellerItemCard> createState() => _SellerItemCardState();
}

class _SellerItemCardState extends State<SellerItemCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: widget.width?.toDouble() ?? double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppTheme.appGrey6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton.replace(
              replacement: Container(
                width: MediaQuery.of(context).size.width,
                height: 121,
                color: Colors.white,
              ),
              child: ImageView(
                width: MediaQuery.of(context).size.width,
                height: 121,
                initialImg: widget.providerData?.imagePath,
                placeHolder: placeHolderForCardsSvg,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Skeleton.replace(
                    replacement: Container(
                      width: 80,
                      height: 15,
                      color: Colors.white,
                    ),
                    child: Text(
                      widget.providerData?.name ?? "",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w700.copyWith(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                        textAlign: TextAlign.center
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Skeleton.replace(
                    replacement: Container(
                      width: 60,
                      height: 15,
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SVGIcons.smallStarIcon(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.providerData?.overallRating?.toString() ?? "",
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Skeleton.replace(
                    replacement: Container(
                      width: context.getScreenSize.width,
                      height: 36,
                      color: Colors.white,
                    ),
                    child: AppButton(
                      width: context.getScreenSize.width,
                      height: 36,
                      onPress: () {},
                      child: Text(
                        "View Store",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      widget.providerData?.isPromoted == 1 ?
      Positioned(
          top: 20,
          left: (widget.width ?? MediaQuery.of(context).size.width) * 0.68,
          child: Container(
            padding: EdgeInsetsDirectional.only(
              end: 8,top: 1,bottom: 1
            ),
            decoration: BoxDecoration(
              color: AppTheme.mainAppColorLight2,
              borderRadius: BorderRadius.circular(2)
            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVGIcons.promotedIcon(),
            Text("promoted",style: AppTheme.styleWithTextMainAppColorAdelleSansExtendedFonts10w400,),
          ],
        ),
      )) : SizedBox(),
      Positioned(
        top: 95,
        left: (widget.width ?? MediaQuery.of(context).size.width) * 0.70,
        child: Skeleton.ignore(
          // replacement: Icon(
          //   Icons.verified_user,
          //   size: 60,
          // ),
          child: ImageView(
            isCircle: true,
            initialImg: widget.providerData?.imagePath,
          ),
        ),
      )
    ]);
  }
}
