import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalCategoryListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/Screens/home/Componants/HorizontalTopServiceListViewWithTitleSeeAll.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/BannerCardItems.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/SearchWithFilter.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceAndProductItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/TitleWithSeeAll.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import 'Componants/HorizontalOccasionsListViewWithTitleSeeAll.dart';
import 'Componants/HorizontalTopProductListViewWithTitleSeeAll.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppSearchBarWithFilter(
                  hasFilter: false, onFilterClick: () {}),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              showIndicator:
                                  homeDataState.state != DataState.LOADING,
                            ),
                      SizedBox(
                        height: 32,
                      ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.categories.isEmpty ==
                                  true)
                          ? SizedBox()
                          : HorizontalCategoryListViewWithTitleSeeAll(
                              list: homeDataState.data?.data?.categories
                                      .toList() ??
                                  [],
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              itemClick: (itemId) {},
                              onSeeAllClickListener: () {
                                navigateToSeeAllCategories();
                              },
                            ),
                      SizedBox(
                        height: 32,
                      ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState
                                      .data?.data?.topRatedProviders.isEmpty ==
                                  true)
                          ? SizedBox()
                          : HorizontalTopSellersListViewWithTitleSeeAll(
                              list: homeDataState.data?.data?.topRatedProviders
                                      .toList() ??
                                  [],
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              itemClick: (itemId) {}, onSeeAllClickListener: () {
                                navigateToSeeAllTopSeller();
                                },
                            ),
                      SizedBox(
                        height: 32,
                      ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.categories.isEmpty ==
                                  true)
                          ? SizedBox()
                          : HorizontalOccasionsListViewWithTitleSeeAll(
                              list: homeDataState.data?.data?.occasions
                                      .toList() ??
                                  [],
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              itemClick: (occasionItem) {
                                navigateToProductsAndServices(
                                    CategoryType.Occasions,
                                    occasionItem.name ?? "",
                                    int.parse((occasionItem.id ?? 0).toString()));
                              },
                              onSeeAllClickListener: () {
                                navigateToSeeAllOccasions();
                              },
                            ),
                      SizedBox(
                        height: 32,
                      ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.categories.isEmpty ==
                                  true)
                          ? SizedBox()
                          : HorizontalTopProductListViewWithTitleSeeAll(
                              list: homeDataState.data?.data?.topRatedProducts
                                      .toList() ??
                                  [],
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              itemClick: (itemId) {},
                              onAddItemToCart: (int) {},
                              onAddItemToWishList: (int) {},
                            ),
                      SizedBox(
                        height: 32,
                      ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.categories.isEmpty ==
                                  true)
                          ? SizedBox()
                          : HorizontalTopServiceListViewWithTitleSeeAll(
                              list: homeDataState.data?.data?.topRatedServices
                                      .toList() ??
                                  [],
                              showLoading:
                                  homeDataState.state == DataState.LOADING,
                              itemClick: (itemId) {},
                              onAddItemToCart: (int) {},
                              onAddItemToWishList: (int) {},
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSeeAllCategories() {
    context.push(R_SeeAllCategoryOrOccasion,
        extra: {"type": CategoryType.Categories});
  }

  void navigateToSeeAllOccasions() {
    context.push(R_SeeAllCategoryOrOccasion,
        extra: {"type": CategoryType.Occasions});
  }

  void navigateToProductsAndServices(
      CategoryType type, String title, int id) {
    print("occasionId : $id");
    context.push(R_SeeAllProductOrService,
        extra: {"type": type, "title": title, "id": id});
  }

  void navigateToSeeAllTopSeller() {
    context.push(R_SeeAllSeller);
  }
}
