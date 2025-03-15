import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

class EmptyDataView extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? description;
  final String? btuName;
  final VoidCallback? btuAction;
  const EmptyDataView({super.key, this.icon, this.title, this.description, this.btuName, this.btuAction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 300,
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
                title??"",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
              ),
              title != null
                  ? SizedBox(
                      height: 24,
                    )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("$description",
                    style: AppTheme
                        .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                        .copyWith(height: 1.5),
                    textAlign: TextAlign.center),
              ),
              description != null
                  ? SizedBox(
                      height: 24,
                    )
                  : SizedBox(),
              btuName != null ?
              Padding(
                padding: const EdgeInsets.all(defaultPaddingHorizontal),
                child: AppButton(
                    width: double.infinity,
                    height: 48,
                    text: btuName,
                    outlined: true,
                    backColor: AppTheme.appRedColor,
                    onPress: () {
                      btuAction?.call();
                    }),
              )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
