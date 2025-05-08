import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../../Constants/Eunms.dart';
import '../Theme/AppTheme.dart';
import '../Widgets/SvgIcons.dart';

class AddCollectionBottomSheet extends StatelessWidget {
  final Function(String) onCreateCollection;
  final Function()? onDeleteCollection;
  final TextEditingController? controller;
  final CollectionProcess? type;
  const AddCollectionBottomSheet(
      {super.key,
      required this.onCreateCollection,
      this.controller,
      this.type = CollectionProcess.AddCollection,
      this.onDeleteCollection});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            width: double.infinity,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    "New Collection",
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
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppTheme
                        .styleWithTextBlack2AdelleSansExtendedFonts12w400,
                    controller: controller ?? TextEditingController(),
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: AppTheme
                          .styleWithTextBlackColorAdelleSansExtendedFonts12w600,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppTheme.appGrey17.withOpacity(.2))),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppTheme.appGrey17.withOpacity(.5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppTheme.appGrey17.withOpacity(.2))),
                    ),
                  ),
                ),
                type == CollectionProcess.EditCollection
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Manage",
                              style: AppTheme
                                  .styleWithTextBlackColorAdelleSansExtendedFonts12w600,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InkWell(
                                onTap: () {
                                  context.pop();
                                  onDeleteCollection?.call();
                                },
                                child: const Text(
                                  "Delete Collection",
                                  style: AppTheme
                                      .styleWithTextAppRedColorAdelleSansExtendedFonts14w400,
                                ))
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 24,
                ),
                AppButton(
                    width: double.infinity,
                    text: "Done",
                    height: 46.h,
                    onPress: () {
                      if (controller?.text.isNotEmpty == true) {
                        context.pop();
                        onCreateCollection.call(controller?.text ?? "");
                        controller?.text = "";
                      }
                    }),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
