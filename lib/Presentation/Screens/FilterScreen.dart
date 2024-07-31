import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/BottomSheets/SelectPriceBottomSheet.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../Constants/Constants.dart';
import '../../Data/Models/ItemSelector.dart';
import '../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../Theme/AppTheme.dart';
import 'Auth/Componants/CustomSelectorBottomSheet.dart';
import 'mainScreen/MainScreenNavHost.dart';

class FilterScreen extends ConsumerStatefulWidget {
  final FilterScreenTypes type;
  final String? searchValue;
  final int? categoryId;
  final int? occasionId;
  const FilterScreen( {required this.type, this.searchValue,this.categoryId, this.occasionId, super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<ItemSelector> categoriesList = [];
  List<ItemSelector> occasionsList = [];
  List<int> mainRatingList = [1, 2, 3, 4, 5];
  List<ItemSelector> ratingsList = [1, 2, 3, 4, 5]
      .map((item) => ItemSelector(item, "$item/5", SVGIcons.smallStarIcon(),
          isChecked: false))
      .toList();
  final TextEditingController priceTextController = TextEditingController();
  final TextEditingController promotionTextController = TextEditingController();
  final TextEditingController categoryTextController = TextEditingController();
  final TextEditingController occasionTextController = TextEditingController();
  final TextEditingController ratingsTextController = TextEditingController();
  int? promotionSelected = null;
  List<int>? categoriesSelected = null;
  List<int>? occasionsSelected = null;
  List<int>? ratingSelected = null;
  int? priceFrom = null;
  int? priceTo = null;
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

      categoriesSelected = widget.categoryId != null ? [(widget.categoryId ?? 0).toInt()] : filterData?.categoriesIdsSelected;

      occasionsSelected = widget.occasionId != null ? [(widget.occasionId ?? 0).toInt()] : filterData?.occasionsIdsSelected;

      ratingSelected = filterData?.ratingValueSelected;

      priceFrom = filterData?.priceFromSelected;

      priceTo = filterData?.priceToSelected;

      setDefaultData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var enabled = promotionSelected != null || priceFrom != null || priceTo != null  || (widget.categoryId != null ? false : categoriesSelected?.isNotEmpty == true) || (widget.occasionId != null ? false : occasionsSelected?.isNotEmpty == true) || ratingSelected?.isNotEmpty == true;

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
        trailingWidget: InkWell(
          onTap: (){
            resetAllData((){
              setState(() {
                enabled = false;
              });
            });
          }, child:
          enabled ?
          const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reset",
                        style: AppTheme
                            .styleWithTextAppMainAppColor15AdelleSansExtendedFonts14w400,
                      )
                    ],
                  ),
                ],
              )):const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            widget.type != FilterScreenTypes.Sellers
                ? InkWell(
                    onTap: () {
                      showPriceBottomSheet(context,afterSuccessSelectMultiItems:(from,to){
                        print("$from $to");
                        priceFrom = from;
                        priceTo = to;
                        setDefaultPrice(priceFrom, priceTo);
                        setState(() {

                        });
                      });
                    },
                    child: AppTextField(
                      readOnly: true,
                      disabled: true,
                      hint: "Price",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w500,
                      textFieldBorderColor: AppTheme.appGrey8,
                      label: "Price",
                      labelStyle: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w500,
                      textEditingController: priceTextController,
                      endWidget: SVGIcons.rightIcon(),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      showPromotionBottomSheet(context);
                    },
                    child: AppTextField(
                      readOnly: true,
                      disabled: true,
                      hint: "Promotion",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w500,
                      textFieldBorderColor: AppTheme.appGrey8,
                      label: "Promoted",
                      labelStyle: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w500,
                      textEditingController: promotionTextController,
                      endWidget: SVGIcons.rightIcon(),
                    ),
                  ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                if(widget.categoryId == null) {
                  showCategoriesBottomSheet(context, categoriesList,
                      afterSuccessSelectMultiItems: (items) {
                        categoriesSelected = items;
                        setDefaultCategoriesText(
                            categoryState.data?.data ?? [], items);
                        setState(() {

                        });
                      });
                }
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
                if(widget.occasionId == null) {
                  showOccasionsBottomSheet(context, occasionsList,
                      afterSuccessSelectMultiItems: (items) {
                        occasionsSelected = items;
                        setDefaultOccasionsText(
                            occasionsState.data?.data ?? [], items);
                        setState(() {

                        });
                      });
                }
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
            InkWell(
              onTap: () {
                showRatingsBottomSheet(context, ratingsList,
                    afterSuccessSelectMultiItems: (items) {
                  setState(() {
                    ratingSelected = items;
                    setDefaultRatingsText(mainRatingList, items);
                    // setDefaultOccasionsText(
                    //     occasionsState.data?.data ?? [], items);
                  });
                });
              },
              child: AppTextField(
                readOnly: true,
                disabled: true,
                hint: "Rating",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textFieldBorderColor: AppTheme.appGrey8,
                label: "Rating",
                labelStyle:
                    AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                textEditingController: ratingsTextController,
                endWidget: SVGIcons.rightIcon(),
              ),
            ),
            SizedBox(height: 24),
            AppButton(
                enabled: enabled,
                height: 48,
                width: double.infinity,
                onPress: () {
                  switch (widget.type) {
                    case FilterScreenTypes.Products:
                      {
                        ref
                            .read(filterForProductStateNotifiers.notifier)
                            .applyDataFilter(
                                priceFromSelected: priceFrom,
                                priceToSelected: priceTo,
                                categoriesIdsSelected: categoriesSelected,
                                occasionsIdsSelected: occasionsSelected,
                                ratingValueSelected: ratingSelected);
                        fetchProducts(1);
                        context.pop(false);
                      }
                      break;
                    case FilterScreenTypes.Services:
                      {
                        ref
                            .read(filterForServiceStateNotifiers.notifier)
                            .applyDataFilter(
                                priceFromSelected: priceFrom,
                                priceToSelected: priceTo,
                                categoriesIdsSelected: categoriesSelected,
                                occasionsIdsSelected: occasionsSelected,
                                ratingValueSelected: ratingSelected);
                        fetchServices(1);
                      }
                      break;
                    case FilterScreenTypes.Sellers:
                      {
                        ref
                            .read(filterForSellerStateNotifiers.notifier)
                            .applyDataFilter(
                                promotionSelected: promotionSelected,
                                categoriesIdsSelected: categoriesSelected,
                                occasionsIdsSelected: occasionsSelected,
                                ratingValueSelected: ratingSelected);
                        fetchSellers(1);
                      }
                      break;
                  }
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
                setState(() {

                });
                Navigator.pop(context);
              });
        });
  }

  void showPriceBottomSheet(BuildContext context,{Function(int?,int?)? afterSuccessSelectMultiItems}) {
    print("filterForSellerStateNotifiers : ${promotionSelected}");

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectPriceBottomSheet(
              context: context,
              title: "Choose Price",
              priceFrom: priceFrom == null ? "" : priceFrom.toString() ,
              priceTo: priceTo == null ? "" : priceTo.toString(),
              applyBtu: (from,to){
                afterSuccessSelectMultiItems?.call(from,to);
              }
            ),
          );
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

  void showRatingsBottomSheet(BuildContext context, List<ItemSelector> list,
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
              title: "Choose Ratings",
              widgetList: list,
              searchHint: "Search by",
              itemSelectedIds: ratingSelected,
              isSingleSelect: false,
              onSelectMultiItemsCallback: (items) {
                print("${items}");
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
    if (text.length >= 45) {
      text = "${text.substring(0, 44)}...";
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
    if (text.length >= 45) {
      text = "${text.substring(0, 44)}...";
    }
    occasionTextController.text = text;
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
      ratingsTextController.text = text;
    } catch (e) {
      print(" dsfafasdfa $e");
    }
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
        occasionsSelected ?? []);

    setDefaultRatingsText(mainRatingList, ratingSelected ?? []);

    setDefaultPrice(priceFrom,priceTo);

    setState(() {

    });
  }

  void setDefaultPrice(int? priceFrom, int? priceTo) {
    if(priceFrom != null && priceTo != null){
      priceTextController.text = "SAR ${priceFrom??""} - SAR ${priceTo??""}";
    }else if(priceFrom != null && priceTo == null){
      priceTextController.text = "SAR $priceFrom";
    } else if(priceFrom == null && priceTo != null){
      priceTextController.text = "SAR ${priceFrom??0} - SAR ${priceTo}";
    }else{
      priceTextController.text = "" ;
    }
  }


  void fetchProducts(int page) {
    ref.read(getProductsStateNotifiers.notifier).getProductsData(
        page: page,
        categoriesIds: categoriesSelected,
        occasionsIds: occasionsSelected,
        ratings: ratingSelected?.map((item) => item.toString()).toList(),
        type: ItemType.Products.name.toLowerCase(),
        priceFrom: priceFrom.toString(),
        priceTo: priceTo.toString(),
        searchByName: widget.searchValue == null || widget.searchValue?.isEmpty == true ? null : widget.searchValue
    );
  }

  void fetchServices(int page) {
    ref.read(getServicesStateNotifiers.notifier).getServicesData(
        page: page,
        categoriesIds: categoriesSelected,
        occasionsIds: occasionsSelected,
        ratings: ratingSelected?.map((item) => item.toString()).toList(),
        type: ItemType.Services.name.toLowerCase(),
        priceFrom: priceFrom.toString(),
        priceTo: priceTo.toString(),
        searchByName: widget.searchValue == null || widget.searchValue?.isEmpty == true ? null : widget.searchValue
    );
  }

  void fetchSellers(int page) {
    ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
        page: page,
        categoriesIds: categoriesSelected,
        occasionsIds: occasionsSelected,
        ratings: ratingSelected?.map((item) => item.toString()).toList(),
        isPromoted: promotionSelected,
        searchByName: widget.searchValue == null || widget.searchValue?.isEmpty == true ? null : widget.searchValue
    );
  }

  void resetAllData(Function action) {
    promotionSelected = null;
    priceTo = null;
    priceFrom = null;
    categoriesSelected = widget.categoryId != null ? [widget.categoryId!] : null;
    occasionsSelected =  widget.occasionId != null ? [widget.occasionId!] : null;
    ratingSelected = null;

    priceTextController.text = "";
    promotionTextController.text = "";
    if(widget.categoryId == null){
      categoryTextController.text = "";
    }
    if(widget.occasionId == null){
      occasionTextController.text = "";
    }
    ratingsTextController.text = "";

    if (widget.type == FilterScreenTypes.Products) {
      ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
      fetchProducts(1);
    } else if (widget.type == FilterScreenTypes.Services) {
      ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
      fetchServices(1);
    } else if (widget.type == FilterScreenTypes.Sellers) {
      ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
      fetchSellers(1);
    }
    action.call();
  }

}
