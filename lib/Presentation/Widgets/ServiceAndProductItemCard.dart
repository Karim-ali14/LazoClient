import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';
import 'CircleImage.dart';

class ServiceAndProductItemCardHorizontal extends StatefulWidget {
  const ServiceAndProductItemCardHorizontal({super.key});

  @override
  State<ServiceAndProductItemCardHorizontal> createState() => _ServiceAndProductItemCardHorizontalState();
}

class _ServiceAndProductItemCardHorizontalState extends State<ServiceAndProductItemCardHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      child: Stack(
        children:[
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.appGrey6),
            ),
            child: Column(
              children: [
                ImageView(
                  width: MediaQuery.of(context).size.width,
                  height: 121,
                  initialImg:
                  "https://t4.ftcdn.net/jpg/04/54/47/13/360_F_454471303_WKG9h3VY9UxazqrtbJ2wYsqUGWSfo9CK.jpg",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flowers Costa Cabral",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts14w500,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("SAR 350",style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,),
                          SizedBox(
                            width: 5,
                          ),
                          Text("SAR 450",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400
                              .copyWith(
                              decoration: TextDecoration.lineThrough
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SVGIcons.smallStarIcon(),
                              Text("4.5",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,),
                            ],
                          ),
                          Spacer(),
                          Text("(500)",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,)
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      AppButton(
                        width: context.getScreenSize.width,
                        height: 32,
                        onPress: (){

                        },
                        child: Text(
                          "Add to cart",
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

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: SVGIcons.unFavoriteIcon(),
            ),
          )
        ]
      ),
    );
  }
}
