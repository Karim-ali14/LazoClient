import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/CategoryFilterItemCard.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/CategoryItemCard.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/DataListView.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/CategoryUtils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Utils/FilterUtils.dart';
import '../../BottomSheets/FilterBottomSheet.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';

class ShowTopSellers extends ConsumerStatefulWidget {
  final CategoryType type;
  final String title;
  final int? categoryId;
  const ShowTopSellers(this.type, this.categoryId, this.title, {super.key});

  @override
  ConsumerState<ShowTopSellers> createState() => _ShowTopSellersState();
}

class _ShowTopSellersState extends ConsumerState<ShowTopSellers> {
  var currentPage = 1;
  String? searchValue = null;
  FilterData? sellerFilterData;
  final List<Category>? categoriesSelected = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.type == CategoryType.Categories) {
        categoriesSelected
            ?.add(Category(id: widget.categoryId, name: widget.title));

        if(widget.categoryId != null) {
          sellerFilterData = FilterData(
              categoriesIdsSelected: [
                widget.categoryId?.toInt() ?? 0
              ]
          );
        }
        updateNumberOfSelectedItems(sellerFilterData);
        var itemSelected =
            (ref.watch(getCategoriesDataStateNotifiers).data?.data ?? [])
                .map((item) {
                  return item.id == widget.categoryId
                      ? ItemSelected(
                          id: item.id?.toInt(),
                          text: item.name,
                          type: FilterTypes.Categories)
                      : null;
                })
                .where((item) => item != null)
                .toList();

        ref.read(updateListOfCategoryStateNotifiers.notifier).updateState(
              (ref.watch(getCategoriesDataStateNotifiers).data?.data ?? [])
                  .map((item) {
                return item.id == widget.categoryId
                    ? Category(
                        id: item.id,
                        name: item.name,
                        imagePath: item.imagePath,
                        isChecked: true)
                    : item.copyWith(isChecked: false);
              }).toList(),
            );

        ref
            .read(updateListOfFilterSelectedStateNotifiers.notifier)
            .updateState(itemSelected);
      }
      fetchSellers(currentPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topSellerState = ref.watch(getTopSellersDataStateNotifiers);
    final categoryState = ref.watch(updateListOfCategoryStateNotifiers);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.type == CategoryType.Categories
            ? context.tr(categoriesKey)
            : widget.title,
        isCenter: false,
        navigated: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppSearchBarWithFilter(
              hasFilter: true,
              numberOfFilterItems: ref.watch(filterNumberCountStateNotifiers),
              onFilterClick: () {
                openFilterBottomSheet();
              },
              delay: 1,
              onTextChangeListener: (value) {
                currentPage = 1;
                searchValue = value;
                fetchSellers(currentPage);
              },
            ),
            widget.type == CategoryType.Categories
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2), // Shadow color
                          blurRadius: .8, // Blur effect
                          spreadRadius: .1, // Spread effect
                          offset: const Offset(0, .5), // Shadow position
                        ),
                      ],
                    ),
                    padding: const EdgeInsetsDirectional.only(
                        top: 16, bottom: 16, start: 16),
                    child: SizedBox(
                      height: 45,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryItemCard(
                              height: 45,
                              width: 127,
                              category: categoryState[index],
                              onSelectCategory: (item) {
                                ref
                                    .read(updateListOfCategoryStateNotifiers
                                        .notifier)
                                    .toggleSelection(
                                        item?.id, item?.isChecked ?? false);

                                if (item?.isChecked == true) {
                                  if(sellerFilterData?.categoriesIdsSelected == null){
                                    sellerFilterData = FilterData(
                                      categoriesIdsSelected: [],
                                      occasionsIdsSelected: sellerFilterData?.occasionsIdsSelected,
                                      ratingValueSelected: sellerFilterData?.ratingValueSelected
                                    );
                                  }
                                  sellerFilterData?.categoriesIdsSelected?.add(item?.id?.toInt()??0);
                                  ref
                                      .read(
                                          updateListOfFilterSelectedStateNotifiers
                                              .notifier)
                                      .addItem(ItemSelected(
                                          id: item?.id?.toInt(),
                                          text: item?.name,
                                          type: FilterTypes.Categories));
                                } else {
                                  sellerFilterData?.categoriesIdsSelected?.remove(item?.id?.toInt()??0);
                                  ref
                                      .read(
                                          updateListOfFilterSelectedStateNotifiers
                                              .notifier)
                                      .removeItem(ItemSelected(
                                          id: item?.id?.toInt(),
                                          text: item?.name,
                                          type: FilterTypes.Categories));
                                }
                                updateNumberOfSelectedItems(sellerFilterData);
                                currentPage = 1;
                                fetchSellers(currentPage);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 12,
                              ),
                          itemCount: categoryState.length ?? 0),
                    ),
                  )
                : SizedBox(),
            // widget.type == CategoryType.Categories
                 Consumer(builder: (context, ref, child) {
                    final categorySelectedState = ref
                        .watch(updateListOfFilterSelectedStateNotifiers)
                        .toList();
                    print(categorySelectedState.length.toString());
                    return categorySelectedState.isNotEmpty == true
                        ? Container(
                            margin: EdgeInsetsDirectional.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(.2), // Shadow color
                                  blurRadius: .9, // Blur effect
                                  spreadRadius: .1, // Spread effect
                                  offset:
                                      const Offset(0, .5), // Shadow position
                                ),
                              ],
                            ),
                            padding: const EdgeInsetsDirectional.only(
                                top: 8, bottom: 8, start: 16),
                            child: SizedBox(
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    clipBehavior: Clip.antiAlias,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppTheme.appGrey8, width: 1),
                                    ),
                                    child: InkWell(
                                        onTap: () {
                                          clearFilterData();
                                          clearFilterCategorySelected();
                                          sellerFilterData = null;
                                          updateNumberOfSelectedItems(sellerFilterData);
                                          currentPage = 1;
                                          fetchSellers(currentPage);
                                        },
                                        child: const Center(
                                            child: Text("Clear All",
                                                style: AppTheme
                                                    .styleWithTextBlackColor2AdelleSansExtendedFonts13w400))),
                                  ),
                                  const VerticalDivider(
                                    color: AppTheme.appGrey20,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CategoryFilterItemCard(
                                            height: 32,
                                            item: categorySelectedState[index],
                                            onSelectCategory: (item) {
                                              if(item?.type == FilterTypes.Categories){
                                                print("sdfasdfasdfasdfsdf ${sellerFilterData?.categoriesIdsSelected}");
                                                sellerFilterData?.categoriesIdsSelected?.remove(item?.id);
                                                print("sdfasdfasdfasdfsdf ${sellerFilterData?.categoriesIdsSelected}");
                                                ref
                                                    .read(
                                                    updateListOfCategoryStateNotifiers
                                                        .notifier)
                                                    .removeSelected(item?.id);
                                                updateNumberOfSelectedItems(sellerFilterData);
                                              } else if(item?.type == FilterTypes.Occasions){
                                                sellerFilterData?.occasionsIdsSelected?.remove(item?.id);
                                                updateNumberOfSelectedItems(sellerFilterData);
                                              } else if(item?.type == FilterTypes.Rating){
                                                sellerFilterData?.ratingValueSelected?.remove(item?.id);
                                                updateNumberOfSelectedItems(sellerFilterData);
                                              }

                                              ref
                                                  .read(
                                                      updateListOfFilterSelectedStateNotifiers
                                                          .notifier)
                                                  .removeItem(item);
                                              //
                                              currentPage = 1;
                                              fetchSellers(currentPage);
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 12,
                                            ),
                                        itemCount:
                                            categorySelectedState.length),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox();
                  })
                // : const SizedBox()
            ,
            SizedBox(
              height: 16,
            ),
            topSellerState.state == DataState.LOADING ||
                    topSellerState.state == DataState.MORE_LOADING ||
                    topSellerState.state == DataState.SUCCESS
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DataListView<ProviderData>(
                          dataList: topSellerState.data?.data?.data ??
                              (topSellerState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          6, (index) => ProviderData())
                                    ]
                                  : []),
                          paginated: true,
                          gridView: true,
                          childAspectRatio: .86,
                          heightPresent: 0.81,
                          loadingHeightPresent: 0.73,
                          crossAxisSpacing: 12,
                          pageLoading:
                              topSellerState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            if (currentPage <
                                (topSellerState.data?.data?.lastPage ?? 0)) {
                              fetchSellers(++currentPage);
                            }
                          },
                          builder: (item) => Skeletonizer(
                              enabled:
                                  topSellerState.state == DataState.LOADING,
                              child: SellerItemCard(
                                height: 160,
                                providerData: item,
                                onSellerClickListener: (sellerId) {
                                  navigateToSellerDetails(sellerId);
                                },
                              ))),
                    ),
                  )
                : EmptyDataView(
                    icon: SVGIcons.searchGifIcon(),
                    title: "No Data Found",
                    description:
                        "Please refine your search using common words to get accurate results",
                  )
          ],
        ),
      ),
    );
  }

  void openFilter() async {
    var filterData = await context.push(R_FilterScreen, extra: {
      "type": FilterScreenTypes.Sellers,
      "categoryId": widget.categoryId
    });
    currentPage = 1;
    sellerFilterData = filterData as FilterData;
    fetchSellers(currentPage);
  }

  void openFilterBottomSheet() {
    FilterData? filterData;
    FilterScreenTypes type;

    filterData = sellerFilterData;
    type = FilterScreenTypes.Sellers;

    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          double height =
              MediaQuery.of(context).size.height * 0.9; // 60% height

          return FilterBottomSheet(
            height: height,
            type: type,
            dataSelected: filterData,
            showCategory: widget.type != CategoryType.Categories,
            onFilterApply: (filterData) {

              if(widget.type == CategoryType.Categories){
                sellerFilterData = FilterData(
                  categoriesIdsSelected: sellerFilterData?.categoriesIdsSelected,
                  occasionsIdsSelected: filterData.occasionsIdsSelected,
                  ratingValueSelected: filterData.ratingValueSelected
                );
              }else{
                sellerFilterData = filterData;
              }
              clearFilterData();

              ref.read(filterForSellerStateNotifiers.notifier).applyDataFilter(
                    categoriesIdsSelected: sellerFilterData?.categoriesIdsSelected,
                    occasionsIdsSelected: sellerFilterData?.occasionsIdsSelected,
                    ratingValueSelected: sellerFilterData?.ratingValueSelected,
                  );

              updateNumberOfSelectedItems(sellerFilterData);

              setFilterData(sellerFilterData??FilterData());

              currentPage = 1;
              fetchSellers(currentPage);
            },
          );
        });
  }

  void fetchSellers(int page) {
    if (widget.type == CategoryType.Search) {
      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
            page: page,
            searchByName: searchValue?.isNotEmpty == true ? searchValue : null,
            isPromoted: sellerFilterData?.promotionSelected,
            categoriesIds: sellerFilterData?.categoriesIdsSelected?.isNotEmpty == true ? sellerFilterData?.categoriesIdsSelected : null,
            occasionsIds: sellerFilterData?.occasionsIdsSelected?.isNotEmpty == true ? sellerFilterData?.occasionsIdsSelected : null,
            ratings: sellerFilterData?.ratingValueSelected
                ?.map((item) => item.toString())
                .toList(),
          );
    } else if (widget.type == CategoryType.Categories) {

      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
          isPromoted: sellerFilterData?.promotionSelected,
          categoriesIds: sellerFilterData?.categoriesIdsSelected?.isNotEmpty == true ? sellerFilterData?.categoriesIdsSelected : null,
          occasionsIds: sellerFilterData?.occasionsIdsSelected?.isNotEmpty == true ? sellerFilterData?.occasionsIdsSelected : null,
          ratings: sellerFilterData?.ratingValueSelected
              ?.map((item) => item.toString())
              .toList(),
          page: page,
          searchByName: searchValue?.isNotEmpty == true ? searchValue : null);
    } else {
      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
          categoriesIds: [widget.categoryId ?? 0],
          isPromoted: sellerFilterData?.promotionSelected,
          occasionsIds: sellerFilterData?.occasionsIdsSelected?.isNotEmpty == true ? sellerFilterData?.occasionsIdsSelected : null,
          ratings: sellerFilterData?.ratingValueSelected
              ?.map((item) => item.toString())
              .toList(),
          page: page,
          searchByName: searchValue?.isNotEmpty == true ? searchValue : null);
    }
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }

  void clearFilterCategorySelected() {
    ref
        .read(
        updateListOfCategoryStateNotifiers
            .notifier)
        .clearAll();
  }

  void clearFilterData() {
    ref
        .read(updateListOfFilterSelectedStateNotifiers.notifier).clearAll();
  }

  void setFilterData(FilterData filterData) {
    if (filterData.categoriesIdsSelected != null) {
      ref
          .watch(getCategoriesDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
      filterData.categoriesIdsSelected?.contains(item.id) ==
          true)
          .forEach((item) {
        ref
            .read(updateListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: item.id?.toInt(),
            text: item.name,
            type: FilterTypes.Categories));
      });
    }
    if (filterData.occasionsIdsSelected != null) {
      ref
          .watch(getOccasionsDataStateNotifiers)
          .data
          ?.data
          .where((item) =>
      filterData.occasionsIdsSelected?.contains(item.id) ==
          true)
          .forEach((item) {
        ref
            .read(updateListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: item.id?.toInt(),
            text: item.name,
            type: FilterTypes.Occasions));
      });
    }
    if (filterData.ratingValueSelected != null) {
      ConstantsMethods.getRatingsList(context)
          .where((item) =>
      filterData.ratingValueSelected?.contains(item.id) ==
          true)
          .forEach((item) {
        ref
            .read(updateListOfFilterSelectedStateNotifiers.notifier)
            .addItem(ItemSelected(
            id: item.id.toInt(),
            text: item.text,
            type: FilterTypes.Rating));
      });
    }
  }

}
