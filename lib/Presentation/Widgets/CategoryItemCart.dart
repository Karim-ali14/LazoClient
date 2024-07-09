import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';

class CategoryItemCart extends StatelessWidget {
  final String image;
  final String title;
  final double width;
  final double height;
  const CategoryItemCart(
      {super.key,
      required this.image,
      required this.title,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.appGrey8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageView(
            width: 32,
            height: 32,
            initialImg: image,
            placeHolder: placeholder,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w400,
          )
        ],
      ),
    );
  }
}
