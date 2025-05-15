import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class CountryBottomSheet extends StatefulWidget {
  final List<Country>? countries;
  final Function(Country)? onCountrySelected;
  const CountryBottomSheet(
      {super.key, this.countries, this.onCountrySelected,});

  @override
  State<CountryBottomSheet> createState() => _CountryBottomSheetState();
}

class _CountryBottomSheetState extends State<CountryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            width: double.infinity,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    "Select Country & City",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddingHorizontal),
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SVGIcons.localSVG(closeIconSvg,
                            width: 32, height: 32)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            "Country",
            style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts18w400,
          ),
          SizedBox(
            height: 10,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      child: SizedBox(
                        height: 29.h,
                        child: Row(
                          children: [
                            ImageView(
                              initialImg: widget.countries?[index].flag.toString(),
                              width: 24.w,
                              height: 18.h,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              widget.countries?[index].name.toString() ?? "",
                              style: AppTheme
                                  .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.onCountrySelected?.call(widget.countries![index]);
                        context.pop();
                      },
                    ),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: AppTheme.appGrey6,
                    ),
                itemCount: widget.countries?.length ?? 0),
          )
        ],
      ),
    );
  }
}
