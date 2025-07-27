import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Presentation/Widgets/TextPrice.dart';

import '../../../Localization/Keys.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/SvgIcons.dart';

class Walletscreen extends ConsumerStatefulWidget {
  const Walletscreen({super.key});

  @override
  ConsumerState<Walletscreen> createState() => _WalletscreenState();
}

class _WalletscreenState extends ConsumerState<Walletscreen> {
  @override
  Widget build(BuildContext context) {
    var client = ref.watch(clientStateProvider);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Wallet",
        isCenter: false,
        navigated: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal,vertical: 24),
            width: double.infinity,
            height: 152.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Wallet Balance",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w700,),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 51.h,
                  width: 171.w,
                  decoration: BoxDecoration(
                    color: AppTheme.appPink,
                  ),
                  child: Center(child: TextPrice("${client?.client?.balance}")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
