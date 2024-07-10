import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalCategoryListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/BannerCardItems.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/SearchWithFilter.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceAndProductItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/TitleWithSeeAll.dart';

import 'Componants/HorizontalOccasionsListViewWithTitleSeeAll.dart';
import 'Componants/HorizontalTopSellersListViewWithTitleSeeAll.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeDataStateNotifiers.notifier).getHomeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeDataState = ref.watch(homeDataStateNotifiers);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSearchBarWithFilter(hasFilter: false, onFilterClick: () {}),
                SizedBox(
                  height: 24,
                ),
                (homeDataState.state == DataState.SUCCESS &&
                        homeDataState.data?.data?.banners.isEmpty == true)
                    ? SizedBox()
                    : BannerCardItems(
                        list: homeDataState.state != DataState.LOADING
                            ? homeDataState.data?.data?.banners
                                    .map((item) => item.imagePath ?? "")
                                    .toList() ??
                                []
                            : [""],
                        height: 149,
                        width: MediaQuery.of(context).size.width,
                        showLoading: homeDataState.state == DataState.LOADING,
                        showIndicator: homeDataState.state != DataState.LOADING,
                      ),

                SizedBox(
                  height: 32,
                ),
                (homeDataState.state == DataState.SUCCESS &&
                        homeDataState.data?.data?.categories.isEmpty == true)
                    ? SizedBox()
                    : HorizontalCategoryListViewWithTitleSeeAll(
                        list: homeDataState.data?.data?.categories.toList() ?? [],
                        showLoading: homeDataState.state == DataState.LOADING,
                        itemClick: (itemId) {},
                      ),
                SizedBox(
                  height: 32,
                ),
                (homeDataState.state == DataState.SUCCESS &&
                        homeDataState.data?.data?.topRatedProviders.isEmpty == true)
                    ? SizedBox()
                    : HorizontalTopSellersListViewWithTitleSeeAll(
                        list: homeDataState.data?.data?.topRatedProviders.toList() ?? [],
                        showLoading: homeDataState.state == DataState.LOADING,
                        itemClick: (itemId) {},
                      ),

                SizedBox(
                  height: 32,
                ),
                (homeDataState.state == DataState.SUCCESS &&
                    homeDataState.data?.data?.categories.isEmpty == true)
                    ? SizedBox()
                    : HorizontalOccasionsListViewWithTitleSeeAll(
                  list: homeDataState.data?.data?.occasions.toList() ?? [],
                  showLoading: homeDataState.state == DataState.LOADING,
                  itemClick: (itemId) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
