import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Constants.dart';
import '../../Constants/Assets.dart';
import '../../Constants/Eunms.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';
import 'SvgIcons.dart';
import 'TextWithoutPadding.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const AppScaffold({required this.body, this.appBar, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: Consumer(builder: (context,ref,_){
        final cartData = ref.watch(fetchCardDetailsStateNotifies);

        return (cartData.data?.data?.cartItems.length??0) > 0 ? FloatingActionButton(
          onPressed: () {
            context.push(R_CartScreen,extra: {"type":CheckoutTypes.HartCard});
          },
          backgroundColor: AppTheme.appRedColor,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SVGIcons.localSVG(cartIconSvg,width: 27,height: 26)),
              (cartData.data?.data?.cartItems.length??0) > 0 ?PositionedDirectional(
                top: 9,
                start: 33,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: TextWithoutPadding(
                      (cartData.data?.data?.cartItems.map((items) => items.items?.length ?? 0).fold(0, (prev,curr) => prev + curr)??0).toString() ?? ""
                      ,style: AppTheme.styleWithTextAppRedColorAdelleSansExtendedFonts8w700,
                    ),
                  ),
                ),
              ) :
              const SizedBox()
            ],
          ),
        ) : const SizedBox();
      }),
    );
  }
}
