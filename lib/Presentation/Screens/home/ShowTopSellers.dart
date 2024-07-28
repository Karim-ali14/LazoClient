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
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.type == CategoryType.Search) {
        ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData();
      } else {
        ref
            .read(getTopSellersDataStateNotifiers.notifier)
            .getTopSellersData(categoriesIds: [widget.categoryId]);
      }
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
                  context.push(R_FilterScreen,
                      extra: {"type": FilterScreenTypes.Sellers,"categoryId" : widget.categoryId});
                },
                delay: 1,
                onTextChangeListener: (value) {
                  currentPage = 1;
                  ref
                      .read(getTopSellersDataStateNotifiers.notifier)
                      .getTopSellersData(
                          page: currentPage,
                          searchByName: value.isEmpty ? null : value);
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
                        pageLoading: currentPage <
                            (topSellerState.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPage <
                              (topSellerState.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getTopSellersDataStateNotifiers.notifier)
                                .getTopSellersData(page: ++currentPage);
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
                : Expanded(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 53,
                      ),
                      SVGIcons.noTopSellerDataIcon(),
                      SizedBox(
                        height: 16,
                      ),
                      Text("No seller found")
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
