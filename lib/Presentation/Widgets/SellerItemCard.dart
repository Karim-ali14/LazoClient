import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Data/Network/lib/api.dart';
import 'AppButton.dart';

class SellerItemCard extends StatefulWidget {
  final ProviderData? providerData;
  const SellerItemCard({super.key, required this.providerData});

  @override
  State<SellerItemCard> createState() => _SellerItemCardState();
}

class _SellerItemCardState extends State<SellerItemCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 307,
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
                initialImg:
                    widget.providerData?.imagePath,
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
                          .styleWithTextBlackAdelleSansExtendedFonts16w700,
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
                        Text(widget.providerData?.ratingsCount?.toString() ?? "",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,),
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
                      onPress: (){

                      },
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
      Positioned(
        top: 95,
        left: 240,
        child: Skeleton.replace(
        replacement: Icon(Icons.verified_user,size: 60,),
          child: ImageView(
            isCircle: true,
            initialImg:
            widget.providerData?.imagePath,
          ),
        ),
      )
    ]);
  }
}
