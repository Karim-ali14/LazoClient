import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';

import '../../Constants.dart';
import '../../Constants/Assets.dart';

class SVGIcons {
  static Widget shareIcon() {
    return SvgPicture.asset(
      shareIconSvg,
      color: Colors.white,
      width: 40,
      height: 40,
    );
  }
  static Widget localSVG(String assetPath, {double width = 50, double height = 50 , Color? color,BoxFit? fit}) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      color: color,
      fit: fit ?? BoxFit.fitHeight,
    );
  }

  static Widget localGIF(String assetPath, {double width = 50, double height = 50 , Color? color}) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      color: color,
    );
  }

  static Widget localJson(String assetPath, {double width = 50, double height = 50,AnimationController? controller}) {
    return Lottie.asset(
      assetPath,
      width: width,
      height: height,
      controller: controller
    );
  }

  static Widget defaultUserIcon(){
    return SvgPicture.asset(
      defaultUserImg,
      width: 43,
      height: 43,
    );
  }
  static Widget itemsIcon() {
    return SvgPicture.asset(
      itemsIconSvg,
      color: Colors.white,
      width: 30,
      height: 30,
    );
  }

  Widget networkSVG(link) {
    return SvgPicture.network(
      link,
      color: Colors.white,
      width: 50,
      height: 50,
    );
  }

  static Widget appLogoIcon(
      {double width = 40, double height = 40, Color color = Colors.white}) {
    return SvgPicture.asset(
      whiteSplashAppLogo,
      color: color,
      width: width,
      height: height,
    );
  }

  static Widget editIcon({double? width, double? height , Color color = AppTheme.mainAppColorDark}) {
    return SvgPicture.asset(
      editIconSvg,
      width: width,
      height: height,
      color: color,
    );
  }

  static Widget placeHolderForPickImagesSvgIcon() {
    return SvgPicture.asset(placeHolderForPickImagesSvg);
  }

  static Widget defaultUseIconSvgIcon() {
    return SvgPicture.asset(defaultUseIconSvg);
  }

  static Widget editPhoneImgSvgIcon() {
    return SvgPicture.asset(editPhoneImgSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown);
  }

  static Widget bottomRedArrowIcon({Color? color}) {
    return SvgPicture.asset(bottomRedArrowSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown,color: color,);
  }

  static Widget searchIcon({Color? color}) {
    return SvgPicture.asset(searchIconSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown,color: color,);
  }

  static Widget filterIcon(Color? color) {
    return SvgPicture.asset(filterIconSvg,
        width: 18, height: 14, fit: BoxFit.scaleDown,color: color,);
  }

  static Widget smallStarIcon({double size = 13}) {
    return SvgPicture.asset(smallStarIconSvg,
        width: size, height: size, fit: BoxFit.fill);
  }

  static Widget onBoardingOneIcon() {
    return SvgPicture.asset(onBoardingOneIconSvg);
  }

  static Widget closeSquareSvgIcon() {
    return SvgPicture.asset(closeSquareSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown);
  }

  static Widget searchSvgIcon() {
    return SvgPicture.asset(searchSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown);
  }

  static Widget unFavoriteIcon() {
    return SvgPicture.asset(unFavoriteIconSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown);
  }

  static Widget promotedIcon() {
    return SvgPicture.asset(promotedIconSvg,
        width: 24, height: 24, fit: BoxFit.scaleDown);
  }

  static Widget noTopSellerDataIcon() {
    return SvgPicture.asset(noTopSellerDataIconSvg);
  }

  static Widget rightIcon() {
    return SvgPicture.asset(
      rightIconSvg,
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
    );
  }

  static Widget onBoardingTwoIcon() {
    return SvgPicture.asset(onBoardingTwoIconSvg);
  }

  static Widget notificationSvgIcon() {
    return SvgPicture.asset(notificationIconSvg);
  }

  static Widget smallLocationIcon() {
    return SvgPicture.asset(smallLocationIconSvg);
  }

  static Widget locationIcon() {
    return SvgPicture.asset(
      locationIconSvg,
      fit: BoxFit.scaleDown,
      color: AppTheme.mainAppColorDark,
    );
  }

  static Widget onBoardingThreeIcon() {
    return SvgPicture.asset(onBoardingThreeIconSvg);
  }

  static Widget homeActiveIcon() {
    return SvgPicture.asset(
      homeActiveImg,
    );
  }

  static Widget homeUnActiveIcon() {
    return SvgPicture.asset(homeUnActiveImg);
  }

  static Widget notificationActiveIcon() {
    return SvgPicture.asset(notificationActiveImg);
  }

  static Widget notificationUnActiveIcon() {
    return SvgPicture.asset(notificationUnActiveImg);
  }

  static Widget profileActiveIcon() {
    return SvgPicture.asset(profileActiveImg);
  }

  static Widget profileUnActiveIcon() {
    return SvgPicture.asset(profileUnActiveImg);
  }

  static Widget orderActiveIcon() {
    return SvgPicture.asset(orderFullSvg);
  }

  static Widget redTriangleIcon() {
    return SvgPicture.asset(redTriangleSvg);
  }

  static Widget emptyStarIcon() {
    return SvgPicture.asset(
        width: 24, height: 24, emptyStarSvg, fit: BoxFit.scaleDown);
  }

  static Widget halfStarIcon() {
    return SvgPicture.asset(
        width: 24, height: 24, halfStarSvg, fit: BoxFit.scaleDown);
  }

  static Widget fullStarIcon() {
    return SvgPicture.asset(
        width: 24, height: 24, fullStarSvg, fit: BoxFit.scaleDown);
  }

  static Widget orderUnActiveIcon() {
    return SvgPicture.asset(orderUnActivePng);
  }

  static Widget hartActiveIcon() {
    return SvgPicture.asset(heartFullSvg);
  }

  static Widget hartUnActiveIcon() {
    return SvgPicture.asset(heartUnActiveSvg);
  }

  static Widget placeholderIcon() {
    return SvgPicture.asset(
      placeHolderForCardsSvg,
      fit: BoxFit.cover,
    );
  }

  static Widget searchGifIcon() {
    return Image.asset(
      searchIconGif,
      width: 138,
      height: 138,
      fit: BoxFit.fill,
    );
  }

  static Widget noCartItemsGifIcon() {
    return Image.asset(
      noCartItems,
      width: 138,
      height: 138,
      fit: BoxFit.fill,
    );
  }

  static Widget existGifIcon() {
    return Image.asset(
      existIconGif,
      width: 138,
      height: 138,
      fit: BoxFit.fill,
    );
  }

  static Widget wishlistGifIcon() {
    return Image.asset(
      wishlist,
      width: 138,
      height: 138,
      fit: BoxFit.fill,
    );
  }

  static Widget basketGifIcon() {
    return Image.asset(
      basketIc,
      width: 138,
      height: 138,
      fit: BoxFit.fill,
    );
  }

  static Widget wrongIcGifIcon() {
    return Image.asset(
      wrongIc,
      width: 84,
      height: 84,
      fit: BoxFit.fill,
    );
  }

  static Widget langIcon() {
    return SvgPicture.asset(
      langImg,
    );
  }

  static Widget deleteAccountIcon() {
    return SvgPicture.asset(
      deleteAccountImg,
    );
  }

  static Widget signOutIcon() {
    return SvgPicture.asset(
      signOutImg,
    );
  }

  static Widget privacyPolicyIcon() {
    return SvgPicture.asset(
      privacyPolicyImg,
    );
  }

  static Widget termsConditionsImgIcon() {
    return SvgPicture.asset(
      termsConditionsImg,
    );
  }

  static Widget shareImgIcon() {
    return SvgPicture.asset(
      shareImg,
    );
  }

  static Widget faqIcon() {
    return SvgPicture.asset(
      faqImg,
    );
  }

  static Widget contactUsIcon() {
    return SvgPicture.asset(
      contactUsImg,
    );
  }

  static Widget whatsAppImgIcon() {
    return SvgPicture.asset(
      whatsAppImg,
    );
  }

  static Widget redFaqIcon() {
    return SvgPicture.asset(
      contactFaqImg,
    );
  }

  static Widget messageIcon() {
    return SvgPicture.asset(
      messageImg,
    );
  }

  static Widget callingIcon() {
    return SvgPicture.asset(
      callingImg,
    );
  }

  static Widget calendarImageIcon() {
    return SvgPicture.asset(
      calendarImage,
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
      color: AppTheme.mainAppColorDark,
    );
  }

  static Widget timeCircleIcon() {
    return SvgPicture.asset(
      timeCircle,
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
      color: AppTheme.mainAppColorDark,
    );
  }

  static Widget sadFaceIcon() {
    return SvgPicture.asset(
      sadFaceImg,
    );
  }

  static Widget buyIcon() {
    return SvgPicture.asset(
      buy,
    );
  }

  static Widget appIcon() {
    return SvgPicture.asset(
      lazoOrderIcons,
    );
  }

  static Widget activeBuyIcon() {
    return SvgPicture.asset(
      activeBuy,
    );
  }

  static Widget deleteAccountIcIcon() {
    return SvgPicture.asset(
      deleteAccountIc,
    );
  }

  static Widget rightArrowWithBackgroundIcon() {
    return SvgPicture.asset(
      rightArrowWithBackgroundImg,
    );
  }

  static Widget downArrowWithBackgroundIcon() {
    return SvgPicture.asset(
      downArrowImg,
      color: Colors.black,
    );
  }

  static Widget backArrowIcon() {
    return SvgPicture.asset(
      backArrowImg,
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
    );
  }

  static Widget downArrowIcon() {
    return SvgPicture.asset(
      downArrowImg,
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
    );
  }

  static Widget upArrowWithBackgroundIcon() {
    return SvgPicture.asset(
      upArrowIcon,
      color: Colors.black,
    );
  }

  static Widget walletWithWhiteBackgroundIcon() {
    return SvgPicture.asset(
      walletWithWhiteBackgroundIconSvg,
    );
  }

  static Widget activeFavoriteIcon() {
    return SvgPicture.asset(
      activeFavoriteIconSvg,
      width: 28,
      height: 28,
      fit: BoxFit.fill
    );
  }

  static Widget unFavoriteIconWithLightRedIcon() {
    return SvgPicture.asset(
      unFavoriteIconWithLightRedSvg,
      width: 28,
      height: 28,
      fit: BoxFit.fill,
    );
  }

  static Widget smallShareIcon() {
    return SvgPicture.asset(
      smallShareIconSvg,
    );
  }

  static Widget incrementButtonSvgIcon() {
    return SvgPicture.asset(
      incrementButtonIconSvg,
      width: 24.w,
      height: 24.h,
    );
  }

  static Widget decrementButtonSvgIcon() {
    return SvgPicture.asset(
      decrementButtonIconSvg,
      width: 24.w,
      height: 24.h,
    );
  }

  static Widget buyFullIconSvgIcon() {
    return SvgPicture.asset(
      buyFullIconSvg,
    );
  }

  static Widget voucherIcon() {
    return SvgPicture.asset(
      voucherIconSvg,
      width: 23,
      height: 15,
      fit: BoxFit.scaleDown,
    );
  }

  static Widget calendarIcon() {
    return SvgPicture.asset(
      calendarImg,
    );
  }

  static Widget documentIcon() {
    return SvgPicture.asset(
      documentImg,
    );
  }

  static Widget numberOfItemsIcon() {
    return SvgPicture.asset(
      numberOfItemsImg,
    );
  }

  static Widget totalPriceIcon() {
    return SvgPicture.asset(
      totalPriceImg,
    );
  }
}
