import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/home/HomeScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/OrdersScreen.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/WishlistScreen.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Localization/Keys.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/SvgIcons.dart';
import '../More/MoreScreen.dart';

class MainScreenNavHost extends ConsumerStatefulWidget {
  const MainScreenNavHost({super.key});

  @override
  ConsumerState<MainScreenNavHost> createState() => MainScreenNavHostState();
}

class MainScreenNavHostState extends ConsumerState<MainScreenNavHost> {
  double _opacity = 0.8;
  int currentTab = 0;
  Widget currentScreen = const HomeScreen();
  final listTabsName = ["Home", "Orders", "Wishlist", "Profile"];
  var pages = [HomeScreen(), OrdersScreen(), WishListScreen(), MoreScreen()];

  void rebuildMainScreen() {
    setState(() {
      pages = [HomeScreen(), OrdersScreen(), WishListScreen(), MoreScreen()];
    });
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    final cartData = ref.watch(fetchCardDetailsStateNotifies);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(currentTab == 0 || currentTab == 2 ? 0 : 60),
          child: CustomAppBar(
            appContext: context,
            title: currentTab == 0 ? "" : listTabsName[currentTab],
            isCenter: false,
            navigated: false,
          )),
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey[100]!,
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(0, -1))
        ]),
        child: BottomAppBar(
          elevation: 20,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                      currentScreen = const HomeScreen();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 0
                          ? SVGIcons.homeActiveIcon()
                          : SVGIcons.homeUnActiveIcon(),
                      const SizedBox(height: 3),
                      Text(
                        listTabsName[0],
                        style: currentTab == 0
                            ? AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts11w500
                            : AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts11w500,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                      currentScreen = const OrdersScreen();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 1
                          ? SVGIcons.orderActiveIcon()
                          : SVGIcons.orderUnActiveIcon(),
                      const SizedBox(height: 3),
                      Text(
                        listTabsName[1],
                        style: currentTab == 1
                            ? AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts11w500
                            : AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts11w500,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const WishListScreen();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 2
                          ? SVGIcons.hartActiveIcon()
                          : SVGIcons.hartUnActiveIcon(),
                      const SizedBox(height: 6),
                      Text(
                        listTabsName[2],
                        style: currentTab == 2
                            ? AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts11w500
                            : AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts11w500,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const MoreScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 3
                          ? SVGIcons.profileActiveIcon()
                          : SVGIcons.profileUnActiveIcon(),
                      const SizedBox(height: 6),
                      Text(
                        listTabsName[3],
                        style: currentTab == 3
                            ? AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts11w500
                            : AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts11w500,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(R_CartScreen);
        },
        backgroundColor: AppTheme.appRedColor,
        child: Stack(
          children: [
            // Align(
            //     alignment: Alignment.center,
            //     child: SVGIcons.localSVG(cartIconSvg,width: 27,height: 26)),
            // (cartData.data?.data?.cartItems.length??0) > 0 ?PositionedDirectional(
            //   top: 9,
            //   start: 33,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.white,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(3),
            //       child: Text(
            //         cartData.data?.data?.cartItems.length.toString() ?? ""
            //         ,style: AppTheme.styleWithTextAppRedColorAdelleSansExtendedFonts8w700,
            //       ),
            //     ),
            //   ),
            // ) :
            const SizedBox()
          ],
        ),
      ),
    );
  }

  void onItemTapped(int tabIndex) {
    setState(() {
      switch (tabIndex) {
        case 0:
          currentScreen = const HomeScreen();
          break;
        case 1:
          currentScreen = const OrdersScreen();
          break;
        case 3:
          currentScreen = const WishListScreen();
          break;
        case 4:
          currentScreen = const MoreScreen();
          break;
      }
      currentTab = tabIndex;
    });
  }
}

class AppBarTrailing extends StatelessWidget {
  final int currentTab;
  const AppBarTrailing({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    if (currentTab == 0) {
      return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delivery To",
                    style: AppTheme.styleWithTextAppGrey17AdelleSansFonts14w350,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Riyadh",
                    style: AppTheme
                        .styleWithTextAppMainAppColor15AdelleSansExtendedFonts14w400,
                  )
                ],
              ),
              SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 24,
                child: Stack(children: [
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                          onTap: () {
                            context.push(R_NotificationScreen);
                          },
                          child: SVGIcons.notificationSvgIcon())),
                  // Positioned(
                  //   right: 4,
                  //   top: 1,
                  //   child: Container(
                  //     height: 6,
                  //     width: 6,
                  //     decoration: BoxDecoration(
                  //         shape: BoxShape.circle, color: AppTheme.mainAppColor),
                  //   ),
                  // )
                ]),
              )
            ],
          ));
    }
    return const SizedBox();
  }
}
