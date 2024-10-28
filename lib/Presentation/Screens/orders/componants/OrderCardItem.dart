import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Utils/OrderEx.dart';
import 'package:lazo_client/Utils/OrderExExtra.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Constants.dart';
import '../../../../../Localization/keys.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';
import 'InformationRowItem.dart';
import 'OrderButtons.dart';
import 'OrderUserInfromationWithOrderStatus.dart';

typedef OnOrderItemClick = void Function(String);
typedef OnOrderItemActionClick = void Function(String, String, String?);

class OrderCardItem extends ConsumerStatefulWidget {
  final OnOrderItemClick onOrderItemClick;
  final OnOrderItemActionClick? onOrderItemActionClick;
  final ClientOrderDetails? orderModel;
  const OrderCardItem(
      {super.key,
      required this.onOrderItemClick,
      this.onOrderItemActionClick,
      required this.orderModel});

  @override
  ConsumerState<OrderCardItem> createState() => _OrderCardItemState();
}

class _OrderCardItemState extends ConsumerState<OrderCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          widget.onOrderItemClick.call("${widget.orderModel?.id ?? 0}");
        },
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.appGrey8, width: 1)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                OrderUserInformationWithOrderStatus(
                  clientImage: widget.orderModel?.getStoreName(),
                  clientName: widget.orderModel?.getStoreImage(),
                  stateId: widget.orderModel?.statusId.toString(),
                ),
                const SizedBox(height: 24),
                InformationRowItem(
                  // icon: SVGIcons.totalPriceIcon(),
                  title: "Total Price",
                  value:
                      "${context.tr(SARKey)} ${widget.orderModel?.total ?? 0}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  // icon: SVGIcons.documentIcon(),
                  title: "Order ID",
                  value: "${widget.orderModel?.id}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  // icon: SVGIcons.numberOfItemsIcon(),
                  title: "No. of items",
                  value:""
                      // "${widget.orderModel?.orderItems.length} ${context.tr(itemsKey)}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  // icon: SVGIcons.calendarIcon(),
                  title: "Date / Time",
                  value:"",
                      // "${widget.orderModel?.createdAt?.hhMm()}, ${widget.orderModel?.createdAt?.ddMmYyyy()}",
                  hasDivider: false,
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                Skeleton.leaf(
                    child: OrderButtons(
                  "${widget.orderModel?.statusId}"
                      .getOrderStatusForShowButtons(context),
                  (type) {
                    print("$type");
                    handleOnButtonsClicks(type ?? ButtonsClickType.ViewDetails);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///   2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order

  void handleOnButtonsClicks(ButtonsClickType type) {
    switch (type) {
      case ButtonsClickType.ViewDetails:
        {
          navigateToOrderDetails(widget.orderModel?.id?.toString());
          break;
        }
      case ButtonsClickType.Accept:
        {
          widget.onOrderItemActionClick
              ?.call(widget.orderModel?.id.toString() ?? "",
              "2",
              null
          );

          break;
        }
      case ButtonsClickType.Cancel:
        {
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              widget.orderModel?.orderFamily == "ready_made" ? "10" : "11",
              "cancel for provider"
          );

          // ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //     cancellationReason: null,
          //     orderId:  widget.orderModel?.id.toString(),
          //     statusId:  widget.orderModel?.orderFamily == "ready_made" ? "10" : "11", onSuccess:(res) {
          //   updateData();
          //   if(context.isThereCurrentDialogShowing()){
          //     try{
          //       context.pop();
          //     }catch(e){
          //       print("NAV cannont pop");
          //     }
          //   }
          // },onLoading: (){
          //   context.showLoadingDialog();
          // },onFailureRequest: (){
          //   if(context.isThereCurrentDialogShowing()){
          //     try{
          //       context.pop();
          //     }catch(e){
          //       print("NAV cannont pop");
          //     }
          //   }
          // });
          break;
        }
      case ButtonsClickType.ReadyToShipping:
        {

          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "5",
              null
          );


          // ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //     cancellationReason: null,
          //     orderId: widget.orderModel?.id.toString(),
          //     statusId: "5",
          //     onSuccess: (res) {
          //       updateData();
          //       if (context.isThereCurrentDialogShowing()) {
          //         try {
          //           context.pop();
          //         } catch (e) {
          //           print("NAV cannont pop");
          //         }
          //       }
          //     },
          //     onLoading: () {
          //       context.showLoadingDialog();
          //     },
          //     onFailureRequest: () {
          //       if (context.isThereCurrentDialogShowing()) {
          //         try {
          //           context.pop();
          //         } catch (e) {
          //           print("NAV cannont pop");
          //         }
          //       }
          //     });
          break;
        }
      case ButtonsClickType.Finish:
        {
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "5.5",
              null
          );

          // ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //     cancellationReason: null,
          //     orderId: widget.orderModel?.id.toString(),
          //     statusId: "7",
          //     onSuccess: (res) {
          //       updateData();
          //       if (context.isThereCurrentDialogShowing()) {
          //         try {
          //           context.pop();
          //         } catch (e) {
          //           print("NAV cannont pop");
          //         }
          //       }
          //     },
          //     onLoading: () {
          //       context.showLoadingDialog();
          //     },
          //     onFailureRequest: () {
          //       if (context.isThereCurrentDialogShowing()) {
          //         try {
          //           context.pop();
          //         } catch (e) {
          //           print("NAV cannont pop");
          //         }
          //       }
          //     });
          break;
        }
    }
  }

  void navigateToOrderDetails(String? orderId) {
    if (orderId != null) {
      // context.push(R_OrderDetails, extra: {orderIdKey: orderId});
    }
  }
}
