import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import '../../Widgets/SearchWithFilter.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';

class ShowBestProductAndServiceScreen extends ConsumerStatefulWidget {
  final String title;
  final ItemType type;
  const ShowBestProductAndServiceScreen(this.title, this.type, {super.key});

  @override
  ConsumerState<ShowBestProductAndServiceScreen> createState() =>
      _ShowProductAndServiceScreenState();
}

class _ShowProductAndServiceScreenState
    extends ConsumerState<ShowBestProductAndServiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForProducts = 1;
  var currentPageForServices = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.type == ItemType.Products) {
        ref.read(getProductsStateNotifiers.notifier).getProductsData(
            page: currentPageForProducts,
            type: ItemType.Products.name.toLowerCase());
      } else {
        ref.read(getServicesStateNotifiers.notifier).getServicesData(
            page: currentPageForServices,
            type: ItemType.Services.name.toLowerCase());
      }
    });
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(getProductsStateNotifiers);
    final servicesState = ref.watch(getServicesStateNotifiers);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.title,
        navigated: true,
        isCenter: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                controller: controller,
                hasFilter: true,
                onFilterClick: () {
                  openFilter(widget.type);
                },
                delay: 1,
                onTextChangeListener: (value) {
                  if (activeTabIndex == 0) {
                    currentPageForProducts = 1;
                    ref
                        .read(getProductsStateNotifiers.notifier)
                        .getProductsData(
                            page: currentPageForProducts,
                            type: ItemType.Products.name.toLowerCase(),
                            searchByName: value.isNotEmpty ? value : null);
                  } else {
                    currentPageForServices = 1;
                    ref
                        .read(getServicesStateNotifiers.notifier)
                        .getServicesData(
                            page: currentPageForServices,
                            type: ItemType.Services.name.toLowerCase(),
                            searchByName: value.isNotEmpty ? value : null);
                  }
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: widget.type == ItemType.Products
                  ? productsState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ SizedBox()
                      : DataListView<ProviderProduct>(
                          dataList: productsState.data?.data?.products?.data ??
                              (productsState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          5, (index) => ProviderProduct())
                                    ]
                                  : []),
                          paginated: true,
                          pageLoading: productsState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            if (currentPageForProducts <
                                (productsState.data?.data?.products?.lastPage ??
                                    0)) {
                              ref
                                  .read(getProductsStateNotifiers.notifier)
                                  .getProductsData(
                                      page: ++currentPageForProducts,
                                      type:
                                          ItemType.Products.name.toLowerCase());
                            }
                          },
                          builder: (item) => Skeletonizer(
                                enabled:
                                    productsState.state == DataState.LOADING,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 16, vertical: 6),
                                  child: ServiceAndProductItemCardHorizontal(
                                    type: ItemType.Products,
                                    product: item,
                                    onAddItemToCart: (id) {
                                      // widget.onAddItemToCart.call(id);
                                    },
                                    onAddItemToWishList: (id) {
                                      // widget.onAddItemToWishList.call(id);
                                    },
                                    onItemClick: (id) {
                                      // widget.itemClick.call(id);
                                    },
                                  ),
                                ),
                              ))
                  : servicesState.state == DataState.EMPTY
                      ? /*OrderPlaceHolder(onAddOrderClick: () {})*/ SizedBox()
                      : DataListView<ServiceShowData>(
                          dataList: servicesState.data?.data?.services?.data ??
                              (servicesState.state == DataState.LOADING
                                  ? [
                                      ...List.generate(
                                          5, (index) => ServiceShowData())
                                    ]
                                  : []),
                          paginated: true,
                          pageLoading: servicesState.state == DataState.MORE_LOADING,
                          onBottomReached: () {
                            if (currentPageForServices <
                                (servicesState.data?.data?.services?.lastPage ??
                                    0)) {
                              ref
                                  .read(getServicesStateNotifiers.notifier)
                                  .getServicesData(
                                      page: ++currentPageForServices,
                                      type:
                                          ItemType.Services.name.toLowerCase());
                            }
                          },
                          builder: (item) => Skeletonizer(
                                enabled:
                                    servicesState.state == DataState.LOADING,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 16, vertical: 6),
                                  child: ServiceAndProductItemCardHorizontal(
                                    service: item,
                                    type: ItemType.Services,
                                    onAddItemToCart: (id) {
                                      // widget.onAddItemToCart.call(id);
                                    },
                                    onAddItemToWishList: (id) {
                                      // widget.onAddItemToWishList.call(id);
                                    },
                                    onItemClick: (id) {
                                      // widget.itemClick.call(id);
                                    },
                                  ),
                                ),
                              )),
            )
          ],
        ),
      ),
    );
  }

  void openFilter(ItemType type) {
    if(type == ItemType.Products){
      context.push(R_FilterScreen,
          extra: {"type": FilterScreenTypes.Products,"searchValue" : controller.text});
    }else if(type == ItemType.Services){
      context.push(R_FilterScreen,
          extra: {"type": FilterScreenTypes.Sellers,"searchValue" : controller.text});
    }
  }

}
