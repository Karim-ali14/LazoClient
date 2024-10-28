import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataPlaceHolder.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Data/Models/StateModel.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/DataListView.dart';
import 'componants/OrderCardItem.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  var currentPageForNewOrder = 1;
  var currentPageForCurrentOrder = 1;
  var currentPageForFinishOrder = 1;
  var currentPageForCanceledOrder = 1;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getNewOrderStateProvider.notifier).getOrders();
      ref.read(getCurrentOrderStateProvider.notifier).getOrders();
      ref.read(getFinishOrderStateProvider.notifier).getOrders();
      ref.read(getCanselOrderStateProvider.notifier).getOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(clientStateProvider.notifier).checkIfUserExist();

    final newOrders = ref.watch(getNewOrderStateProvider);
    final currentOrders = ref.watch(getCurrentOrderStateProvider);
    final finishOrders = ref.watch(getFinishOrderStateProvider);
    final cancelOrders = ref.watch(getCanselOrderStateProvider);

    // handleState(updateOrderStatusStateProvider,
    //     showLoading: true, showToast: true, onSuccess: (res) {
    //       if (actionType == OrderStateActionType.Accepte) {
    //         ref
    //             .read(getNewOrderStateProvider.notifier)
    //             .updateOrder(res.data!.data!);
    //       } else if (actionType == OrderStateActionType.Cancel) {
    //         ref
    //             .read(getNewOrderStateProvider.notifier)
    //             .deleteOrder(res.data!.data!);
    //         ref
    //             .read(getCanselOrderStateProvider.notifier)
    //             .updateList(res.data!.data!);
    //       } else if (actionType == OrderStateActionType.ReadyToShipping) {
    //         ref
    //             .read(getCurrentOrderStateProvider.notifier)
    //             .updateOrder(res.data!.data!);
    //       } else if (actionType == OrderStateActionType.Finish) {
    //         // ref
    //         //     .read(getCurrentOrderStateProvider.notifier)
    //         //     .deleteOrder(res.data!.data!);
    //         ref
    //             .read(getCurrentOrderStateProvider.notifier)
    //             .updateOrder(res.data!.data!);
    //       }
    //     });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
                labelPadding: const EdgeInsetsDirectional.only(end: 10),
                physics: const ClampingScrollPhysics(),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                controller: tabController,
                tabs: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Tab(
                      child: Container(
                        width: 150,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: activeTabIndex == 0
                                ? AppTheme.mainAppColor
                                : AppTheme.appGrey8,
                          ),
                          color: activeTabIndex == 0
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey9,
                        ),
                        child: Center(
                          child: Text(
                            "New Order",
                            style: activeTabIndex == 0
                                ? AppTheme
                                    .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                : AppTheme
                                    .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                    .copyWith(color: AppTheme.appGrey10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: activeTabIndex == 1
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey8,
                        ),
                        color: activeTabIndex == 1
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey9,
                      ),
                      child: Center(
                        child: Text(
                          "Current Order",
                          style: activeTabIndex == 1
                              ? AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                              : AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                  .copyWith(color: AppTheme.appGrey10),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: activeTabIndex == 2
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey8,
                        ),
                        color: activeTabIndex == 2
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey9,
                      ),
                      child: Center(
                        child: Text(
                          "Finish Order",
                          style: activeTabIndex == 2
                              ? AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                              : AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                  .copyWith(color: AppTheme.appGrey10),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: activeTabIndex == 3
                              ? AppTheme.mainAppColor
                              : AppTheme.appGrey8,
                        ),
                        color: activeTabIndex == 3
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey9,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel Order",
                          style: activeTabIndex == 3
                              ? AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                              : AppTheme
                                  .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                  .copyWith(color: AppTheme.appGrey10),
                        ),
                      ),
                    ),
                  ),
                ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                newOrders.state == DataState.EMPTY
                    ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {},
                        icon: SVGIcons.buyIcon(),
                        title: 'No Orders Added',
                        description:
                            'When you make any order, it will appear here',
                      )
                    : DataListView<ClientOrderDetails>(
                        dataList: newOrders.data?.data?.data ??
                            (newOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ClientOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForNewOrder <
                            (newOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForNewOrder <
                              (newOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getNewOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForNewOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: newOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemActionClick:
                                    (orderId, statusId, cancellationReason) {
                                  // if (user?.provider?.status != "pending") {
                                  //   actionType = statusId.getOrderAction();
                                  //   print(
                                  //       "make oder state = ${actionType?.name}");
                                  //   if (actionType ==
                                  //       OrderStateActionType.Accepte) {
                                  //     ref
                                  //         .read(updateOrderStatusStateProvider
                                  //             .notifier)
                                  //         .updateOrderStatus(
                                  //             orderId: orderId,
                                  //             statusId: statusId);
                                  //   } else if (actionType ==
                                  //       OrderStateActionType.Cancel) {
                                  //     showCancellationBottomSheet(
                                  //         orderId, statusId);
                                  //   }
                                  // } else {
                                  //   AppSnackBar.showSnackBar(context,
                                  //       isSuccess: true,
                                  //       message:
                                  //           "Your account is still pending");
                                  // }
                                },
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                currentOrders.state == DataState.EMPTY
                    ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {},
                        icon: SVGIcons.buyIcon(),
                        title: 'No Orders Added',
                        description:
                            'When you make any order, it will appear here',
                      )
                    : DataListView<ClientOrderDetails>(
                        dataList: currentOrders.data?.data?.data ??
                            (currentOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ClientOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForCurrentOrder <
                            (currentOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForCurrentOrder <
                              (currentOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getCurrentOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForCurrentOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: currentOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemActionClick:
                                    (orderId, statusId, cancellationReason) {
                                  // if (user?.provider?.status != "pending") {
                                  //   actionType = statusId.getOrderAction();
                                  //   print(
                                  //       "make oder state = ${actionType?.name}");
                                  //   ref
                                  //       .read(updateOrderStatusStateProvider
                                  //           .notifier)
                                  //       .updateOrderStatus(
                                  //           orderId: orderId,
                                  //           statusId: statusId);
                                  // } else {
                                  //   AppSnackBar.showSnackBar(context,
                                  //       isSuccess: true,
                                  //       message:
                                  //           "Your account is still pending");
                                  // }
                                },
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                finishOrders.state == DataState.EMPTY
                    ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {},
                        icon: SVGIcons.buyIcon(),
                        title: 'No Orders Added',
                        description:
                            'When you make any order, it will appear here',
                      )
                    : DataListView<ClientOrderDetails>(
                        dataList: finishOrders.data?.data?.data ??
                            (finishOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ClientOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForFinishOrder <
                            (finishOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForFinishOrder <
                              (finishOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getFinishOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForFinishOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: finishOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                cancelOrders.state == DataState.EMPTY
                    ? EmptyDataPlaceHolder(
                        onAddOrderClick: () {},
                        icon: SVGIcons.buyIcon(),
                        title: 'No Orders Added',
                        description:
                            'When you make any order, it will appear here',
                      )
                    : DataListView<ClientOrderDetails>(
                        dataList: cancelOrders.data?.data?.data ??
                            (cancelOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ClientOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForCanceledOrder <
                            (cancelOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForCanceledOrder <
                              (cancelOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getCanselOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForCanceledOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: cancelOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void navigateToOrderDetails(String orderId) {}
}
