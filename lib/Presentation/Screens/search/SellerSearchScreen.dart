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

class SellerSearchScreen extends ConsumerStatefulWidget {
  final CategoryType? type;
  final int? id;
  final TextEditingController? controller;
  final VoidCallback? showAuthenticated;
  const SellerSearchScreen({
    super.key,
    this.type,
    this.id,
    this.controller,
    this.showAuthenticated,
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

    return  widget.controller?.text.toString().isNotEmpty == true || getNumberOfFilterItems(filterForSellersData) > 0
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
            padding: const EdgeInsets.symmetric(vertical: 4),
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
                childAspectRatio: .86,
                heightPresent: 0.81,
                loadingHeightPresent: 0.73,
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
                            horizontal: 16, vertical: 6),
                        child: SellerItemCard(
                          width: 165,
                          providerData: item,
                          onSellerClickListener: (sellerId) {
                            navigateToSellerDetails(sellerId);
                          },
                        ),
                      ),
                    )),
          ): RecentScreen(
      recentSearches: recentSearches,
      itemSearchClick: (result) {
        widget.controller?.text = result;
        SearchStorage.saveSearch(
            key: SearchStorage.seller_key, query: result);
        widget.controller?.text = result;
        fetchSellers(1);
      }, onClearBtuClick: (){
      ref.read(sellerSearchLocalStorageStateNotifier.notifier).clearData();
    },
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

    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
  }
}
