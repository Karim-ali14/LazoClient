import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Data/Models/ItemSelector.dart';
import '../Theme/AppTheme.dart';
import 'Auth/Componants/CustomSelectorBottomSheet.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController promotionTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        isCenter: false,
        title: "Filter",
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showCitesBottomSheet(context);
              },
              child: AppTextField(
                readOnly: true,
                disabled: true,
                hint: "Promotion",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                label: "Promotion",
                labelStyle:
                    AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textEditingController: promotionTextController,
                endWidget: SVGIcons.rightIcon(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AppTextField(
              readOnly: true,
              disabled: true,
              hint: "Categories",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textFieldBorderColor: AppTheme.appGrey8,
              label: "Categories",
              labelStyle:
                  AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textEditingController: promotionTextController,
              endWidget: SVGIcons.rightIcon(),
            ),
            SizedBox(
              height: 16,
            ),
            AppTextField(
              readOnly: true,
              disabled: true,
              hint: "Occasions",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textFieldBorderColor: AppTheme.appGrey8,
              label: "Occasions",
              labelStyle:
                  AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textEditingController: promotionTextController,
              endWidget: SVGIcons.rightIcon(),
            ),
            SizedBox(
              height: 16,
            ),
            AppTextField(
              readOnly: true,
              disabled: true,
              hint: "Rating",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textFieldBorderColor: AppTheme.appGrey8,
              label: "Rating",
              labelStyle:
                  AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
              textEditingController: promotionTextController,
              endWidget: SVGIcons.rightIcon(),
            ),
            SizedBox(height: 24),
            AppButton(
                height: 48,
                width: double.infinity,
                onPress: () {},
                text: "Apply")
          ],
        ),
      )),
    );
  }

  void showCitesBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext context) {
          return CustomSelectorBottomSheet(
              context: context,
              btuName: "Choose",
              enableSearch: false,
              title: "Choose Promotion",
              widgetList: [
                ItemSelector(0, "Promoted", null),
                ItemSelector(1, "Not Promoted", null)
              ].toList(),
              searchHint: "Search by",
              itemSelectedId: 0,
              isSingleSelect: false,
              onSelectMultiItemsCallback: (items) {},
              onSelectItemCallback: (itemid) {});
        });
  }
}
