import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Widgets/BannerCardItems.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TruncatedText.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerCardItems(
                list: [""],
                height: 149,
                width: MediaQuery.of(context).size.width,
                showLoading: true,
                showIndicator: false,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  TruncatedText(
                      text: "Name of product Saudi Arabic",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      maxLength: 30),
                  Spacer(),
                  Text(
                    "12 In Stock",
                    style: AppTheme
                        .styleWithTextPreparingColorAdelleSansExtendedFonts14w400,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SAR 350",
                    style:
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts20w700,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "SAR 450",
                    style: AppTheme
                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SVGIcons.smallStarIcon(),
                      Text(
                        "5.0",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts14w400,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "(500)",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "All prices include VAT",
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Description",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,
              ),
              SizedBox(
                height: 10,
              ),
              SeeMoreAndLessTextView(
                textValue: "hghghhghgh a sdlf slkdf ;laksjd flsj dflkjs dlkfj sldkjf lksd fklsjd fkjs dklfj sdkljf lksdj flksdj flksj dflk jdkfj ;alkjf a;lks fas dlfkj sldf jlksdjf lsdj fls dlkfj sldkjf lksdjf lksdj flsdj flkj sdlkf jldksj kdsajf l;adskj flaksdj flksd jflkaj ",
                textStyle: AppTheme
                    .styleWithTextAppGrey15AdelleSansExtendedFonts14w400.copyWith(
                  height: 1.5
                ),
              ),
              SizedBox(
                height: 32,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
