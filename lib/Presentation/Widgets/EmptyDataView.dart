import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

class EmptyDataView extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? description;
  const EmptyDataView({super.key, this.icon, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            icon != null
                ? SizedBox(
                    height: 32,
                  )
                : SizedBox(),
            Text(
              "$title",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
            ),
            title != null
                ? SizedBox(
                    height: 24,
                  )
                : SizedBox(),
            Text(
              "$description",
              style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                  .copyWith(height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}
