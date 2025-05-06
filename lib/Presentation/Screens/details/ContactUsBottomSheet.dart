import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Localization/Keys.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/SvgIcons.dart';
import '../More/Componants/MoreItemCard.dart';

class ContactUsBottomSheet extends StatefulWidget {
  const ContactUsBottomSheet({super.key});

  @override
  State<ContactUsBottomSheet> createState() => _ContactUsBottomSheetState();
}

class _ContactUsBottomSheetState extends State<ContactUsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double bottomSheetHeight = MediaQuery.of(context).size.height *
        0.65; // Adjust this value as needed

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    context.tr(contactUsKey),
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                  ),
                ),
                InkWell(
                  onTap: () {
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
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.appGrey11.withOpacity(0.6), // Shadow color
                  blurRadius: .5, // Blur effect
                  spreadRadius: .1, // Spread effect
                  offset: const Offset(0, .5), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: MoreItemCard(
              startIcon: SVGIcons.callingIcon(),
              text: "Phone call",
              withDivider: false,
            ),
          ),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: MoreItemCard(
              startIcon: SVGIcons.whatsAppImgIcon(),
              text: context.tr(whatsAppKey),
              description:
                  context.tr(startAConversationWithACustomerServiceRepresentativeKey),
              withDivider: false,
            ),
          ),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: MoreItemCard(
              startIcon: SVGIcons.messageIcon(),
              text: context.tr(emailKey),
              description: context.tr(contactUsViaEmailKey),
              withDivider: false,
            ),
          ),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: MoreItemCard(
              startIcon: SVGIcons.redFaqIcon(),
              text: context.tr(faqKey),
              description: context.tr(readTheMostFrequentlyAskedQuestionsKey),
              withDivider: false,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
