import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

class CartItemView extends StatefulWidget {
  const CartItemView({super.key});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border.all(
          color: AppTheme.appGrey6,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1)
                  ),
                  child: ImageView(
                    width: 74,
                    height: 74,
                    initialImg: "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649",
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text(
                      "Name of product",
                      style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Extra Item 1 - Extra Item 2 - Extra Item 1 - Extra Item 2",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts10w400,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SAR 350",style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "SAR 450",
                          style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400.copyWith(
                            decoration: TextDecoration.lineThrough
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Row(
                  children: <Widget>[
                    SVGIcons.incrementButtonSvgIcon(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.5),
                      child: Text("1"),
                    ),
                    SVGIcons.decrementButtonSvgIcon(),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.mainAppColorLight2,
                      borderRadius: BorderRadius.circular(4)),
                  height: 26,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SVGIcons.editIcon(),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Edit",
                        style: AppTheme
                            .styleWithTextMainAppColorAdelleSansExtendedFonts12w400,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
