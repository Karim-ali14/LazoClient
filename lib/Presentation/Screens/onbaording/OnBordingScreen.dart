import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Constants.dart';
import '../../../Constants/Constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  var isLastPage = false;
  final images = [
    SVGIcons.onBoardingOneIcon(),
    SVGIcons.onBoardingTwoIcon(),
    SVGIcons.onBoardingThreeIcon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SVGIcons.appLogoIcon(),
                SizedBox(
                  height: 450,
                  child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notificationDetails) {
                        if (pageController.page == 2) {
                          setState(() {
                            isLastPage = true;
                          });
                        } else {
                          setState(() {
                            isLastPage = false;
                          });
                        }
                        return true;
                      },
                      child: PageView.builder(
                        itemCount: 3,
                        controller: pageController,
                        itemBuilder:(context,index) => Column(
                          children: [
                            images[index],
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Lorem ipsum dolor sit amet consectetur Sed.",
                                textAlign: TextAlign.center,
                                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  ConstantsMethods.getOnBoardingContentList(
                                      context)[index],
                                  style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400.copyWith(height: 1.5)),
                            ),

                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      )),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                        width: 12,
                        height: 2,
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.mainAppColorLight),
                    activeDotDecoration: DotDecoration(
                        width: 12,
                        height: 2,
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.mainAppColor),
                  ),
                  onDotClicked: (index) {
                    pageController.animateToPage(index,
                        duration: const Duration(microseconds: 200),
                        curve: Curves.easeIn);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                isLastPage
                    ? AppButton(
                  text: "Let’s Start",
                  onPress: getStarted,
                  width: context.getScreenSize.width * .95,
                  height: 56,
                )
                    : const SizedBox()
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(onTap: getStarted, child: const Text("Skip")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getStarted(){

  }
}
