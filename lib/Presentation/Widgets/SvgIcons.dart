import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants.dart';
import '../../Constants/Assets.dart';

class SVGIcons {
  static Widget shareIcon(){
    return SvgPicture.asset(
      shareIconSvg,
      color: Colors.white,
      width: 40,
      height: 40,
    );
  }
  static Widget itemsIcon(){
    return SvgPicture.asset(
      itemsIconSvg,
      color: Colors.white,
      width: 30,
      height: 30,
    );
  }

  Widget networkSVG(link){
    return SvgPicture.network(
      link,
      color: Colors.white,
      width: 50,
      height: 50,
    );
  }

  static Widget appLogoIcon({double width = 40, double height = 40,Color color = Colors.white}){
    return SvgPicture.asset(
      whiteSplashAppLogo,
      color: color,
      width: width,
      height: height,
    );
  }

  static Widget onBoardingOneIcon(){
    return SvgPicture.asset(
      onBoardingOneIconSvg
    );
  }

  static Widget onBoardingTwoIcon(){
    return SvgPicture.asset(
        onBoardingTwoIconSvg
    );
  }

  static Widget onBoardingThreeIcon(){
    return SvgPicture.asset(
        onBoardingThreeIconSvg
    );
  }

}