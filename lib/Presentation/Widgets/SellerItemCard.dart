import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import 'AppButton.dart';

class SellerItemCard extends StatefulWidget {
  const SellerItemCard({super.key});

  @override
  State<SellerItemCard> createState() => _SellerItemCardState();
}

class _SellerItemCardState extends State<SellerItemCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppTheme.appGrey6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageView(
              width: MediaQuery.of(context).size.width,
              height: 121,
              initialImg:
                  "https://t4.ftcdn.net/jpg/04/54/47/13/360_F_454471303_WKG9h3VY9UxazqrtbJ2wYsqUGWSfo9CK.jpg",
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Flowers Costa Cabral",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w700,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SVGIcons.smallStarIcon(),
                      Text("4.5",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  AppButton(
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
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
        top: 95,
        left: 280,
        child: ImageView(
          isCircle: true,
          initialImg:
              "https://user-images.githubusercontent.com/909587/41255217-16003a28-6dc6-11e8-87ee-d25b37c7e440.png",
        ),
      )
    ]);
  }
}
