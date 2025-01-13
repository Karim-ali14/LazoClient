import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/CartItemView.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataPlaceHolder.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../../Localization/Keys.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../details/componants/ProductRowItem.dart';
import '../mainScreen/MainScreenNavHost.dart';
import 'componants/GiftBoxListView.dart';
import 'componants/GiftCardListView.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final TextEditingController voucherTextController = TextEditingController();
  GiftCard? giftCartSelected;
  GiftBox? giftBoxSelected;
  String? promocode;
  String? deleteCartItemId;
  bool thereIsAnyData = false;
  List listItems = [
    CartItemsInner(),
    CartItemsInner(),
    CartItemsInner(),
    CartItemsInner(),
    CartItemsInner(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      var sessionId = ref
          .read(getSessionHandlerStateNotifier.notifier)
          .checkIfSessionIdExist();
      getCartDetails(sessionId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartData = ref.watch(fetchCardDetailsStateNotifies);
    var cartInfo = ref.watch(cartCalculationStateNotifies);
    var giftBox = ref.watch(fetchAllGiftBoxStateNotifies);
    var giftCard = ref.watch(fetchAllGiftCardsStateNotifies);

    handleState(fetchCardDetailsStateNotifies, onSuccess: (res) {
      var cartId = res.data?.data?.id;
      calculateCartItems(cartId: cartId.toString());
      if (res.data?.data?.shipmentType ==
          CartItemTypes.unready_made.name.toLowerCase()) {
        getPackagingData();
      }
    }, onEmpty: (res) {
      print("empty data ${res.data?.data?.cartItems.length}");
      promocode = null;
      voucherTextController.clear();
    });

    handleState(showPromoCodeDetailsStateNotifies,
        showLoading: true, showToast: true, onSuccess: (res) {
      var cartId = cartData.data?.data?.id;
      promocode = res.data?.data?.code;
      calculateCartItems(cartId: cartId.toString());
    });

    handleState(updateCartItemsStateNotifies, showLoading: true,
        onSuccess: (res) {
      try {
        ref
            .read(fetchCardDetailsStateNotifies.notifier)
            .updateItem(res.data!.data!.cartItems.first);
      } catch (e) {}
    });

    handleState(deleteItemCartStateNotifies, showLoading: true,
        onSuccess: (res) {
      try {
        ref
            .read(fetchCardDetailsStateNotifies.notifier)
            .deleteItem(num.parse(deleteCartItemId ?? "0"));
        deleteCartItemId = null;
      } catch (e) {}
    });

    return Scaffold(
      body: SafeArea(
        child: cartData.state == DataState.EMPTY ||
                cartData.state == DataState.ERROR
            ? EmptyDataPlaceHolder(
                icon: SVGIcons.noCartItemsGifIcon(),
                title: "No Product Added",
                description:
                    "When you add any product to your cart, it will appear here",
                onAddOrderClick: () {})
            : RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () {
                  var sessionId = ref
                      .read(getSessionHandlerStateNotifier.notifier)
                      .checkIfSessionIdExist();
                  getCartDetails(sessionId);
                  getPackagingData();
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Skeletonizer(
                      enabled: cartData.state == DataState.LOADING,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...(List.generate(
                              cartData.state != DataState.LOADING
                                  ? cartData.data?.data?.cartItems.length ?? 0
                                  : listItems.length, (index) {
                            return Skeletonizer(
                              enabled: cartData.state == DataState.LOADING,
                              child: CartItemView(
                                cartItem: cartData.state != DataState.LOADING
                                    ? cartData.data?.data?.cartItems[index]
                                    : listItems[index],
                                onUpdateQuantity: (cartItemId, quantity) {
                                  updateItemQuantity(cartItemId, quantity);
                                },
                                onDeleteItem: (cartItemId) {
                                  deleteCartItem(cartItemId);
                                },
                                onEditProduct: (product, cartId) {
                                  navigateToItemDetails(
                                      ItemType.Products, product, null, cartId);
                                },
                                onEditService: (service, cartId) {
                                  navigateToItemDetails(
                                      ItemType.Services, null, service, cartId);
                                },
                              ),
                            );
                          })),
                          SizedBox(
                            height: 32,
                          ),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? Skeleton.replace(
                                  replacement: Container(
                                    width: 120,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "Wrap your gift",
                                    style: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                  ),
                                )
                              : const SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? SizedBox(
                                  height: 24,
                                )
                              : SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? Skeleton.replace(
                                  replacement: SizedBox(),
                                  child: SizedBox(
                                    height: 208,
                                    child: GiftBoxListView(
                                        data: giftBox.data?.data,
                                        isLoading: giftBox.state ==
                                            DataState.LOADING, (giftBox) {
                                      giftBoxSelected = giftBox;
                                      calculateCartItems(
                                        cartId: (cartData.data?.data?.id ?? 0)
                                            .toString(),
                                        // giftCardId: giftCartSelected?.id.toString(),
                                        // giftBoxId: giftBoxSelected?.id.toString(),
                                        // promocode: promocode
                                      );
                                    }),
                                  ),
                                )
                              : SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? SizedBox(
                                  height: 24,
                                )
                              : SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? Row(
                                  children: [
                                    Text(
                                      "Choose your gift card",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                    ),
                                    Spacer(),
                                    Text(
                                      "(optional)",
                                      style: AppTheme
                                          .styleWithTextAppGrey15AdelleSansExtendedFonts14w400,
                                    )
                                  ],
                                )
                              : const SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? SizedBox(
                                  height: 24,
                                )
                              : const SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? Skeleton.replace(
                                  replacement: SizedBox(),
                                  child: SizedBox(
                                    height: 208,
                                    child: GiftCardListView(
                                        data: giftCard.data?.data ?? [],
                                        isLoading: giftCard.state ==
                                            DataState.LOADING, (gift) {
                                      giftCartSelected = gift;
                                      calculateCartItems(
                                        cartId: (cartData.data?.data?.id ?? 0)
                                            .toString(),
                                      );
                                    }),
                                  ),
                                )
                              : const SizedBox(),
                          cartData.data?.data?.shipmentType ==
                                  CartItemTypes.unready_made.name.toLowerCase()
                              ? SizedBox(
                                  height: 24,
                                )
                              : const SizedBox(),
                          Text(
                            "Save on your order",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts18w700,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          AppTextField(
                            // XGFSF35
                            hint: "Enter Voucher code",
                            label: "Enter Voucher code",
                            textFieldBorderColor: AppTheme.appGrey3,
                            textEditingController: voucherTextController,
                            startWidget: SVGIcons.voucherIcon(),
                            endWidget: InkWell(
                              onTap: () {
                                if (voucherTextController.text.isNotEmpty) {
                                  getPromoCodeDetails();
                                }
                              },
                              child: SizedBox(
                                  width: 70,
                                  height: 56,
                                  child: Center(
                                      child: Text(
                                    "submit",
                                    style: AppTheme
                                        .styleWithTextMainAppColorAdelleSansExtendedFonts14w400
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  ))),
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 12),
                          //   height: 56,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(1),
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       SVGIcons.voucherIcon(),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Payment Summary",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts18w700,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppTheme.appGrey8),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ProductRowItem(
                                    title: "Order Price",
                                    textValue:
                                        "SAR ${(cartInfo.data?.data?.totalBefore ?? 0)}",
                                    titleTextStyle: AppTheme
                                        .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                                    desTextStyle: AppTheme
                                        .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                  ),
                                ),
                                cartInfo.data?.data?.shippingFee != null &&
                                        cartInfo.data?.data?.shippingFee != 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: ProductRowItem(
                                          title: "Shipping Fees",
                                          textValue:
                                              "SAR ${(cartInfo.data?.data?.shippingFee ?? 0)}",
                                          titleTextStyle: AppTheme
                                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500,
                                          desTextStyle: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                        ),
                                      )
                                    : SizedBox(),
                                cartInfo.data?.data?.discountTotal != null &&
                                        cartInfo.data?.data?.discountTotal != 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: ProductRowItem(
                                          title: "Discount",
                                          textValue:
                                              "SAR ${(cartInfo.data?.data?.discountTotal ?? 0)}",
                                          titleTextStyle: AppTheme
                                              .styleWithTextBlackColorAdelleSansExtendedFonts12w500
                                              .copyWith(
                                                  color: AppTheme.mainAppColor),
                                          desTextStyle: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400
                                              .copyWith(
                                                  color: AppTheme.mainAppColor),
                                        ),
                                      )
                                    : SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ProductRowItem(
                                    title: "Total Price",
                                    textValue:
                                        "SAR ${(cartInfo.data?.data?.totalAfter ?? 0)}",
                                    titleTextStyle: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts16w700,
                                    desTextStyle: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts16w700,
                                    hasDivider: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          AppButton(
                              text: "Check Out",
                              width: double.infinity,
                              height: 46,
                              onPress: () {
                                if (ref
                                        .read(clientStateProvider.notifier)
                                        .checkIfUserExist() !=
                                    null) {
                                  if (giftBoxSelected != null &&
                                      cartData.data?.data?.shipmentType ==
                                          CartItemTypes.unready_made.name
                                              .toLowerCase()) {
                                    var data = {
                                      giftBoxIdKey:
                                          giftBoxSelected?.id.toString() ?? "",
                                      orderTypeKey:
                                          OrderTypes.receiver_order.name
                                    };
                                    if (giftCartSelected != null &&
                                        cartData.data?.data?.shipmentType ==
                                            CartItemTypes.unready_made.name
                                                .toLowerCase()) {
                                      data[giftCardIdKey] =
                                          giftCartSelected?.id?.toString() ??
                                              "";
                                    }
                                    if (promocode?.isNotEmpty == true) {
                                      data[promocodeKey] = promocode ?? "";
                                    }
                                    ref
                                        .read(cartDateSelectedStateNotifiers
                                            .notifier)
                                        .setCartDataSelection(data);
                                    checkout();
                                  } else if (cartData
                                          .data?.data?.shipmentType ==
                                      CartItemTypes.ready_made.name) {
                                    var data = {
                                      orderTypeKey:
                                          OrderTypes.receiver_order.name
                                    };

                                    if (promocode?.isNotEmpty == true) {
                                      data[promocodeKey] = promocode ?? "";
                                    }
                                    ref
                                        .read(cartDateSelectedStateNotifiers
                                            .notifier)
                                        .setCartDataSelection(data);
                                    checkout();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Please select a gift box",
                                      ),
                                    ));
                                  }
                                } else {
                                  showAuthenticated();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void showAuthenticated() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => AuthenticateBottomSheet(
              onLoginClicked: () {
                navigateToLogin();
              },
            ));
  }

  void navigateToLogin() async {
    var makeRefresh =
        await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if (makeRefresh == true) {
      getCartDetails(null);
    }
  }

  void calculateCartItems({String? cartId}) {
    print(
        "cartId :$cartId giftCardId: ${giftCartSelected?.id} giftBoxId: ${giftBoxSelected?.id}");
    ref.read(cartCalculationStateNotifies.notifier).cartCalculation(
        cartId: cartId,
        promocode: promocode,
        giftCardId: giftCartSelected?.id?.toString(),
        giftBoxId: giftBoxSelected?.id?.toString());
  }

  void getPromoCodeDetails() {
    ref
        .read(showPromoCodeDetailsStateNotifies.notifier)
        .showPromoCodeDetails(code: voucherTextController.text);
  }

  void updateItemQuantity(num cartItemId, num quantity) {
    ref.read(updateCartItemsStateNotifies.notifier).updateCartItems(
        cartItemId: cartItemId.toString(), quantity: quantity.toString());
  }

  void deleteCartItem(num cartItemId) {
    deleteCartItemId = cartItemId.toString();
    ref
        .read(deleteItemCartStateNotifies.notifier)
        .deleteItemCart(cartItemId: cartItemId.toString());
  }

  void navigateToItemDetails(ItemType itemType, ProductDetails? product,
      ServiceShowData? service, int cartId) {
    var itemId = itemType == ItemType.Products ? product?.id : service?.id;
    var itemName =
        itemType == ItemType.Products ? product?.name : service?.name;
    var categoriesIds = itemType == ItemType.Products
        ? product?.categories.map((item) => (item.id ?? 0).toInt()).toList() ??
            []
        : service?.categories.map((item) => (item.id ?? 0).toInt()).toList() ??
            [];
    context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds,
      "product": product,
      "service": service,
      "cartId": cartId
    });
  }

  void checkout() async {
    var success = await context.push(R_CheckoutScreen,
            extra: {"type": CheckoutTypes.HartCard}) as bool? ??
        false;
    getCartDetails(null);
    if (success == true) {
      navigateToHomeScreen();
    }
  }

  void navigateToHomeScreen() {
    (context.findAncestorStateOfType<MainScreenNavHostState>()
            as MainScreenNavHostState)
        .onItemTapped(0);
  }

  void getCartDetails(String? sessionId) {
    ref
        .read(fetchCardDetailsStateNotifies.notifier)
        .getCardDetails(sessionId: sessionId);
  }

  void getPackagingData() {
    ref.read(fetchAllGiftBoxStateNotifies.notifier).fetchAllGiftBox();
    ref.read(fetchAllGiftCardsStateNotifies.notifier).fetchAllGiftCards();
  }
}
