import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CustomSelector.dart';
import 'package:lazo_client/Presentation/Widgets/ExpandedItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/FilterPriceView.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Constants/Assets.dart';
import '../../Constants/Eunms.dart';
import '../../Data/Models/FilterData.dart';
import '../../Data/Models/ItemSelector.dart';
import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';

typedef OnFilterApply = Function(FilterData);

class FilterBottomSheet extends ConsumerStatefulWidget {
  final FilterScreenTypes? type;
  final int? categoryId;
  final int? occasionId;
  final double? height;
  final OnFilterApply? onFilterApply;
  final FilterData? dataSelected;
  final bool? showCategory;
  const FilterBottomSheet( {
    super.key,
    this.height,
    this.type,
    this.categoryId,
    this.occasionId,
    this.onFilterApply,
    this.dataSelected,this.showCategory = true,
  });

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  List<ItemSelector> shipmentTypesList = [
    ItemSelector(0, "Ready made", null),
    ItemSelector(1, "Unready made", null),
  ];
  List<ItemSelector> categoriesList = [];
  List<ItemSelector> occasionsList = [];
  List<int> mainRatingList = [1, 2, 3, 4, 5];
  List<ItemSelector> ratingsList = [1, 2, 3, 4, 5]
      .map((item) => ItemSelector(
          item,
          "$item/5",
          Row(
            children: List.generate(
                item, (index) => SVGIcons.smallStarIcon(size: 14)),
          ),
          isChecked: false))
      .toList();
  int? promotionSelected = null;
  int? shipmentTypeSelected = null;
  List<int>? categoriesSelected = null;
  List<int>? occasionsSelected = null;
  List<int>? ratingSelected = null;
  String? priceFrom = null;
  String? priceTo = null;
  FilterData? filterData = null;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.dataSelected != null) {
        filterData = widget.dataSelected;
      }
      promotionSelected = filterData?.promotionSelected;
      shipmentTypeSelected = filterData?.shipmentTypeSelected;
      categoriesSelected = widget.categoryId != null
          ? [(widget.categoryId ?? 0).toInt()]
          : filterData?.categoriesIdsSelected;

      occasionsSelected = widget.occasionId != null
          ? [(widget.occasionId ?? 0).toInt()]
          : filterData?.occasionsIdsSelected;

      ratingSelected = filterData?.ratingValueSelected;

      priceFrom = filterData?.priceFromSelected;

      priceTo = filterData?.priceToSelected;

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
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Container(
            height: 64,
            decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10), topStart: Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.appGrey8.withOpacity(0.6), // Shadow color
                    blurRadius: .5, // Blur effect
                    spreadRadius: .1, // Spread effect
                    offset: const Offset(0, .5), // Shadow position
                  ),
                ]),
            child: Row(
              children: [
                const Spacer(),
                Center(child: Text(context.tr(filterKey))),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(onTap: (){
                    context.pop();
                  }, child: SVGIcons.localSVG(closeIconSvg, width: 32, height: 32)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: defaultPaddingHorizontal,
              end: defaultPaddingHorizontal,
              top: defaultPaddingHorizontal,
            ),
            child: SizedBox(
              height: widget.height! - 170,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.type == FilterScreenTypes.Products
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: defaultPaddingHorizontal),
                            child: ExpandedItemCard(
                              title: "Product Type",
                              body: CustomSelector(
                                widgetList: shipmentTypesList,
                                isSingleSelect: true,
                                itemSelectedId: shipmentTypeSelected,
                                onSelectMultiItemsCallback: (items) {},
                                onSelectItemCallback: (item) {
                                  setState(() {
                                    shipmentTypeSelected = item;
                                  });
                                },
                              ),
                            ),
                          )
                        : const SizedBox(),
                    widget.showCategory == true ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: defaultPaddingHorizontal),
                      child: ExpandedItemCard(
                        title: "Categories",
                        body: CustomSelector(
                          widgetList: categoriesList,
                          itemSelectedIds: categoriesSelected,
                          isSingleSelect: false,
                          onSelectMultiItemsCallback: (items) {
                            setState(() {
                              categoriesSelected = items;
                            });
                          },
                          onSelectItemCallback: (item) {},
                        ),
                      ),
                    ):const SizedBox(),
                    widget.occasionId == null ?Padding(
                      padding: const EdgeInsets.only(
                          bottom: defaultPaddingHorizontal),
                      child: ExpandedItemCard(
                        title: "Occasions",
                        body: CustomSelector(
                          widgetList: occasionsList,
                          itemSelectedIds: occasionsSelected,
                          isSingleSelect: false,
                          onSelectMultiItemsCallback: (items) {
                            setState(() {
                              occasionsSelected = items;
                            });
                          },
                          onSelectItemCallback: (item) {},
                        ),
                      ),
                    ):SizedBox(),
                    widget.type == FilterScreenTypes.Products ||
                            widget.type == FilterScreenTypes.Services
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: defaultPaddingHorizontal),
                            child: ExpandedItemCard(
                              title: "Price (SAR)",
                              body: FilterPriceView(
                                  priceFrom: priceFrom,
                                  priceTo: priceTo,
                                  onPriceChanges: (from, to) {
                                    setState(() {
                                      priceFrom = from;
                                      priceTo = to;
                                    });
                              }),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: defaultPaddingHorizontal),
                      child: ExpandedItemCard(
                        title: "Rating",
                        body: CustomSelector(
                          widgetList: ratingsList,
                          itemSelectedIds: ratingSelected,
                          isSingleSelect: false,
                          onSelectMultiItemsCallback: (items) {
                            setState(() {
                              ratingSelected = items;
                            });
                          },
                          onSelectItemCallback: (item) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(defaultPaddingHorizontal),
            child: AppButton(
                text: "Show Result",
                height: 50,
                width: double.infinity,
                onPress: () {
                  widget.onFilterApply?.call(FilterData(
                      shipmentTypeSelected: shipmentTypeSelected,
                      categoriesIdsSelected: categoriesSelected,
                      occasionsIdsSelected: occasionsSelected,
                      priceFromSelected: priceFrom,
                      priceToSelected: priceTo,
                      ratingValueSelected: ratingSelected));
                  context.pop();
                }),
          )
        ],
      ),
    );
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
    if (text.length >= 45) {
      text = "${text.substring(0, 44)}...";
    }
    // categoryTextController.text = text;
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
    if (text.length >= 45) {
      text = "${text.substring(0, 44)}...";
    }
    // occasionTextController.text = text;
  }

  void setDefaultRatingsText(List<int> mainCategoriesList, List<int> items) {
    try {
      var text = mainCategoriesList
              .where((item) =>
                  items.any((id) {
                    print("$id == $item : ${id == item}");
                    return id == item;
                  }) ??
                  false)
              .map((item) => "${item}/5")
              .join(", ") ??
          "";
      print(text);
      if (text.length >= 45) {
        text = "${text.substring(0, 44)}...";
      }
      // ratingsTextController.text = text;
    } catch (e) {
      print(" dsfafasdfa $e");
    }
  }

  void setDefaultData() {
    // promotionTextController.text = promotionSelected != null
    //     ? promotionSelected == 0
    //     ? context.tr(notPromotedKey)
    //     : context.tr(promotedKey)
    //     : "";
    // shipmentTypeTextController.text = shipmentTypeSelected != null
    //     ? shipmentTypeSelected == 0
    //     ? "Ready made" : "Unready made"
    //     : "";
    setDefaultCategoriesText(
        ref.watch(getCategoriesDataStateNotifiers).data?.data ?? [],
        categoriesSelected ?? []);
    setDefaultOccasionsText(
        ref.watch(getOccasionsDataStateNotifiers).data?.data ?? [],
        occasionsSelected ?? []);

    setDefaultRatingsText(mainRatingList, ratingSelected ?? []);

    setDefaultPrice(priceFrom, priceTo);

    setState(() {});
  }

  void setDefaultPrice(String? priceFrom, String? priceTo) {
    if (priceFrom != null && priceTo != null) {
      // priceTextController.text =
      // "${context.tr(sarKey)} ${priceFrom ?? ""} - ${context.tr(sarKey)} ${priceTo ?? ""}";
    } else if (priceFrom != null && priceTo == null) {
      // priceTextController.text = "${context.tr(sarKey)} $priceFrom";
    } else if (priceFrom == null && priceTo != null) {
      // priceTextController.text = "${context.tr(sarKey)} ${priceFrom ?? 0} - ${context.tr(sarKey)} ${priceTo}";
    } else {
      // priceTextController.text = "";
    }
  }

  void resetAllData(Function action) {
    promotionSelected = null;
    shipmentTypeSelected = null;
    priceTo = null;
    priceFrom = null;
    categoriesSelected =
        widget.categoryId != null ? [widget.categoryId!] : null;
    occasionsSelected = widget.occasionId != null ? [widget.occasionId!] : null;
    ratingSelected = null;

    // priceTextController.text = "";
    // promotionTextController.text = "";
    // if (widget.categoryId == null) {
    //   categoryTextController.text = "";
    // }
    // if (widget.occasionId == null) {
    //   occasionTextController.text = "";
    // }
    // ratingsTextController.text = "";
    //
    // if (widget.type == FilterScreenTypes.Products) {
    //   ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    //   // fetchProducts(1);
    //   context.pop(FilterData(
    //       priceFromSelected: null,
    //       priceToSelected: null,
    //       categoriesIdsSelected: null,
    //       occasionsIdsSelected: null,
    //       ratingValueSelected: null));
    // } else if (widget.type == FilterScreenTypes.Services) {
    //   ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
    //   // fetchServices(1);
    //   context.pop(FilterData(
    //       priceFromSelected: null,
    //       priceToSelected: null,
    //       categoriesIdsSelected: null,
    //       occasionsIdsSelected: null,
    //       ratingValueSelected: null));
    // } else if (widget.type == FilterScreenTypes.Sellers) {
    //   ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
    //   // fetchSellers(1);
    //   context.pop(FilterData(
    //       promotionSelected: null,
    //       priceFromSelected: null,
    //       priceToSelected: null,
    //       categoriesIdsSelected: null,
    //       occasionsIdsSelected: null,
    //       ratingValueSelected: null));
    // }
    action.call();
  }
}
