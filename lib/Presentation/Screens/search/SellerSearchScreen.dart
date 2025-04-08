import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/SearchLocalStoragStateNotifiers.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../../Utils/FilterUtils.dart';
import '../../../Utils/SearchStorage.dart';
import '../../../main.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/RecentScreen.dart';
import '../../Widgets/SellerItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import '../home/Componants/CategoryFilterItemCard.dart';

class SellerSearchScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final int? id;
  final TextEditingController? controller;
  final VoidCallback? showAuthenticated;
  final Function(String)? onSelectFromResentSearch;
  const SellerSearchScreen({
    super.key,
    this.type,
    this.id,
    this.controller,
    this.showAuthenticated,this.onSelectFromResentSearch,
  });

  @override
  ConsumerState<SellerSearchScreen> createState() => _SellerSearchScreenState();
}

class _SellerSearchScreenState extends ConsumerState<SellerSearchScreen> {
  FilterData? filterForSellersData;
  var currentPageForSellers = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecentSearches();
    });
    super.initState();
  }

  Future<void> _loadRecentSearches() async {
    ref
        .read(sellerSearchLocalStorageStateNotifier.notifier)
        .updateList(prefs.getStringList(SearchStorage.seller_key) ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    final recentSearches = ref.watch(sellerSearchLocalStorageStateNotifier);
    filterForSellersData = ref.watch(filterForSellerStateNotifiers);


    final sellersState = ref.watch(getTopSellersDataStateNotifiers);

    currentPageForSellers =
        sellersState.data?.data?.currentPage?.toInt() ?? 1;

    return  Column(
      children: [
        Consumer(builder: (context, ref, child) {
          final categorySelectedState = ref
              .watch(updateSellerListOfFilterSelectedStateNotifiers)
              .toList();
          print("dfsdfsd ${categorySelectedState.length.toString()}");
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
                          filterForSellersData = null;
                          updateFilterData(filterForSellersData);
                          updateNumberOfSelectedItems(filterForSellersData);
                          currentPageForSellers = 1;
                          fetchSellers(currentPageForSellers);
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
                                filterForSellersData?.categoriesIdsSelected?.remove(item?.id);
                                updateNumberOfSelectedItems(filterForSellersData);
                              } else if(item?.type == FilterTypes.Occasions){
                                filterForSellersData?.occasionsIdsSelected?.remove(item?.id);
                                updateNumberOfSelectedItems(filterForSellersData);
                              } else if(item?.type == FilterTypes.Rating){
                                filterForSellersData?.ratingValueSelected?.remove(item?.id);
                                updateNumberOfSelectedItems(filterForSellersData);
                              } else if(item?.type == FilterTypes.Pice){
                                filterForSellersData?.priceFromSelected = null;
                                filterForSellersData?.priceToSelected = null;
                                updateNumberOfSelectedItems(filterForSellersData);
                              } else if(item?.type == FilterTypes.ProductType){
                                filterForSellersData?.shipmentTypeSelected = null;
                                updateNumberOfSelectedItems(filterForSellersData);
                              }

                              ref
                                  .read(
                                  updateSellerListOfFilterSelectedStateNotifiers
                                      .notifier)
                                  .removeItem(item);
                              updateFilterData(filterForSellersData);
                              //
                              currentPageForSellers = 1;
                              fetchSellers(currentPageForSellers);
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
        }),
        widget.controller?.text.toString().isNotEmpty == true || getNumberOfFilterItems(filterForSellersData) > 0
            ? sellersState.state == DataState.EMPTY
            ? EmptyDataView(
          icon:
          SVGIcons.localSVG(searchIconNoDataSvg, width: 114, height: 97),
          description: "Oops! Use different keywords to see more results.",
          btuName: "View our best sellers items",
          btuAction: () {
            navigateToSeeAllTopSeller(
                context.tr(topSellersKey), CategoryType.Search);
          },
        )
            : Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            border:
            Border(top: BorderSide(color: AppTheme.appGrey12, width: 1)),
          ),
          child: DataListView<ProviderData>(
              dataList: sellersState.data?.data?.data ??
                  (sellersState.state == DataState.LOADING
                      ? [...List.generate(8, (index) => ProviderData())]
                      : []),
              paginated: true,
              gridView: true,
              childAspectRatio: .85,
              heightPresent:  ref
                  .watch(updateSellerListOfFilterSelectedStateNotifiers)
                  .isNotEmpty == true ? 0.75 : .82,
              loadingHeightPresent: 0.73,
              crossAxisSpacing: 12,
              pageLoading: sellersState.state == DataState.MORE_LOADING,
              onBottomReached: () {
                if (currentPageForSellers <
                    (sellersState.data?.data?.lastPage ?? 0)) {
                  fetchSellers(++currentPageForSellers);
                }
              },
              builder: (item) => Skeletonizer(
                enabled: sellersState.state == DataState.LOADING,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 0, vertical: 0),
                  child: SellerItemCard(
                    height: 160,
                    providerData: item,
                    onSellerClickListener: (sellerId) {
                      navigateToSellerDetails(sellerId);
                    },
                  ),
                ),
              )),
        ): RecentScreen(
          type: FilterScreenTypes.Sellers,
          recentSearches: recentSearches,
          itemSearchClick: (result) {
            widget.controller?.text = result;
            widget.onSelectFromResentSearch?.call(result);
            SearchStorage.saveSearch(
                key: SearchStorage.seller_key, query: result);
            widget.controller?.text = result;
            fetchSellers(1);
          }, onClearBtuClick: (){
          ref.read(sellerSearchLocalStorageStateNotifier.notifier).clearData();
        },
        )
      ],
    );
  }

  void fetchSellers(int page) {
    print(filterForSellersData?.occasionsIdsSelected);
    ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
        page: page,
        isPromoted: filterForSellersData?.promotionSelected,
        categoriesIds: widget.type == CategoryType.Categories ||
                widget.type == CategoryType.Search
            ? filterForSellersData?.categoriesIdsSelected
            : null,
        occasionsIds: widget.type == CategoryType.Occasions ||
                widget.type == CategoryType.Search
            ? filterForSellersData?.occasionsIdsSelected
            : null,
        ratings: filterForSellersData?.ratingValueSelected
            ?.map((item) => item.toString())
            .toList(),
        searchByName: widget.controller?.text.isEmpty == true
            ? null
            : widget.controller?.text);
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }

  void navigateToSeeAllTopSeller(String title, CategoryType type,
      {int? categoryId}) async {
    await context.push(R_SeeAllSeller,
        extra: {"type": type, "title": title, "categoryId": categoryId});

  }

  void updateNumberOfSelectedItems(FilterData? filterData) {
    ref
        .read(filterNumberCountStateNotifiers.notifier)
        .updateNumber(number: getNumberOfFilterItems(filterData));
  }


  void clearFilterData() {
    ref
        .read(updateSellerListOfFilterSelectedStateNotifiers.notifier).clearAll();
  }

  void updateFilterData(FilterData? filterForSellersData) {
    ref.read(filterForSellerStateNotifiers.notifier).applyDataFilter(
        categoriesIdsSelected: filterForSellersData?.categoriesIdsSelected,
        occasionsIdsSelected: filterForSellersData?.occasionsIdsSelected,
        shipmentTypeSelected: filterForSellersData?.shipmentTypeSelected,
        priceToSelected: filterForSellersData?.priceToSelected,
        priceFromSelected: filterForSellersData?.priceFromSelected,
        ratingValueSelected: filterForSellersData?.ratingValueSelected
    );
  }
}
