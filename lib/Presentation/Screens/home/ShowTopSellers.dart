import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/DataListView.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Eunms.dart';
import '../../../Data/Models/FilterData.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/EmptyDataView.dart';
import '../../Widgets/SearchWithFilter.dart';

class ShowTopSellers extends ConsumerStatefulWidget {
  final CategoryType type;
  final String title;
  final int categoryId;
  const ShowTopSellers(this.type, this.categoryId, this.title, {super.key});

  @override
  ConsumerState<ShowTopSellers> createState() => _ShowTopSellersState();
}

class _ShowTopSellersState extends ConsumerState<ShowTopSellers> {
  var currentPage = 1;
  String? searchValue = null;
  FilterData? sellerFilterData = null;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      fetchSellers(currentPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topSellerState = ref.watch(getTopSellersDataStateNotifiers);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.title,
        isCenter: false,
        navigated: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                hasFilter: true,
                onFilterClick: () {
                  openFilter();
                },
                delay: 1,
                onTextChangeListener: (value) {
                  currentPage = 1;
                  searchValue = value;
                  fetchSellers(currentPage);
                },
              ),
            ),
            topSellerState.state == DataState.LOADING ||
                    topSellerState.state == DataState.MORE_LOADING ||
                    topSellerState.state == DataState.SUCCESS
                ? Expanded(
                    child: DataListView<ProviderData>(
                        dataList: topSellerState.data?.data?.data ??
                            (topSellerState.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderData())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading:
                            topSellerState.state == DataState.MORE_LOADING,
                        onBottomReached: () {
                          if (currentPage <
                              (topSellerState.data?.data?.lastPage ?? 0)) {
                            fetchSellers(++currentPage);
                          }
                        },
                        builder: (item) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Skeletonizer(
                                  enabled:
                                      topSellerState.state == DataState.LOADING,
                                  child: SellerItemCard(providerData: item)),
                            )),
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
    fetchSellers(++currentPage);
  }

  void fetchSellers(int page) {
    if (widget.type == CategoryType.Search) {
      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
            page: page,
            searchByName: searchValue?.isNotEmpty == true ? searchValue : null,
            isPromoted: sellerFilterData?.promotionSelected,
            categoriesIds: sellerFilterData?.categoriesIdsSelected,
            occasionsIds: sellerFilterData?.occasionsIdsSelected,
            ratings: sellerFilterData?.ratingValueSelected
                ?.map((item) => item.toString())
                .toList(),
          );
    } else {
      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData(
          categoriesIds: [widget.categoryId],
          isPromoted: sellerFilterData?.promotionSelected,
          occasionsIds: sellerFilterData?.occasionsIdsSelected,
          ratings: sellerFilterData?.ratingValueSelected
              ?.map((item) => item.toString())
              .toList(),
          page: page,
          searchByName: searchValue?.isNotEmpty == true ? searchValue : null);
    }
  }
}
