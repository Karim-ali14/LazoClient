import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants/Constants.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataPlaceHolder.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../../Constants/Eunms.dart';
import '../../../Localization/Keys.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../details/componants/ProductRowItem.dart';
import '../mainScreen/MainScreenNavHost.dart';
import 'componants/CartItemView.dart';
import 'componants/GiftBoxListView.dart';
import 'componants/GiftCardListView.dart';
import 'componants/cart_items_with_notes.dart';

class CartScreen extends ConsumerStatefulWidget {

  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends ConsumerState<CartScreen> with AutomaticKeepAliveClientMixin{
  final TextEditingController voucherTextController = TextEditingController();
  GiftCard? giftCartSelected;
  GiftBox? giftBoxSelected;
  String? promocode;
  bool thereIsAnyData = false;
  final ValueNotifier<bool> promoCodeState = ValueNotifier(false);

  final GlobalKey _key = GlobalKey();
  double? _height;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      var sessionId = ref
          .read(getSessionHandlerStateNotifier.notifier)
          .checkIfSessionIdExist();
      getCartDetails(sessionId);
      calculateHeight();
    });
    super.initState();
  }
  @override
  bool get wantKeepAlive => true; // This keeps the screen alive

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required to call in widgets with AutomaticKeepAliveClientMixin
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
      promocode = null;
      voucherTextController.clear();
    });

    handleState(showPromoCodeDetailsForHardServiceStateNotifies,
        showLoading: true, showToast: true, onSuccess: (res) {
      var cartId = cartData.data?.data?.id;
      promocode = res.data?.data?.code;
      promoCodeState.value = true;
      calculateCartItems(cartId: cartId.toString());
    });

    handleState(updateCartItemsStateNotifies, showLoading: true,
        onSuccess: (res) {
      try {
        // ref
        //     .read(fetchCardDetailsStateNotifies.notifier)
        //     .updateItem(res.data!.data!.cartItems.first);
      } catch (e) {}
    });

    return Scaffold(
      // appBar: CustomAppBar(
      //   appContext: context,
      //   navigated: true,
      // ),
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
                        key: _key,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CartItemsWithNotes(),
                          const SizedBox(
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
                                    height: 210,
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
                              : const SizedBox(),
                          const Text(
                            "Save on your order",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts18w700,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ValueListenableBuilder(
                            valueListenable: promoCodeState,
                            builder: (context,value,_) {
                              return AppTextField( /*New Money*/
                                readOnly: value,
                                hint: "Enter Voucher code",
                                label: null,
                                style: !value ? TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color,fontSize: 16) : const TextStyle(fontSize: 0),
                                startWidget: value ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 16.0,end: 8),
                                      child: Text("${voucherTextController.text}",
                                        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color,fontSize: 16),),
                                    ),
                                    const SizedBox(width: 4),
                                    SVGIcons.localSVG(correctVoucherIcons,width: 16,height: 16,),
                                  ],
                                ) : null,
                                textEditingController: voucherTextController,
                                endWidget: InkWell(
                                  onTap: () {
                                    if(value){
                                        voucherTextController.text = "";
                                        promocode = null;
                                        promoCodeState.value = false;
                                    }else if (voucherTextController.text.isNotEmpty) {
                                      getPromoCodeDetails();
                                    }
                                  },
                                  child: SizedBox(
                                      width: 70,
                                      height: 56,
                                      child: Center(
                                          child: Text(
                                            value ? "Remove" : "Apply",
                                        style: AppTheme
                                            .styleWithTextMainAppColorAdelleSansExtendedFonts14w400
                                            .copyWith(
                                                decoration: TextDecoration.underline),
                                      ))),
                                ),
                              );
                            }
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          const Text(
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
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ProductRowItem(
                                    hasDivider: false,
                                    title: "Order Price",
                                    textValue:
                                        "SAR ${(cartInfo.data?.data?.totalBefore ?? 0)}",
                                    titleTextStyle: AppTheme
                                        .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                    desTextStyle: AppTheme
                                        .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                  ),
                                ),
                                cartInfo.data?.data?.shippingFee != null &&
                                        cartInfo.data?.data?.shippingFee != 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: ProductRowItem(
                                          hasDivider: false,
                                          title: "Shipping Fees",
                                          textValue:
                                              "SAR ${(cartInfo.data?.data?.shippingFee ?? 0)}",
                                          titleTextStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                          desTextStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                        ),
                                      )
                                    : SizedBox(),
                                cartInfo.data?.data?.packagingFee != null &&
                                        cartInfo.data?.data?.packagingFee != 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: ProductRowItem(
                                          hasDivider: false,
                                          title: "Package Fees",
                                          textValue:
                                              "SAR ${(cartInfo.data?.data?.packagingFee ?? 0)}",
                                          titleTextStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                          desTextStyle: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
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
                                              .styleColorCode167D2DFonts14w500,
                                          desTextStyle: AppTheme
                                              .styleColorCode167D2DFonts14w500,
                                        ),
                                      )
                                    : SizedBox(),
                                const Divider(
                                  color: AppTheme.appGrey20,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Wrap(
                                    children: [
                                      ProductRowItem(
                                        title: "Total Price",
                                        subTitle: "(Incl. VAT)",
                                        textValue:
                                            "SAR ${(cartInfo.data?.data?.totalAfter ?? 0)}",
                                        titleTextStyle: AppTheme
                                            .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                                        desTextStyle: AppTheme
                                            .styleWithTextAppBlackAdelleSansExtendedFonts14w700,
                                        hasDivider: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          // Row(
                          //   children: [
                          //     // SVGIcons.localSVG(paymentTypesIcons,width: 132.w,height: 21.h)
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 32,
                          // ),
                          // AppButton(
                          //     text: "Check Out",
                          //     width: double.infinity,
                          //     height: 46,
                          //     onPress: () {
                          //
                          //     })
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
              }, onSignUpClicked: () {
                navigateToSignUp();
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
  void navigateToSignUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.ViewMode});
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
        .read(showPromoCodeDetailsForHardServiceStateNotifies.notifier)
        .showPromoCodeDetails(code: voucherTextController.text);
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

  void calculateHeight() {
    var box = _key.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _height = box.size.height;
    });
  }

  void actionClick({Function? afterPassConditions,Function? onCannotPassConditions}){
    var cartData = ref.watch(fetchCardDetailsStateNotifies);
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
        // checkout();
        afterPassConditions?.call();
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
        afterPassConditions?.call();
        // checkout();
      } else {
        onCannotPassConditions?.call();
      }
    } else {
      showAuthenticated();
    }
  }
}
