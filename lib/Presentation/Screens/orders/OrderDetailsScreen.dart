import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Eunms.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductItemCard.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Utils/DateUtils.dart';
import 'package:lazo_client/Utils/OrderExExtra.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Utils/UtilsExts.dart';
import '../../BottomSheets/CancelOrderBottomSheet.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppScaffold.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TextWithoutPadding.dart';
import '../cartScreen/componants/CartItemView.dart';
import '../details/componants/ProductRowItem.dart';
import 'componants/InformationRowItem.dart';
import 'componants/OrderUserInfromationWithOrderStatus.dart';
import 'componants/ProductOutOfStockCardView.dart';

class OrderDetailsScreen extends ConsumerStatefulWidget {
  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  ButtonsClickType? actionType = null;
  ClientAuthResponseData? user = null;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrderDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderDetails = ref.watch(getOrderDetailsStateProvider);

    user = ref.read(clientStateProvider.notifier).checkIfUserExist();

    handleState(getOrderDetailsStateProvider,showLoading: true, onSuccess: (res) {
      // actionType = res.data?.data?.statusId?.toString().getOrderAction();
      print("sdlfkjslakdjflksd ${res.data?.data?.orderItems?.first.orderItems}");
    });

    handleState(manageOrderStateProvider, showLoading: true, showToast: true,
        onSuccess: (res) {
      updateOrderDetails(res.data?.data);

      if (actionType == ButtonsClickType.CompleteOrder) {
        ref
            .read(getNewOrderStateProvider.notifier)
            .updateOrder(res.data!.data!);
      } else if (actionType == ButtonsClickType.Cancel) {
        ref
            .read(getNewOrderStateProvider.notifier)
            .deleteOrder(res.data!.data!);
        // ref
        //     .read(getCanselOrderStateProvider.notifier)
        //     .updateList(res.data!.data!);
      }
      actionType = null;
    });

    return AppScaffold(
      appBar: CustomAppBar(
        navigated: true,
        isCenter: false,
        title: context.tr(orderDetailsKey),
        appContext: context,
        // trailingWidget: orderDetails.data?.data?.isUserCanCancelOrder() == true
        //     ? InkWell(
        //         onTap: () {
        //           actionType = ButtonsClickType.Cancel;
        //           showCancellationBottomSheet(
        //               orderDetails.data?.data?.id.toString() ?? "", "14");
        //         },
        //         child: Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Center(
        //             child: Text(
        //               context.tr(cancelKey),
        //               style: AppTheme
        //                   .styleWithTextRedAdelleSansExtendedFonts16w500,
        //             ),
        //           ),
        //         ),
        //       )
        //     : const SizedBox(),
      ),
      body: Column(
        children: [
          orderDetails.state == DataState.SUCCESS
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        orderDetails.data?.data?.rejectedOrderItems?.isEmpty ==
                                false
                            ? const SizedBox(height: 24)
                            : const SizedBox(),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(children: [
                              OrderUserInformationWithOrderStatus(
                                clientImage:
                                    orderDetails.data?.data?.getStoreImage(),
                                clientName:
                                    orderDetails.data?.data?.getStoreName(),
                                stateId: orderDetails.data?.data?.statusId
                                    .toString(),
                              ),
                              orderDetails.data?.data?.rejectedOrderItems
                                          ?.isEmpty ==
                                      false
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: ProductOutOfStockCardView(
                                        backgroundColor: AppTheme.appGrey28,
                                        description:
                                            "${orderDetails.data?.data?.getCancellationItemsNames()} ${context.tr(outOfStockKeepOtherItemsAndCompleteOrderOrCancelKey)}",
                                        onButtonClickListener: (type) {
                                          if (ButtonsClickType.CompleteOrder ==
                                              type) {
                                            handleOnButtonsClicks(
                                                ButtonsClickType.CompleteOrder,
                                                orderDetails.data?.data);
                                          } else if (ButtonsClickType.Cancel ==
                                              type) {
                                            handleOnButtonsClicks(
                                                ButtonsClickType.Cancel,
                                                orderDetails.data?.data);
                                          }
                                        },
                                      ),
                                    )
                                  : const SizedBox(),
                              orderDetails.data?.data?.isFinishedOrder() ==
                                          true &&
                                      orderDetails.data?.data?.rating == null
                                  ? const SizedBox(
                                      height: 24,
                                    )
                                  : const SizedBox(),
                              orderDetails.data?.data?.isFinishedOrder() ==
                                          true &&
                                      orderDetails.data?.data?.rating == null
                                  ? InkWell(
                                      onTap: () {
                                        navigateToRatingOrderScreen(
                                            orderDetails.data?.data);
                                      },
                                      child: Container(
                                        height: 48.h,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        margin: const EdgeInsets.only(top: 16),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppTheme.appGrey19,
                                                width: 1)),
                                        child: Row(
                                          children: [
                                            SVGIcons.localSVG(likeIcons,
                                                width: 24.w, height: 24.h),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              context.tr(rateProductsKey),
                                              style: AppTheme
                                                  .styleWithTextMainAppColorAdelleSansExtendedFonts14w400,
                                            ),
                                            const Spacer(),
                                            SVGIcons.localSVG(enterArrowIcons,
                                                width: 8.w, height: 14.h),
                                          ],
                                        ),
                                      ),
                                    )
                                  // AppButton(
                                  //         width: double.infinity,
                                  //         text: context.tr(rateProductsKey),
                                  //         height: 40,
                                  //         onPress: () {
                                  //           navigateToRatingOrderScreen(
                                  //               orderDetails.data?.data);
                                  //         })
                                  : const SizedBox()
                            ])),
                        const SizedBox(
                          height: 16,
                        ),
                        orderDetails.data?.data?.isCanceledOrder() == true &&
                                orderDetails.data?.data?.isSingleProvider() ==
                                    true
                            ? Container(
                                decoration: BoxDecoration(color: Colors.white),
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 16, vertical: 16),
                                margin: const EdgeInsetsDirectional.only(
                                     bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.tr(canceledOnKey),
                                        style: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts18w700),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Column(
                                      children: [
                                        InformationRowItem(
                                          titleStyle: AppTheme
                                              .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                          title: context.tr(dateAndTimeKey),
                                          value:
                                              "${(orderDetails.data?.data?.createdAt ?? "").hhMm()}, ${(orderDetails.data?.data?.createdAt ?? "").ddMmYyyy()}",
                                          valueStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                          hasDivider: false,
                                        ),
                                        const SizedBox(height: 16),
                                        InformationRowItem(
                                          titleStyle: AppTheme
                                              .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                          title: context.tr(cancelledByKey),
                                          value:
                                              "${orderDetails.data?.data?.cancelledBy}",
                                          valueStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                          hasDivider: false,
                                        ),
                                        orderDetails
                                                    .data
                                                    ?.data
                                                    ?.cancellationReason
                                                    ?.isNotEmpty ==
                                                true
                                            ? const SizedBox(height: 16)
                                            : const SizedBox(),
                                        orderDetails
                                                    .data
                                                    ?.data
                                                    ?.cancellationReason
                                                    ?.isNotEmpty ==
                                                true
                                            ? InformationRowItem(
                                                titleStyle: AppTheme
                                                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                                title: context.tr(
                                                    reasonForCancellationKey),
                                                valueStyle: AppTheme
                                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                                hasDivider: false,
                                                ifSetValueInNewLine: true,
                                                value:
                                                    "${orderDetails.data?.data?.cancellationReason}}",
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(context.tr(orderInfoKey),
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts18w700),
                              const SizedBox(
                                height: 24,
                              ),
                              InformationRowItem(
                                title: context.tr(totalPriceKey),
                                titleStyle: AppTheme
                                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                value:
                                    "${context.tr(sarKey)} ${orderDetails.data?.data?.totalWithShippingFee ?? 0}",
                                valueStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                              const SizedBox(height: 16),
                              InformationRowItem(
                                title: context.tr(orderIdKey),
                                titleStyle: AppTheme
                                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                value: "${orderDetails.data?.data?.id}",
                                valueStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                              const SizedBox(height: 16),
                              InformationRowItem(
                                title: context.tr(noOfItemsKey),
                                titleStyle: AppTheme
                                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                value:
                                    "${orderDetails.data?.data?.orderItems.length} ${context.tr(itemsKey)}",
                                valueStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                              const SizedBox(height: 16),
                              InformationRowItem(
                                title: context.tr(dateAndTimeKey),
                                titleStyle: AppTheme
                                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                value:
                                    "${(orderDetails.data?.data?.createdAt ?? "").hhMm()}, ${(orderDetails.data?.data?.createdAt ?? "").ddMmYyyy()}",
                                valueStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(context.tr(recipientInfoKey),
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts18w700),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                "${orderDetails.data?.data?.receiverName}",
                                style: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                              ),
                              // InformationRowItem(
                              //   title: context.tr(recipientNameKey),
                              //   titleStyle: AppTheme
                              //       .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                              //   value:
                              //       "${orderDetails.data?.data?.receiverName}",
                              //   valueStyle: AppTheme
                              //       .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                              //   hasDivider: false,
                              // ),
                              const SizedBox(height: 16),
                              Text(
                                "${orderDetails.data?.data?.receiverPhoneNumber}",
                                style: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                              ),
                              // InformationRowItem(
                              //   // icon: SVGIcons.documentIcon(),
                              //   title: context.tr(phoneNumberKey),
                              //   titleStyle: AppTheme
                              //       .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                              //   value:
                              //       "${orderDetails.data?.data?.receiverPhoneNumber}",
                              //   valueStyle: AppTheme
                              //       .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                              //   hasDivider: false,
                              // ),
                              orderDetails.data?.data?.receiverAddress
                                              ?.isNotEmpty ==
                                          true ||
                                      orderDetails
                                              .data
                                              ?.data
                                              ?.receiverAddressDetails
                                              ?.isNotEmpty ==
                                          true
                                  ? const SizedBox(height: 16)
                                  : const SizedBox(),
                              orderDetails.data?.data?.receiverAddress
                                              ?.isNotEmpty ==
                                          true ||
                                      orderDetails
                                              .data
                                              ?.data
                                              ?.receiverAddressDetails
                                              ?.isNotEmpty ==
                                          true
                                  ? Text(
                                      "${orderDetails.data?.data?.receiverAddress ?? orderDetails.data?.data?.receiverAddressDetails}",
                                      style: AppTheme
                                          .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                    )
                                  // InformationRowItem(
                                  //         // icon: SVGIcons.calendarIcon(),
                                  //         title: context.tr(locationKey),
                                  //         titleStyle: AppTheme
                                  //             .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                  //         value:
                                  //             "${orderDetails.data?.data?.receiverAddress ?? orderDetails.data?.data?.receiverAddressDetails}",
                                  //         valueStyle: AppTheme
                                  //             .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                  //         hasDivider: false,
                                  //         ifSetValueInNewLine: true)
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Order Summary",
                                        style: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts18w700),
                                    Spacer(),
                                    orderDetails.data?.data
                                                ?.isUserCanCancelOrder() ==
                                            true
                                        ? InkWell(
                                            onTap: () {
                                              actionType =
                                                  ButtonsClickType.Cancel;
                                              showCancellationBottomSheet(
                                                  orderDetails.data?.data?.id
                                                          .toString() ??
                                                      "",
                                                  "14");
                                            },
                                            child: Container(
                                              width: 88.w,
                                              height: 33.h,
                                              decoration: BoxDecoration(
                                                  color: AppTheme
                                                      .mainAppColorLight2,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text(
                                                  context.tr(cancelOrderKey),
                                                  style: AppTheme
                                                      .styleWithTextGray7AdelleSansExtendedFonts12w400
                                                      .copyWith(
                                                          color: AppTheme
                                                              .mainAppColorDark),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),

                                ...(List.generate(
                                    orderDetails.state != DataState.LOADING
                                        ? orderDetails.data?.data?.orderItems.length ?? 0
                                        : [].length, (index) {
                                  return Skeletonizer(
                                    enabled: orderDetails.state == DataState.LOADING,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWithoutPadding(
                                             orderDetails.data?.data?.orderItems[index]
                                                  .name ??
                                                  "",
                                              style: AppTheme
                                                  .styleWithTextBlackColor2AdelleSansExtendedFonts14w500,
                                            ),
                                            const SizedBox(
                                              height: defaultPaddingHorizontal,
                                            ),
                                            ...(List.generate(
                                                orderDetails.state != DataState.LOADING
                                                    ? orderDetails
                                                    .data
                                                    ?.data
                                                    ?.orderItems[index]
                                                    .orderItems
                                                    ?.length ??
                                                    0
                                                    : [][index].orderItems?.length ??
                                                    0, (cartIndex) {
                                              return CartItemView(
                                                isReadOnlyMode: true,
                                                isOrderMode: true,
                                                orderItem:
                                                orderDetails.state != DataState.LOADING
                                                    ? orderDetails
                                                    .data
                                                    ?.data
                                                    ?.orderItems[index]
                                                    .orderItems![cartIndex]
                                                    : [][index].orderItems?[cartIndex],
                                                onUpdateQuantity:
                                                    (cartItemId, quantity) {
                                                  // updateItemQuantity(
                                                  //     cartItemId, quantity);
                                                },
                                                onDeleteItem: (cartItemId) {
                                                  // deleteCartItem(cartItemId);
                                                },
                                                onProductClickListener:
                                                    (product, cartId) {
                                                      // navigateToDetails(
                                                      //     product,
                                                      //     orderDetails
                                                      //         .data
                                                      //         ?.data
                                                      //         ?.orderItems
                                                      //         .first
                                                      //         .product !=
                                                      //         null
                                                      //         ? OrderItemType.Product
                                                      //         : OrderItemType.Service);
                                                },
                                                onServiceClickListener:
                                                    (service, cartId) {
                                                  // navigateToItemDetails(
                                                  //     ItemType.Services,
                                                  //     null,
                                                  //     service,
                                                  //     cartId);
                                                }, toggleItem: (type , id ,collectionId,inWishlist) {
                                                // toggleItem(type,id.toInt());
                                              }, cartItem: null,
                                              );
                                            })),
                                            (orderDetails.data?.data?.orderItems.length??0) - 1 != index ? const Divider(
                                              thickness: 1,
                                              color: AppTheme.appGrey6,
                                            ) : const SizedBox()
                                          ]),
                                    ),
                                  );
                                }))
                                /*...(List.generate(
                                    orderDetails
                                            .data?.data?.orderItems.length ??
                                        0,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: ProductItemCard(
                                            item: orderDetails
                                                .data?.data!.orderItems[index],
                                            onItemClick: (itemId) {
                                              // navigateToDetails(
                                              //     itemId,
                                              //     orderDetails
                                              //                 .data
                                              //                 ?.data
                                              //                 ?.orderItems
                                              //                 .first
                                              //                 .product !=
                                              //             null
                                              //         ? OrderItemType.Product
                                              //         : OrderItemType.Service);
                                            },
                                          ),
                                        ))),*/
                              ],
                            )),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr(paymentDetailsKey),
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts18w700,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              ProductRowItem(
                                title: context.tr(paymentMethodKey),
                                textValue:
                                    "${orderDetails.data?.data?.paymentMethod}",
                                titleTextStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                desTextStyle: AppTheme
                                    .styleWithTextAppGrey26AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                              ProductRowItem(
                                title: context.tr(orderPriceKey),
                                textValue:
                                    "${context.tr(sarKey)} ${(orderDetails.data?.data?.totalBeforeDiscount ?? 0)}",
                                titleTextStyle: AppTheme
                                    .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                desTextStyle: AppTheme
                                    .styleWithTextAppGrey26AdelleSansExtendedFonts14w400,
                                hasDivider: false,
                              ),
                              orderDetails.data?.data?.shippingFee != null &&
                                      orderDetails.data?.data?.shippingFee != 0
                                  ? ProductRowItem(
                                      title: context.tr(shippingFeeKey),
                                      textValue:
                                          "${context.tr(sarKey)} ${(orderDetails.data?.data?.shippingFee ?? 0)}",
                                      titleTextStyle: AppTheme
                                          .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                      desTextStyle: AppTheme
                                          .styleWithTextAppGrey26AdelleSansExtendedFonts14w400,
                                      hasDivider: false,
                                    )
                                  : SizedBox(),
                              orderDetails.data?.data?.discount != null &&
                                      orderDetails.data?.data?.discount != 0
                                  ? ProductRowItem(
                                      title: context.tr(discountKey),
                                      textValue:
                                          "-${context.tr(sarKey)} ${(orderDetails.data?.data?.discount ?? 0)}",
                                      titleTextStyle: AppTheme
                                          .styleColorCode167D2DFonts14w500,
                                      desTextStyle: AppTheme
                                          .styleColorCode167D2DFonts14w500,
                                      hasDivider: false,
                                    )
                                  : SizedBox(),
                              Divider(
                                color: AppTheme.appGrey9,
                                thickness: 1,
                              ),
                              ProductRowItem(
                                title: context.tr(totalPriceKey),
                                subTitle: "(Incl. VAT)",
                                textValue:
                                    "${context.tr(sarKey)} ${(orderDetails.data?.data?.totalWithShippingFee ?? 0)}",
                                titleTextStyle: AppTheme
                                    .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                                desTextStyle: AppTheme
                                    .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                                hasDivider: false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          // orderDetails.state == DataState.SUCCESS
          //     ? Consumer(
          //         builder: (context, watch, child) => Container(
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 24, horizontal: defaultPaddingHorizontal),
          //           child: OrderButtons(
          //               "${orderDetails.data?.data?.statusId}"
          //                   .getOrderStatusForShowButtons(context), (type) {
          //             handleOnButtonsClicks(
          //                 type ?? ButtonsClickType.ViewDetails,
          //                 orderDetails.data?.data);
          //           }, isOrderDetail: true),
          //         ),
          //       )
          //     : const SizedBox()
        ],
      ),
    );
  }

  void handleOnButtonsClicks(
      ButtonsClickType type, ClientOrderDetails? orderModel) {
    switch (type) {
      case ButtonsClickType.Accept:
        {
          // if (user?.provider?.status != "pending") {
          //   actionType = OrderStateActionType.Accepte;
          //   ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //       orderId: orderModel?.id.toString(), statusId: "2");
          // } else {
          //   AppSnackBar.showSnackBar(context,
          //       isSuccess: true, message: "Your account is still pending");
          // }
          break;
        }
      case ButtonsClickType.Cancel:
        {
          // if (user?.provider?.status != "pending") {
          actionType = ButtonsClickType.Cancel;
          //   showCancellationBottomSheet(orderModel?.id.toString() ?? "",
          //       orderModel?.orderFamily == "ready_made" ? "10" : "11");
          // } else {
          //   AppSnackBar.showSnackBar(context,
          //       isSuccess: true, message: "Your account is still pending");
          // }
          showCancellationBottomSheet(orderModel?.id.toString() ?? "", "12");

          break;
        }
      case ButtonsClickType.ReadyToShipping:
        {
          // if (user?.provider?.status != "pending") {
          //   actionType = OrderStateActionType.ReadyToShipping;
          //   ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //       orderId: orderModel?.id.toString(), statusId: "5");
          // } else {
          //   AppSnackBar.showSnackBar(context,
          //       isSuccess: true, message: "Your account is still pending");
          // }

          break;
        }
      case ButtonsClickType.Finish:
        {
          // if (user?.provider?.status != "pending") {
          //   actionType = OrderStateActionType.Finish;
          //   ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
          //       orderId: orderModel?.id.toString(), statusId: "5.5");
          // } else {
          //   AppSnackBar.showSnackBar(context,
          //       isSuccess: true, message: "Your account is still pending");
          // }

          break;
        }
      case ButtonsClickType.CompleteOrder:
        {
          actionType = ButtonsClickType.CompleteOrder;
          ref.read(manageOrderStateProvider.notifier).updateOrderState(
              orderId: orderModel?.id.toString(), statusId: "13");
        }
      case ButtonsClickType.ViewDetails:
        {}
    }
  }

  void showCancellationBottomSheet(String orderId, String statusId) {
    showMakeSureDialog(
        context: context,
        title: "Are you sure you want to cancel order?",
        action: () {
          ref
              .read(manageOrderStateProvider.notifier)
              .updateOrderState(orderId: orderId, statusId: statusId);
        });

    // showModalBottomSheet(
    //     isScrollControlled: true,
    //     context: context,
    //     shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    //     builder: (BuildContext builder) => Padding(
    //           padding: EdgeInsets.only(
    //               bottom: MediaQuery.of(context).viewInsets.bottom),
    //           child: CancelOrderBottomSheet(onOrderCancel: () {
    //
    //           }),
    //         ));
  }

  void navigateToDetails(int itemId, OrderItemType type) {
    // context.push(R_ItemOrderDetails,
    //     extra: {"id": itemId.toString(), "type": type});
  }

  void getOrderDetails() {
    ref
        .read(getOrderDetailsStateProvider.notifier)
        .getOrderDetails(orderId: widget.orderId);
  }

  void updateOrderDetails(ClientOrderDetails? clientOrderDetails) {
    ref
        .read(getOrderDetailsStateProvider.notifier)
        .updateOrderDetails(order: clientOrderDetails);
  }

  void navigateToRatingOrderScreen(ClientOrderDetails? orderDetails) async {
    var makeRefresh =
        await context.push(R_RatingOrder, extra: {orderKey: orderDetails});
    if (makeRefresh == true) {
      getOrderDetails();
    }
  }
}
