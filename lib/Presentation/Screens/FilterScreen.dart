import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Data/Models/ItemSelector.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';
import 'Auth/Componants/CustomSelectorBottomSheet.dart';

class FilterScreen extends ConsumerStatefulWidget {
  final FilterScreenTypes type;
  const FilterScreen({required this.type, super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<ItemSelector> categoriesList = [];
  List<ItemSelector> occasionsList = [];
  final TextEditingController promotionTextController = TextEditingController();
  final TextEditingController categoryTextController = TextEditingController();
  final TextEditingController occasionTextController = TextEditingController();
  int? promotionSelected = null;
  List<int>? categoriesSelected = null;
  List<int>? occasionsSelected = null;
  List<int>? ratingSelected = null;
  FilterData? filterData = null;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.type == FilterScreenTypes.Products) {
        filterData = ref.watch(filterForProductStateNotifiers);
      } else if (widget.type == FilterScreenTypes.Services) {
        filterData = ref.watch(filterForServiceStateNotifiers);
      } else if (widget.type == FilterScreenTypes.Sellers) {
        filterData = ref.watch(filterForSellerStateNotifiers);
      }
      promotionSelected = filterData?.promotionSelected;

      categoriesSelected = filterData?.categoriesIdsSelected;

      occasionsSelected = filterData?.occasionsIdsSelected;

      ratingSelected = filterData?.ratingValueSelected;

      setDefaultData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(getCategoriesDataStateNotifiers);
    final occasionsState = ref.watch(getOccasionsDataStateNotifiers);

    if (categoryState.state == DataState.SUCCESS) {
      categoriesList = categoryState.data?.data
              .map((item) => ItemSelector(
                  item.id?.toInt() ?? 0, item.name ?? "", null,
                  isChecked: item.isChecked ?? false))
              .toList() ??
          [];
    } else {
      categoriesList = [];
    }

    if (occasionsState.state == DataState.SUCCESS) {
      occasionsList = occasionsState.data?.data
              .map((item) => ItemSelector(
                  item.id?.toInt() ?? 0, item.name ?? "", null,
                  isChecked: item.isChecked ?? false))
              .toList() ??
          [];
    } else {
      occasionsList = [];
    }

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        isCenter: false,
        title: "Filter",
        navigated: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showPromotionBottomSheet(context);
              },
              child: AppTextField(
                readOnly: true,
                disabled: true,
                hint: "Promotion",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                label: "Promoted",
                labelStyle:
                    AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textEditingController: promotionTextController,
                endWidget: SVGIcons.rightIcon(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showCategoriesBottomSheet(context, categoriesList,
                    afterSuccessSelectMultiItems: (items) {
                  categoriesSelected = items;
                  setDefaultCategoriesText(
                      categoryState.data?.data ?? [], items);
                  // ref
                  //     .read(getCategoriesDataStateNotifiers.notifier)
                  //     .selectCategoriesInMainList(items);
                });
              },
              child: AppTextField(
                readOnly: true,
                disabled: true,
                hint: "Categories",
                maxLines: 1,
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                label: "Categories",
                labelStyle:
                    AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textEditingController: categoryTextController,
                endWidget: SVGIcons.rightIcon(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showOccasionsBottomSheet(context, occasionsList,
                    afterSuccessSelectMultiItems: (items) {
                      occasionsSelected = items;
                      setDefaultOccasionsText(
                          occasionsState.data?.data ?? [], items);
                    });
              },
              child: AppTextField(
                readOnly: true,
                disabled: true,
                hint: "Occasions",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                label: "Occasions",
                labelStyle:
                    AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textEditingController: occasionTextController,
                endWidget: SVGIcons.rightIcon(),
              ),
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
                onPress: () {
                  ref
                      .read(filterForSellerStateNotifiers.notifier)
                      .applyDataFilter(
                          promotionSelected: promotionSelected,
                          categoriesIdsSelected: categoriesSelected);
                },
                text: "Apply")
          ],
        ),
      )),
    );
  }

  void showPromotionBottomSheet(BuildContext context) {
    print("filterForSellerStateNotifiers : ${promotionSelected}");

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
                ItemSelector(1, "Promoted", null),
                ItemSelector(0, "Not Promoted", null)
              ].toList(),
              searchHint: "Search by",
              itemSelectedId: promotionSelected,
              isSingleSelect: true,
              onSelectMultiItemsCallback: (items) {},
              onSelectItemCallback: (itemid) {
                promotionSelected = itemid;
                promotionTextController.text =
                    promotionSelected == 1 ? "Promoted" : "Not Promoted";

                Navigator.pop(context);
              });
        });
  }

  void showCategoriesBottomSheet(BuildContext context, List<ItemSelector> list,
      {Function(List<int>)? afterSuccessSelectMultiItems}) {
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
              title: "Choose Categories",
              widgetList: list,
              searchHint: "Search by",
              itemSelectedIds: categoriesSelected,
              isSingleSelect: false,
              onSelectMultiItemsCallback: (items) {
                afterSuccessSelectMultiItems?.call(items);
                Navigator.pop(context);
              },
              onSelectItemCallback: (itemid) {
                Navigator.pop(context);
              });
        });
  }

  void showOccasionsBottomSheet(BuildContext context, List<ItemSelector> list,
      {Function(List<int>)? afterSuccessSelectMultiItems}) {
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
              title: "Choose Occasions",
              widgetList: list,
              searchHint: "Search by",
              itemSelectedIds: occasionsSelected,
              isSingleSelect: false,
              onSelectMultiItemsCallback: (items) {
                afterSuccessSelectMultiItems?.call(items);
                Navigator.pop(context);
              },
              onSelectItemCallback: (itemid) {
                Navigator.pop(context);
              });
        });
  }

  void setDefaultCategoriesText(
      List<Category> mainCategoriesList, List<int> items) {
    var text = mainCategoriesList
            .where((item) =>
                items.any((id) {
                  print(id == item.id);
                  return id == item.id;
                }) ??
                false)
            .map((item) => item.name)
            .join(", ") ??
        "";
    print(text);
    if (text.length >= 47) {
      text = "${text.substring(0, 46)}...";
    }
    categoryTextController.text = text;
  }

  void setDefaultOccasionsText(
      List<Occasion> mainCategoriesList, List<int> items) {
    var text = mainCategoriesList
            .where((item) =>
                items.any((id) {
                  print(id == item.id);
                  return id == item.id;
                }) ??
                false)
            .map((item) => item.name)
            .join(", ") ??
        "";
    print(text);
    if (text.length >= 47) {
      text = "${text.substring(0, 46)}...";
    }
    occasionTextController.text = text;
  }

  void setDefaultData() {
    promotionTextController.text = promotionSelected != null
        ? promotionSelected == 0
            ? "Not Promoted"
            : "Promoted"
        : "";
    setDefaultCategoriesText(
        ref.watch(getCategoriesDataStateNotifiers).data?.data ?? [],
        categoriesSelected ?? []);
    setDefaultOccasionsText(
        ref.watch(getOccasionsDataStateNotifiers).data?.data ?? [],
        categoriesSelected ?? []);
  }
}
