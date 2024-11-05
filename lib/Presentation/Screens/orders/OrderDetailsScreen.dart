// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lazo_client/Constants/Eunms.dart';
// import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
// import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
// import 'package:lazo_client/Utils/DateUtils.dart';
// import 'package:lazo_provider/Constants.dart';
// import 'package:lazo_provider/Constants/Constants.dart';
// import 'package:lazo_provider/Constants/Eunms.dart';
// import 'package:lazo_provider/Data/Models/StateModel.dart';
// import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
// import 'package:lazo_provider/Presentation/Dialogs/LoadingDialog.dart';
// import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderButtons.dart';
// import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderUserInfromationWithOrderStatus.dart';
// import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserOrdersStateNotifiers.dart';
// import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
// import 'package:lazo_provider/Utils/DateUtils.dart';
// import 'package:lazo_provider/Utils/Extintions.dart';
// import 'package:lazo_provider/Utils/OrderEx.dart';
//
// import '../../../../Data/Network/lib/api.dart';
// import '../../../../Localization/keys.dart';
// import '../../../../Utils/Snaks.dart';
// import '../../../Constants/Constants.dart';
// import '../../../Data/Models/StateModel.dart';
// import '../../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
// import '../../../Theme/AppTheme.dart';
// import '../../../Widgets/SvgIcons.dart';
// import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
// import '../../Theme/AppTheme.dart';
// import '../../Widgets/CustomAppBar.dart';
// import '../../Widgets/SvgIcons.dart';
// import 'Componants/CancellationReasonBottomSheet.dart';
// import 'Componants/InformationRowItem.dart';
// import 'Componants/ProductItemCard.dart';
// import 'componants/OrderUserInfromationWithOrderStatus.dart';
//
// class OrderDetailsScreen extends ConsumerStatefulWidget {
//   final String orderId;
//   const OrderDetailsScreen({super.key, required this.orderId});
//
//   @override
//   ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
// }
//
// class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
//   ButtonsClickType? actionType = null;
//   ClientAuthResponseData? user = null;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       ref
//           .read(getOrderDetailsStateProvider.notifier)
//           .getOrderDetails(orderId: widget.orderId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final orderDetails = ref.watch(getOrderDetailsStateProvider);
//
//     user = ref.read(clientStateProvider.notifier).checkIfUserExist();
//
//     handleState(getOrderDetailsStateProvider, onSuccess: (res) {
//       // actionType = res.data?.data?.statusId?.toString().getOrderAction();
//     });
//
//     // handleState(updateOrderStatusStateProvider,
//     //     showLoading: true, showToast: true, onSuccess: (res) {
//     //   if (actionType == OrderStateActionType.Accepte) {
//     //     ref
//     //         .read(getNewOrderStateProvider.notifier)
//     //         .updateOrder(res.data!.data!);
//     //   } else if (actionType == OrderStateActionType.Cancel) {
//     //     ref
//     //         .read(getNewOrderStateProvider.notifier)
//     //         .deleteOrder(res.data!.data!);
//     //     ref
//     //         .read(getCanselOrderStateProvider.notifier)
//     //         .updateList(res.data!.data!);
//     //   } else if (actionType == OrderStateActionType.ReadyToShipping) {
//     //     ref
//     //         .read(getCurrentOrderStateProvider.notifier)
//     //         .updateOrder(res.data!.data!);
//     //   } else if (actionType == OrderStateActionType.Finish) {
//     //     ref
//     //         .read(getCurrentOrderStateProvider.notifier)
//     //         .updateOrder(res.data!.data!);
//     //   }
//     //
//     //   // ref
//     //   //     .read(getOrderDetailsStateProvider.notifier)
//     //   //     .getOrderDetails(widget.orderId);
//     // });
//
//     return Scaffold(
//       appBar: CustomAppBar(
//         navigated: true,
//         title: "context.tr(orderDetailsKey)",
//         appContext: context,
//       ),
//       body: Column(
//         children: [
//           orderDetails.state == DataState.LOADING
//               ? const Expanded(
//                   child: Center(child: CircularProgressIndicator()))
//               : const SizedBox(),
//           orderDetails.state == DataState.SUCCESS
//               ? Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: defaultPaddingHorizontal),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 32,
//                           ),
//                           Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                       color: AppTheme.appGrey8, width: 1)),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 24),
//                               child: OrderUserInformationWithOrderStatus(
//                                 clientImage:
//                                     orderDetails.data?.data?.user?.imagePath,
//                                 clientName: orderDetails.data?.data?.user?.name,
//                                 stateId: orderDetails.data?.data?.statusId
//                                     .toString(),
//                               )),
//                           const SizedBox(
//                             height: 32,
//                           ),
//                           Text("Order Info",
//                               style: AppTheme
//                                   .styleWithTextBlackAdelleSansExtendedFonts18w700),
//                           const SizedBox(
//                             height: 24,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                     color: AppTheme.appGrey8, width: 1),
//                                 color: Colors.white),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 24),
//                             child: Column(
//                               children: [
//                                 InformationRowItem(
//                                   icon: SVGIcons.totalPriceIcon(),
//                                   title: "Total Price",
//                                   value:
//                                       "${context.tr("SAR")} ${orderDetails.data?.data?.total ?? 0}",
//                                 ),
//                                 const SizedBox(height: 16),
//                                 InformationRowItem(
//                                   icon: SVGIcons.documentIcon(),
//                                   title: "Order ID",
//                                   value: "${orderDetails.data?.data?.id}",
//                                 ),
//                                 const SizedBox(height: 16),
//                                 InformationRowItem(
//                                   icon: SVGIcons.numberOfItemsIcon(),
//                                   title: "No. of items",
//                                   value:
//                                       "${orderDetails.data?.data?.orderItems.length} ${context.tr(itemsKey)}",
//                                 ),
//                                 const SizedBox(height: 16),
//                                 InformationRowItem(
//                                   icon: SVGIcons.calendarIcon(),
//                                   title: "Date / Time",
//                                   value:
//                                       "${(orderDetails.data?.data?.createdAt ?? "").hhMm()}, ${(orderDetails.data?.data?.createdAt ?? "").ddMmYyyy()}",
//                                   hasDivider: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 32,
//                           ),
//                           orderDetails.data?.data?.orderItems.isNotEmpty == true
//                               ? Text(
//                                   orderDetails.data?.data?.orderItems.first
//                                               .product !=
//                                           null
//                                       ? "Product"
//                                       : "Service",
//                                   style: AppTheme
//                                       .styleWithTextBlackAdelleSansExtendedFonts18w700)
//                               : const SizedBox(),
//                           const SizedBox(
//                             height: 18,
//                           ),
//                           ...(List.generate(
//                               orderDetails.data?.data?.orderItems.length ?? 0,
//                               (index) => Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 8.0),
//                                     child: ProductItemCard(
//                                         item: orderDetails
//                                             .data?.data?.orderItems[index], onItemClick: (itemId) {
//                                           navigateToDetails(itemId,orderDetails.data?.data?.orderItems.first
//                                               .product !=
//                                               null ? OrderItemType.Product : OrderItemType.Service);
//                                     },),
//                                   )))
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               : const SizedBox(),
//           orderDetails.state == DataState.SUCCESS
//               ? Consumer(
//                   builder: (context, watch, child) => Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 24, horizontal: defaultPaddingHorizontal),
//                     child: OrderButtons(
//                         "${orderDetails.data?.data?.statusId}"
//                             .getOrderStatusForShowButtons(context), (type) {
//                       handleOnButtonsClicks(
//                           type ?? ButtonsClickType.ViewDetails,
//                           orderDetails.data?.data);
//                     }, isOrderDetail: true),
//                   ),
//                 )
//               : const SizedBox()
//         ],
//       ),
//     );
//   }
//
//   void handleOnButtonsClicks(
//       ButtonsClickType type, ProviderOrderDetails? orderModel) {
//     switch (type) {
//       case ButtonsClickType.Accept:
//         {
//           if (user?.provider?.status != "pending") {
//             actionType = OrderStateActionType.Accepte;
//             ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
//                 orderId: orderModel?.id.toString(), statusId: "2");
//           } else {
//             AppSnackBar.showSnackBar(context,
//                 isSuccess: true, message: "Your account is still pending");
//           }
//           break;
//         }
//       case ButtonsClickType.Cancel:
//         {
//           if (user?.provider?.status != "pending") {
//             actionType = OrderStateActionType.Cancel;
//             showCancellationBottomSheet(orderModel?.id.toString() ?? "",
//                 orderModel?.orderFamily == "ready_made" ? "10" : "11");
//           } else {
//             AppSnackBar.showSnackBar(context,
//                 isSuccess: true, message: "Your account is still pending");
//           }
//
//           break;
//         }
//       case ButtonsClickType.ReadyToShipping:
//         {
//           if (user?.provider?.status != "pending") {
//             actionType = OrderStateActionType.ReadyToShipping;
//             ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
//                 orderId: orderModel?.id.toString(), statusId: "5");
//           } else {
//             AppSnackBar.showSnackBar(context,
//                 isSuccess: true, message: "Your account is still pending");
//           }
//
//           break;
//         }
//       case ButtonsClickType.Finish:
//         {
//           if (user?.provider?.status != "pending") {
//             actionType = OrderStateActionType.Finish;
//             ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
//                 orderId: orderModel?.id.toString(), statusId: "5.5");
//           } else {
//             AppSnackBar.showSnackBar(context,
//                 isSuccess: true, message: "Your account is still pending");
//           }
//
//           break;
//         }
//       case ButtonsClickType.ViewDetails:
//         {}
//     }
//   }
//
//   void showCancellationBottomSheet(String orderId, String orderState) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//         builder: (BuildContext builder) => Padding(
//               padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: CancellationReasonBottomSheet(
//                   onSelectItemCallback: (cancellationReason) {
//                 Navigator.pop(context);
//                 ref
//                     .read(updateOrderStatusStateProvider.notifier)
//                     .updateOrderStatus(
//                         orderId: orderId,
//                         statusId: orderState,
//                         cancellationReason: cancellationReason);
//               }),
//             ));
//   }
//
//   void navigateToDetails(int itemId,OrderItemType type) {
//     context.push(R_ItemOrderDetails,extra: {"id" : itemId.toString() , "type" : type});
//   }
// }
