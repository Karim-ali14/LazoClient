import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import '../../../../Constants/Assets.dart';
import '../../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../../Widgets/SvgIcons.dart';

class ClientInfoCard extends StatelessWidget {
  final VoidCallback? onTap;
  const ClientInfoCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final client = ref.watch(clientStateProvider);

      return Row(
        children: [
          Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.appGrey20,
              ),
              child: Center(
                child: Text(
                  client?.client?.name?[0] ?? "",
                  style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts38w500,
                ),
              )),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client?.client?.name ?? "",
                  style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: (){
                    onTap?.call();
                  },
                  child: Row(
                    children: [
                      SVGIcons.localSVG(editProfileIcon,width: 16,height: 16),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        "View/Edit Profile",
                        style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts12w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
