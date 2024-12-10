import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/CartScreen.dart';
import 'package:lazo_client/Presentation/Screens/home/HomeScreen.dart';
import 'package:lazo_client/Presentation/Screens/orders/OrdersScreen.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/WishlistScreen.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';

import '../../../Constants/Constants.dart';
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
  int currentTab = 0;
  Widget currentScreen = const HomeScreen();
  final listTabsName = ["Home", "Orders" ,"Cart", "Wishlist", "More"];
  var pages = [HomeScreen(), OrdersScreen() ,CartScreen(), WishListScreen(), MoreScreen()];

  void rebuildMainScreen() {
    setState(() {
      pages = [HomeScreen(), OrdersScreen() ,CartScreen(), WishListScreen(), MoreScreen()];
    });
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            appContext: context,
            title: currentTab == 0
                ? client == null
                    ? context.tr(hiThereKey)
                    : "${context.tr(hiKey)} ${client.client?.name}"
                : listTabsName[currentTab],
            isCenter: false,
            navigated: false,
            trailingWidget: AppBarTrailing(currentTab: currentTab),
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
                  minWidth: 40,
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
                      SizedBox(
                        height: 3,
                      ),
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
                  minWidth: 40,
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
                      SizedBox(
                        height: 3,
                      ),
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
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                      currentScreen = const CartScreen();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 2
                          ? SVGIcons.activeBuyIcon()
                          : SVGIcons.buyIcon(),
                      SizedBox(
                        height: 3,
                      ),
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
                      currentScreen = const WishListScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 3
                          ? SVGIcons.hartActiveIcon()
                          : SVGIcons.hartUnActiveIcon(),
                      SizedBox(
                        height: 6,
                      ),
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
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const MoreScreen();
                      currentTab = 4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == 4
                          ? SVGIcons.moreActiveIcon()
                          : SVGIcons.moreUnActiveIcon(),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        listTabsName[4],
                        style: currentTab == 4
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
        case 2:
          currentScreen = const CartScreen();
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
                  SVGIcons.smallLocationIcon(),
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
                      child: SVGIcons.notificationSvgIcon()),
                  Positioned(
                    right: 4,
                    top: 1,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.mainAppColor),
                    ),
                  )
                ]),
              )
            ],
          ));
    }
    return const SizedBox();
  }
}
