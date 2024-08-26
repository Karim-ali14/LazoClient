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
                  enableSearch: false,
                  hasFilter: false,
                  onFilterClick: () {},
                  onSearchClick: () {
                    navigateToProductsAndServices(
                        CategoryType.Search, "Search", null);
                  }),
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
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BannerCardItems(
                                  list: homeDataState.state != DataState.LOADING
                                      ? homeDataState.data?.data?.banners
                                              .map((item) =>
                                                  item.imagePath ?? "")
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
                                )
                              ],
                            ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.categories.isEmpty ==
                                  true)
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalCategoryListViewWithTitleSeeAll(
                                  list: homeDataState.data?.data?.categories
                                          .toList() ??
                                      [],
                                  showLoading:
                                      homeDataState.state == DataState.LOADING,
                                  itemClick: (item) {
                                    navigateToSeeAllTopSeller(
                                        "${item.name}", CategoryType.Categories,
                                        categoryId: item.id?.toInt() ?? 0);
                                  },
                                  onSeeAllClickListener: (id, name) {
                                    navigateToSeeAllCategories();
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                )
                              ],
                            ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState
                                      .data?.data?.topRatedProviders.isEmpty ==
                                  true)
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalTopSellersListViewWithTitleSeeAll(
                                  list: homeDataState
                                          .data?.data?.topRatedProviders
                                          .toList() ??
                                      [],
                                  showLoading:
                                      homeDataState.state == DataState.LOADING,
                                  itemClick: (itemId) {
                                    print("seller $itemId");
                                    navigateToSellerDetails(itemId);
                                  },
                                  onSeeAllClickListener: (id, name) {
                                    navigateToSeeAllTopSeller(
                                        "Top Sellers", CategoryType.Search);
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState.data?.data?.occasions.isEmpty ==
                                  true)
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalOccasionsListViewWithTitleSeeAll(
                                  list: homeDataState.data?.data?.occasions
                                          .toList() ??
                                      [],
                                  showLoading:
                                      homeDataState.state == DataState.LOADING,
                                  itemClick: (occasionItem) {
                                    navigateToSeeAllBestProductAndService(
                                        occasionItem.name ?? "",
                                        ItemType.Products,
                                        occasionId: occasionItem.id?.toInt());
                                    // navigateToProductsAndServices(
                                    //     CategoryType.Occasions,
                                    //     occasionItem.name ?? "",
                                    //     int.parse(
                                    //         (occasionItem.id ?? 0).toString()));
                                  },
                                  onSeeAllClickListener: (id, name) {
                                    navigateToSeeAllOccasions();
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState
                                      .data?.data?.topRatedProducts.isEmpty ==
                                  true)
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalTopProductListViewWithTitleSeeAll(
                                  list: homeDataState
                                          .data?.data?.topRatedProducts
                                          .toList() ??
                                      [],
                                  showLoading:
                                      homeDataState.state == DataState.LOADING,
                                  itemClick: (itemId, itemName, categoryIds) {
                                    print("homeCategories ${categoryIds}");
                                    navigateToItemDetails(ItemType.Products,
                                        itemId, itemName, categoryIds);
                                  },
                                  onAddItemToCart: (int) {},
                                  onAddItemToWishList: (int) {},
                                  onSeeAllClickListener: (id, name) {
                                    navigateToSeeAllBestProductAndService(
                                        "Best Products", ItemType.Products);
                                  },
                                  itemWidth: 163,
                                  title: 'Best products',
                                ),
                                SizedBox(
                                  height: 32,
                                )
                              ],
                            ),
                      (homeDataState.state == DataState.SUCCESS &&
                              homeDataState
                                      .data?.data?.topRatedServices.isEmpty ==
                                  true)
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalTopServiceListViewWithTitleSeeAll(
                                  list: homeDataState
                                          .data?.data?.topRatedServices
                                          .toList() ??
                                      [],
                                  showLoading:
                                      homeDataState.state == DataState.LOADING,
                                  itemClick: (itemId, itemName, categoryIds) {
                                    navigateToItemDetails(ItemType.Services,
                                        itemId, itemName, categoryIds);
                                  },
                                  onAddItemToCart: (int) {},
                                  onAddItemToWishList: (int) {},
                                  onSeeAllClickListener: (id, name) {
                                    navigateToSeeAllBestProductAndService(
                                        "Best Services", ItemType.Services);
                                  },
                                  itemWidth: 163,
                                  title: 'Best Services',
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
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
      CategoryType type, String title, int? id) async {
    print("occasionId : $id");
    await context.push(R_SeeAllProductOrService,
        extra: {"type": type, "title": title, "id": id});

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();

    print(
        "filter data -> ${ref.watch(filterForProductStateNotifiers).priceToSelected}");
  }

  void navigateToSeeAllTopSeller(String title, CategoryType type,
      {int? categoryId}) async {
    await context.push(R_SeeAllSeller,
        extra: {"type": type, "title": title, "categoryId": categoryId});

    ref.read(filterForSellerStateNotifiers.notifier).resetDataFilter();
  }

  void navigateToSeeAllBestProductAndService(String title, ItemType type,
      {int? occasionId}) async {
    await context.push(R_ShowBestProductOrService,
        extra: {"type": type, "title": title, "occasionId": occasionId});

    ref.read(filterForProductStateNotifiers.notifier).resetDataFilter();
    ref.read(filterForServiceStateNotifiers.notifier).resetDataFilter();
  }

  void navigateToItemDetails(
      ItemType itemType, int itemId, String itemName, List<int> categoriesIds) {
    context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    });
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }
}
