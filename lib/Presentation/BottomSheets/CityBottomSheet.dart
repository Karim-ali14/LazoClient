import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class CityBottomSheet extends ConsumerStatefulWidget {
  final Country country;
  final String? cityId;
  final Function(City)? onCitySelected;
  final Function()? onChangeCountry;
  final Function()? onClose;
  const CityBottomSheet(
      {super.key, required this.country, this.cityId, this.onCitySelected, this.onChangeCountry,this.onClose,});

  @override
  ConsumerState<CityBottomSheet> createState() => _CityBottomSheetState();
}

class _CityBottomSheetState extends ConsumerState<CityBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(getCities);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    widget.onClose?.call();
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Send to",
            style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts18w400,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ImageView(
                initialImg: widget.country.flag.toString(),
                width: 24.w,
                height: 18.h,
              ),
              SizedBox(
                width: 8.h,
              ),
              Text(
                widget.country.name.toString(),
                style:
                    AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  widget.onChangeCountry?.call();
                },
                child: Text(
                  "Change",
                  style: AppTheme
                      .styleWithTextBlack2AdelleSansExtendedFonts14w400
                      .copyWith(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          const Text(
            "City",
            style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts18w400,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      child: SizedBox(
                        height: 29.h,
                        child: Row(
                          children: [
                            Text(
                              cities.data?.data[index].name ?? "",
                              style: AppTheme
                                  .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                            ),
                            const Spacer(),
                            widget.cityId == cities.data?.data[index].id.toString()
                            ? SVGIcons.localSVG(selectedItemIcons, width: 24.w, height: 24.h,) : const SizedBox(),
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.onCitySelected!(cities.data!.data[index]);
                        context.pop();
                      },
                    ),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: AppTheme.appGrey6,
                ),
                itemCount: cities.data?.data.length ?? 0),
          ),
        ],
      ),
    );
  }
}
