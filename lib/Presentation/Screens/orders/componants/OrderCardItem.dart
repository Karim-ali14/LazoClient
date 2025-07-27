import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/orders/componants/ProductOutOfStockCardView.dart';
import 'package:lazo_client/Utils/DateUtils.dart';
import 'package:lazo_client/Utils/OrderExExtra.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/Keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';
import 'InformationRowItem.dart';
import 'OrderButtons.dart';
import 'OrderUserInfromationWithOrderStatus.dart';

typedef OnOrderItemClick = void Function(String);
typedef OnOrderItemActionClick = void Function(
    String, String, String?, ButtonsClickType);

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
                  clientImage: widget.orderModel?.getStoreImage(),
                  clientName: widget.orderModel?.getStoreName(),
                  stateId: widget.orderModel?.statusId.toString(),
                ),
                widget.orderModel?.rejectedOrderItems?.isEmpty == false && widget.orderModel?.isUserCanCancelOrder() == true
                    ? const SizedBox(height: 24)
                    : const SizedBox(),
                widget.orderModel?.rejectedOrderItems?.isEmpty == false
          && widget.orderModel?.isUserCanCancelOrder() == true
                    ? ProductOutOfStockCardView(
                        backgroundColor: AppTheme.appGrey16,
                        description:
                            "${widget.orderModel?.getCancellationItemsNames()} ${context.tr(outOfStockKeepOtherItemsAndCompleteOrderOrCancelKey)}",
                        onButtonClickListener: (type) {
                          if (ButtonsClickType.CompleteOrder == type) {
                            handleOnButtonsClicks(
                                ButtonsClickType.CompleteOrder);
                          } else if (ButtonsClickType.Cancel == type) {
                            handleOnButtonsClicks(ButtonsClickType.Cancel);
                          }
                        },
                      )
                    : const SizedBox(),
                const SizedBox(height: 24),
                InformationRowItem(
                  title: context.tr(totalPriceKey),
                  titleStyle: AppTheme
                      .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                  value:
                      "${widget.orderModel?.totalWithShippingFee ?? 0}",
                  valueIsPrice: true,
                  valueStyle: AppTheme
                      .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                  hasDivider: false,
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  titleStyle: AppTheme
                      .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                  title: context.tr(orderIdKey),
                  value: "${widget.orderModel?.id}",
                  valueStyle: AppTheme
                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                  hasDivider: false,
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  titleStyle: AppTheme
                      .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                  title: context.tr(noOfItemsKey),
                  value: ""
                      "${widget.orderModel?.orderItems.length} ${context.tr(itemsKey)}",
                  valueStyle: AppTheme
                      .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                  hasDivider: false,
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  titleStyle: AppTheme
                      .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                  title: context.tr(dateAndTimeKey),
                  value:
                      "${widget.orderModel?.createdAt?.hhMm()}, ${widget.orderModel?.createdAt?.ddMmYyyy()}",
                  valueStyle: AppTheme
                      .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                  hasDivider: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Skeleton.leaf(
                    child: OrderButtons(
                  ButtonsType.ViewDetails,
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
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "2",
              null,
              ButtonsClickType.Accept);

          break;
        }
      case ButtonsClickType.Cancel:
        {
          print("$type");
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "12",
              null,
              ButtonsClickType.Cancel);
          break;
        }
      case ButtonsClickType.ReadyToShipping:
        {
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "5",
              null,
              ButtonsClickType.ReadyToShipping);

          break;
        }
      case ButtonsClickType.Finish:
        {
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "5.5",
              null,
              ButtonsClickType.Finish);
          break;
        }
      case ButtonsClickType.CompleteOrder:
        {
          print("$type");
          widget.onOrderItemActionClick?.call(
              widget.orderModel?.id.toString() ?? "",
              "13",
              null,
              ButtonsClickType.CompleteOrder);
        }
    }
  }

  void navigateToOrderDetails(String? orderId) {
    if (orderId != null) {
      context.push(R_OrderDetails, extra: {orderIdKey: orderId});
    }
  }
}
