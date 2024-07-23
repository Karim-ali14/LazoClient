import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/Screens/home/HomeScreen.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';

import '../../../Constants/Constants.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/SvgIcons.dart';

class MainScreenNavHost extends ConsumerStatefulWidget {
  const MainScreenNavHost({super.key});

  @override
  ConsumerState<MainScreenNavHost> createState() => _MainScreenNavHostState();
}

class _MainScreenNavHostState extends ConsumerState<MainScreenNavHost> {
  int currentTab = 0;
  Widget currentScreen = HomeScreen();
  final listTabsName = ["Home", "orders", "more"];

  @override
  Widget build(BuildContext context) {
    final client = ref.read(clientStateProvider.notifier).checkIfUserExist();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            appContext: context,
            title: currentTab == 0
                ? client == null
                    ? "Hi There"
                    : "Hi ${client.client?.name}"
                : listTabsName[currentTab],
            isCenter: false,
            navigated: false,
            trailingWidget: AppBarTrailing(currentTab: currentTab),
          )),
      body: currentScreen,
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
                      currentScreen = HomeScreen();
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
                        listTabsName[currentTab],
                        style: currentTab == 0
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
