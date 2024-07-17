import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/DataListView.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/SearchWithFilter.dart';

class ShowTopSellers extends ConsumerStatefulWidget {
  const ShowTopSellers({super.key});

  @override
  ConsumerState<ShowTopSellers> createState() => _ShowTopSellersState();
}

class _ShowTopSellersState extends ConsumerState<ShowTopSellers> {
  var currentPage = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(getTopSellersDataStateNotifiers.notifier).getTopSellersData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topSellerState = ref.watch(getTopSellersDataStateNotifiers);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                hasFilter: true,
                onFilterClick: () {},
                onTextChangeListener: (value) {},
              ),
            ),
            Expanded(
              child: DataListView<ProviderData>(
                  dataList: topSellerState.data?.data?.data ??
                      (topSellerState.state == DataState.LOADING
                          ? [...List.generate(5, (index) => ProviderData())]
                          : []),
                  paginated: true,
                  pageLoading:currentPage < (topSellerState.data?.data?.lastPage ?? 0),
                  onBottomReached:  () {
                    if (currentPage <
                        (topSellerState.data?.data?.lastPage ?? 0)) {
                      ref
                          .read(getTopSellersDataStateNotifiers.notifier)
                          .getTopSellersData(page : ++currentPage);
                    }
                  },
                  builder: (item) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Skeletonizer(
                            enabled: topSellerState.state == DataState.LOADING,
                            child: SellerItemCard(providerData: item)),
                      )),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: topSellerState.state == DataState.SUCCESS
            //           ? topSellerState.data?.data?.data.length
            //           : 8,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 16, vertical: 8),
            //           child: Skeletonizer(
            //               enabled: topSellerState.state == DataState.LOADING,
            //               child: SellerItemCard(
            //                   providerData:
            //                       topSellerState.data?.data?.data[index])),
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
