import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Constants/Constants.dart';
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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      height: bottomSheetHeight,
      child: Column(
        // Set min size constraint
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "Contact Us",
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: MoreItemCard(
              startIcon: SVGIcons.callingIcon(),
              text: "Communicate by calling",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
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
              text: "WhatsApp",
              description:
                  "Start a conversation with a customer service representative",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
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
              text: "Email",
              description: "Contact us via email",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
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
              text: "FAQ",
              description: "Read the most frequently asked questions",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddingHorizontal),
              child: AppButton(
                onPress: () {
                  context.pop();
                },
                text: "Ok",
                width: double.infinity,
                height: 46,
              )),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
        ],
      ),
    );
  }
}
