import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Models/UpdateDataModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Localization/Keys.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ItemDetailsRow.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductMultipleSelectItems.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductMultipleSelectItemsModify.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductSingleSelectItems.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Assets.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/Eunms.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../BottomSheets/RatingBottomSheet.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/BannerCardItems.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TruncatedText.dart';
import 'componants/BrandDetails.dart';
import 'componants/ProductRowItem.dart';
import 'componants/ProductSingleSelectItemsModify.dart';

class ProductAndServiceDetailsScreen extends ConsumerStatefulWidget {
  final String? id;
  final ItemType? itemType;
  final String? name;
  final List<int>? relatedCategoriesIds;
  final ProductDetails? productDetails;
  final ServiceShowData? serviceShowData;
  final int? cartId;
  const ProductAndServiceDetailsScreen(
      {this.name,
      this.id,
      this.relatedCategoriesIds,
      this.itemType,
      this.productDetails,
      this.serviceShowData,
      this.cartId,
      super.key});

  @override
  ConsumerState<ProductAndServiceDetailsScreen> createState() =>
      _ProductAndServiceDetailsScreenState();
}

class _ProductAndServiceDetailsScreenState
    extends ConsumerState<ProductAndServiceDetailsScreen> {
  var makeRefresh = false;

  Future<bool> _onWillPop() async {
    context.pop(UpdateDataModel(
        updateRelatedData: true, updateNormalData: makeRefresh));
    return false; // Return true to allow the pop action, false to prevent it
  }

  final Map<int, List<String>> productSelectedItemsIds = {};
  final Map<int, List<String>> productSelectedMultipleItems = {};
  final Map<int, List<String>> serviceSelectedItemsIds = {};
  final Map<int, List<String>> serviceSelectedItemsNames = {};
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (widget.itemType == ItemType.Products) {
        if (widget.productDetails == null) {
          getDetailsForProduct();
        } else {
          ref.read(getProductDetails.notifier).getProductDetails(
              productId: widget.id, product: widget.productDetails);
        }
        getRelatedProducts();
      } else {
        if (widget.serviceShowData == null) {
          getDetailsForService();
        } else {
          ref.read(getServiceDetails.notifier).getServiceDetails(
              serviceId: widget.id, service: widget.serviceShowData);
        }

        getRelatedServices();
      }
    });

    super.initState();
  }

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    final productItemState = ref.watch(getProductDetails);
    final serviceItemState = ref.watch(getServiceDetails);
    final relatedProductData = ref.watch(getRelatedProductsStateNotifiers);
    final relatedServiceData = ref.watch(getRelatedServicesStateNotifiers);
    final sellerReview = ref.watch(getSellerDetailsToShowReviewsStateNotifier);

    handleState(getProductDetails, showLoading: false, onSuccess: (res) {
      res.data?.data?.lists?.forEach((item) {
        if (item.clientSelectedItemsInCart?.isNotEmpty == true) {
          productSelectedItemsIds[int.tryParse((item.id ?? 0).toString()) ??
              0] = item.clientSelectedItemsInCart
                  ?.map((item) => item.id.toString())
                  .toList() ??
              [];
        }
      });
      print(
          "productSelectedItemsIds : $productSelectedItemsIds , productSelectedMultipleItems : $productSelectedMultipleItems");
    });

    handleState(updateCartItemsStateNotifies, showLoading: true,
        onSuccess: (res) {
      updateCart();
      context.pop();
    });

    handleState(getSellerDetailsToShowReviewsStateNotifier, showLoading: true,onSuccess: (res) {
      showReviewsBottomSheet(type: FilterScreenTypes.Sellers,sellerRatingsList: res.data?.data?.ratings);
    });

    handleState(addProductToCartUseCaseStateNotifier,
        showLoading: true, showToast: true, onSuccess: (res) {
      var id = res.data?.data?.productId;
      print("product id : $id");
      if (id != null) {
        ref
            .read(fetchCardDetailsStateNotifies.notifier)
            .getCardDetails(sessionId: res.data?.data?.sessionId);
        ref.read(getProductDetails.notifier).handelAddProductToCart(id);
        ref.read(homeDataStateNotifiers.notifier).handleAddProductToCart(id);
        ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
        ref
            .read(getRelatedProductsStateNotifiers.notifier)
            .handleAddProductToCart(id);
      }
    });

    handleState(addServiceToCartUseCaseStateNotifier,
        showLoading: true, showToast: true, onSuccess: (res) {
      var id = res.data?.data?.serviceId;
      if (id != null) {
        var sessionId = ref
            .read(getSessionHandlerStateNotifier.notifier)
            .checkIfSessionIdExist();
        ref
            .read(fetchCardDetailsStateNotifies.notifier)
            .getCardDetails(sessionId: res.data?.data?.sessionId);
        ref.read(getServiceDetails.notifier).handelAddServiceToCart(id);
        ref.read(homeDataStateNotifiers.notifier).handelAddServiceToCart(id);
        ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
        ref
            .read(getRelatedServicesStateNotifiers.notifier)
            .handelAddServiceToCart(id);
      }
    });

    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref
          .read(getSellerDetailsWithProductStateNotifier.notifier)
          .handleAddProductToWishList(
              res.data?.data?.productId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getProductDetails.notifier).handelAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
          res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref
          .read(getRelatedProductsStateNotifiers.notifier)
          .handleAddProductToWishList(res.data?.data?.productId ?? 0,
              res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);
    });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
      ref
          .read(getSellerDetailsWithServicesStateNotifier.notifier)
          .handleAddServiceToWishList(
              res.data?.data?.serviceId?.toInt() ?? 0,
              res.data?.data?.categoriesIds ?? [],
              res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getServiceDetails.notifier).handelAddServiceToWishList(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
          res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);

      ref
          .read(getRelatedServicesStateNotifiers.notifier)
          .handelAddServiceToWishlist(res.data?.data?.serviceId ?? 0,
              res.data?.data?.inWishlist ?? false,res.data?.data?.collectionId);
    });

    handleState(getProductReviews, showLoading: true, onSuccess: (res) {
      showReviewsBottomSheet(type : FilterScreenTypes.Products,productAndServiceRatingsList: res.data?.data?.ratings);
    });
    handleState(getServiceReviews, showLoading: true, onSuccess: (res) {
      showReviewsBottomSheet(productAndServiceRatingsList:res.data?.data?.ratings,type: FilterScreenTypes.Services);
    });

    final expandedHeight = 380.h;
    final imageHeight = 400.h;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false, // Add this line
                  expandedHeight: expandedHeight,
                  titleSpacing: 0,
                  pinned: true,
                  elevation: 0,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddingHorizontal),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              context.pop();
                            },
                            child: SVGIcons.localSVG(backWithBackgroundIcon,
                                width: 32, height: 32)),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              if (client != null) {
                                widget.itemType == ItemType.Products
                                    ? productWishlistToggle(productItemState
                                            .data?.data?.id
                                            ?.toInt() ??
                                        0)
                                    : serviceWishlistToggle(serviceItemState
                                            .data?.data?.id
                                            ?.toString() ??
                                        "");
                              } else {
                                showAuthenticated();
                              }
                            },
                            child: widget.itemType == ItemType.Products
                                ? productItemState.data?.data?.inWishlist ==
                                        true
                                    ? SVGIcons.activeFavoriteIcon()
                                    : SVGIcons.localSVG(
                                        unFavoriteWithBackgroundIcon,
                                        width: 32,
                                        height: 32)
                                : serviceItemState.data?.data?.inWishlist ==
                                        true
                                    ? SVGIcons.activeFavoriteIcon()
                                    : SVGIcons.localSVG(
                                        unFavoriteWithBackgroundIcon,
                                        width: 32,
                                        height: 32)),
                        SizedBox(
                          width: 8,
                        ),
                        SVGIcons.localSVG(shareWithBackgroundIcon,
                            width: 32, height: 32)
                      ],
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        BannerCardItems(
                          list: widget.itemType == ItemType.Products
                              ? (productItemState.data?.data?.images?.map(
                                          (item) => item.imagePath ?? "") ??
                                      [])
                                  .toList()
                              : (serviceItemState.data?.data?.images?.map(
                                          (item) => item.imagePath ?? "") ??
                                      [])
                                  .toList(),
                          height: imageHeight,
                          radius: 0,
                          width: MediaQuery.of(context).size.width,
                          showLoading: false,
                          showIndicator: false,
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Row(
                            children: [
                              Spacer(),
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    end: 10, bottom: 13.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppTheme.appPink2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.itemType == ItemType.Products
                                          ? (productItemState.data?.data
                                                      ?.overallRating ??
                                                  0)
                                              .toString()
                                          : (serviceItemState.data?.data
                                                      ?.overallRating ??
                                                  0)
                                              .toString(),
                                      style: AppTheme
                                          .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                                    ),
                                    SizedBox(width: 3),
                                    SVGIcons.smallStarIcon(),
                                    SizedBox(width: 3),
                                    InkWell(
                                      onTap: () {
                                        showAllReviews(
                                            widget.id,
                                            widget.itemType == ItemType.Products
                                                ? FilterScreenTypes.Products
                                                : FilterScreenTypes.Services);
                                      },
                                      child: Text(
                                          "(${widget.itemType == ItemType.Products ? (productItemState.data?.data?.ratingsCount ?? 0).toString() : (serviceItemState.data?.data?.ratingsCount ?? 0).toString()}) Reviews",
                                          style: AppTheme
                                              .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w500
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .underline)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddingHorizontal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              TruncatedText(
                                  text:
                                      "${widget.itemType == ItemType.Products ? productItemState.data?.data?.name : serviceItemState.data?.data?.name} ",
                                  style: AppTheme
                                      .styleWithTextBlackColor2AdelleSansExtendedFonts20w500,
                                  maxLength: 30),
                              Spacer(),
                              widget.itemType == ItemType.Products
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.appPink,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        child: Text(
                                          "${productItemState.data?.data?.amount ?? 0} In Stock",
                                          style: AppTheme
                                              .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "By ${productItemState.data?.data?.provider?.name ?? ""}",
                            style: AppTheme
                                .styleWithTextAppGrey18ColorAdelleSansExtendedFonts16w400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "SAR ${widget.itemType == ItemType.Products ? productItemState.data?.data?.priceAfterDiscount ?? "" : serviceItemState.data?.data?.priceAfterDiscount ?? ""}",
                                style: AppTheme
                                    .styleWithTextAppRedColorAdelleSansExtendedFonts16w400,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              widget.itemType == ItemType.Products
                                  ? productItemState
                                              .data?.data?.priceAfterDiscount !=
                                          productItemState.data?.data?.price
                                      ? Text(
                                          "SAR ${productItemState.data?.data?.price ?? ""}",
                                          style: AppTheme
                                              .styleWithTextAppGrey18ColorAdelleSansExtendedFonts16w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      : SizedBox()
                                  : serviceItemState
                                              .data?.data?.priceAfterDiscount !=
                                          serviceItemState.data?.data?.price
                                      ? Text(
                                          "SAR ${serviceItemState.data?.data?.price ?? ""}",
                                          style: AppTheme
                                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        )
                                      : SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Divider(
                              height: 1,
                              color: AppTheme.appGrey20,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Description",
                            style: AppTheme
                                .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ExpandedText(
                            textValue:
                                "${widget.itemType == ItemType.Products ? productItemState.data?.data?.description : serviceItemState.data?.data?.description} ",
                            textStyle: AppTheme
                                .styleWithTextAppGrey18AdelleSansExtendedFonts14w400
                                .copyWith(height: 1.5),
                            maxLength: 200,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          if (widget.itemType == ItemType.Products)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Product",
                                  style: AppTheme
                                      .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                                ),
                                ItemDetailsRow(
                                  title: "Type:",
                                  textValue:
                                      "${productItemState.data?.data?.type}",
                                  valueTextStyle: AppTheme
                                      .styleWithTextAppGrey21AdelleSansExtendedFonts14w400
                                      .copyWith(
                                          decoration: TextDecoration.underline),
                                  extraWidget: InkWell(
                                    onTap: (){
                                      showUnreadyGiftDialog(context,productItemState.data?.data?.type == ProductType.ready_made_gifts.name ? ProductTypes.ready_made_gifts : ProductTypes.various_gifts);
                                    },
                                    child: SVGIcons.localSVG(giftIconIcon,
                                        width: 18, height: 18),
                                  ),
                                  onValueClick: () {
                                    showUnreadyGiftDialog(context,productItemState.data?.data?.type == ProductType.ready_made_gifts.name ? ProductTypes.ready_made_gifts : ProductTypes.various_gifts);
                                  },
                                ),
                                productItemState
                                    .data?.data?.colors.isNotEmpty == true ? ItemDetailsRow(
                                  title: "Color:",
                                  textValue: productItemState
                                      .data?.data?.colors.first.name,
                                ) : const SizedBox(),
                                ItemDetailsRow(
                                  title: "Product Size:",
                                  textValue:
                                      "${productItemState.data?.data?.sizes.first.name}",
                                ),
                                // ProductRowItem(
                                //   title: "Categories",
                                //   textValue:
                                //       "${productItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}"
                                //           .ellipsize(28),
                                //   hasDivider: true,
                                // ),
                                // ProductRowItem(
                                //   title: "Occasions",
                                //   textValue:
                                //       "${productItemState.data?.data?.occasions.map((item) => item.nameEn).join(" - ")}"
                                //           .ellipsize(28),
                                //   hasDivider: true,
                                // ),
                                ItemDetailsRow(
                                  title: "Time for processing:",
                                  textValue:
                                      "${productItemState.data?.data?.expectedProcessingTime}"
                                          .ellipsize(28),
                                ),
                              ],
                            )
                          else if (widget.itemType == ItemType.Services)
                            StatefulBuilder(
                              builder: (context, setState) {
                                // Your item list
                                final List<Widget> itemDetails = [
                                  ItemDetailsRow(
                                    title: "Service Duration",
                                    textValue: serviceItemState
                                        .data?.data?.duration
                                        ?.ellipsize(28),
                                  ),
                                  ItemDetailsRow(
                                    title: "Card Type",
                                    textValue:
                                        "${serviceItemState.data?.data?.cardType}",
                                  ),
                                  if (serviceItemState.data?.data?.cardPrice !=
                                      null)
                                    ItemDetailsRow(
                                      title: "Price for hard card",
                                      textValue:
                                          "SAR ${serviceItemState.data?.data?.cardPrice}",
                                    ),
                                  ItemDetailsRow(
                                    title: "Card Duration",
                                    textValue:
                                        "${serviceItemState.data?.data?.cardExpiration}"
                                            .ellipsize(28),
                                  ),
                                  ItemDetailsRow(
                                    title: "Out of the store",
                                    textValue: (serviceItemState.data?.data
                                                ?.isServiceDeliverableOutsideStore ==
                                            1
                                        ? "Yes"
                                        : "No"),
                                  ),
                                  ItemDetailsRow(
                                    title: "Categories :",
                                    textValue:
                                        "${serviceItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}"
                                            .ellipsize(28),
                                  ),
                                ];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About Service",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                    ),
                                    ...(!showAll
                                        ? itemDetails.take(3)
                                        : itemDetails),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showAll = !showAll;
                                            });
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              showAll
                                                  ? "Show Less"
                                                  : "Show More",
                                              style: AppTheme
                                                  .styleWithTextMainAppColorAdelleSansExtendedFonts12w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 6,
                                            ),
                                            SVGIcons.localSVG(
                                                !showAll
                                                    ? showMoreIcon
                                                    : showLessIcon,
                                                width: 5,
                                                height: 5),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          SizedBox(
                            height: 24,
                          ),
                          BrandDetails(
                            provider: widget.itemType == ItemType.Products
                                ? productItemState.data?.data?.provider
                                : serviceItemState.data?.data?.provider,
                            onProviderClick: (sellerId) {
                              navigateToSellerDetails(sellerId ?? 0);
                            },
                            onReviewClick: (sellerId) {
                              showAllReviews(sellerId.toString(),
                                  FilterScreenTypes.Sellers);
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Divider(
                              height: 1,
                              color: AppTheme.appGrey20,
                            ),
                          ),
                          if (widget.itemType == ItemType.Products)
                            ...(List.generate(
                                productItemState.data?.data?.lists?.length ?? 0,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${productItemState.data?.data!.lists?[index].name}",
                                              style: AppTheme
                                                  .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppTheme.appPink,
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                child: Text(
                                                  "Optional",
                                                  style: AppTheme
                                                      .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          productItemState
                                                      .data
                                                      ?.data
                                                      ?.lists?[index]
                                                      .isMultiSelectable ==
                                                  0
                                              ? "(Choose 1)"
                                              : "(Choose items from the list)",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        IntrinsicHeight(
                                          child: productItemState
                                                      .data
                                                      ?.data
                                                      ?.lists?[index]
                                                      .isMultiSelectable ==
                                                  0
                                              ? ProductSingleSelectItemsModify(
                                                  list: productItemState
                                                          .data
                                                          ?.data
                                                          ?.lists?[index]
                                                          .items
                                                          .map((item) =>
                                                              ItemSelector(
                                                                  item.id?.toInt() ??
                                                                      0,
                                                                  item.name ??
                                                                      "",
                                                                  Text(
                                                                    "(+SAR ${item.price})",
                                                                    style: AppTheme
                                                                        .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                                                  )))
                                                          .toList() ??
                                                      [],
                                                  onItemSelect: (item, id) {
                                                    var categoryId =
                                                        productItemState
                                                                .data
                                                                ?.data
                                                                ?.lists?[index]
                                                                .id
                                                                ?.toInt() ??
                                                            0;
                                                    if (item != null) {
                                                      productSelectedItemsIds[
                                                          categoryId] = ["$id"];
                                                    } else {
                                                      if (productSelectedItemsIds
                                                          .containsKey(
                                                              categoryId)) {
                                                        productSelectedItemsIds
                                                            .remove(categoryId);
                                                      }
                                                      // productSelectedItemsIds[
                                                      //     categoryId] = [];
                                                    }
                                                  },
                                                  itemSelectedId: productItemState
                                                              .data
                                                              ?.data
                                                              ?.lists?[index]
                                                              .clientSelectedItemsInCart
                                                              ?.isNotEmpty ==
                                                          true
                                                      ? productItemState
                                                          .data
                                                          ?.data
                                                          ?.lists![index]
                                                          .clientSelectedItemsInCart
                                                          ?.first
                                                          .id
                                                          ?.toInt()
                                                      : null,
                                                )
                                              : ProductMultipleSelectItemsModify(
                                                  list: productItemState
                                                          .data
                                                          ?.data
                                                          ?.lists?[index]
                                                          .items
                                                          .map((item) =>
                                                              ItemSelector(
                                                                  item.id?.toInt() ??
                                                                      0,
                                                                  item.name ??
                                                                      "",
                                                                  Text(
                                                                    "(+SAR ${item.price})",
                                                                    style: AppTheme
                                                                        .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,
                                                                  )))
                                                          .toList() ??
                                                      [],
                                                  onItemSelect: (items,itemsNames) {
                                                    var categoryId =
                                                        productItemState
                                                                .data
                                                                ?.data
                                                                ?.lists?[index]
                                                                .id
                                                                ?.toInt() ??
                                                            0;
                                                    if (items.isEmpty) {
                                                      if (productSelectedItemsIds
                                                          .containsKey(
                                                              categoryId)) {
                                                        productSelectedItemsIds
                                                            .remove(categoryId);
                                                      }
                                                    } else {
                                                      productSelectedItemsIds[
                                                          categoryId] = items;
                                                    }
                                                  },
                                                  itemSelect: productItemState
                                                          .data
                                                          ?.data
                                                          ?.lists?[index]
                                                          .clientSelectedItemsInCart
                                                          ?.map((toElement) =>
                                                              toElement.id
                                                                  .toString())
                                                          .toList() ??
                                                      [],
                                                ),
                                        ),
                                      ],
                                    )))
                          else
                            ...(List.generate(
                                serviceItemState.data?.data?.lists?.length ?? 0,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${serviceItemState.data?.data!.lists?[index].name}",
                                              style: AppTheme
                                                  .styleWithTextBlackColor2AdelleSansExtendedFonts16w400,
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppTheme.appPink,
                                                borderRadius:
                                                BorderRadius.circular(7),
                                              ),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4),
                                                child: Text(
                                                  "Optional",
                                                  style: AppTheme
                                                      .styleWithTextBlackColor2ColorAdelleSansExtendedFonts13w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          serviceItemState
                                              .data
                                              ?.data
                                              ?.lists?[index]
                                              .isMultiSelectable ==
                                              0
                                              ? "(Choose 1)"
                                              : "(Choose items from the list)",
                                          style: AppTheme
                                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        IntrinsicHeight(
                                          child: ProductMultipleSelectItemsModify(
                                            list: serviceItemState.data?.data
                                                    ?.lists?[index].items
                                                    .map((item) =>
                                                        ItemSelector(
                                                            item.id?.toInt() ??
                                                                0,
                                                            item.name ?? "",
                                                            Text(
                                                              "SAR ${item.price}",
                                                              style: AppTheme
                                                                  .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                                            )))
                                                    .toList() ??
                                                [],
                                            onItemSelect: (itemsIds,itemsNames) {
                                              var categoryId =
                                                  serviceItemState.data?.data
                                                          ?.lists?[index].id
                                                          ?.toInt() ??
                                                      0;

                                              serviceSelectedItemsIds[
                                                  categoryId] = itemsIds;
                                              serviceSelectedItemsNames[
                                                  categoryId] = itemsNames;
                                            },
                                            itemSelect: serviceItemState
                                                    .data
                                                    ?.data
                                                    ?.lists?[index]
                                                    .clientSelectedItemsInCart
                                                    ?.map((toElement) =>
                                                        toElement.id
                                                            .toString())
                                                    .toList() ??
                                                [],
                                          ),
                                        )
                                      ],
                                    ))),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Divider(
                              height: 1,
                              color: AppTheme.appGrey20,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          relatedProductData
                                          .data?.data?.products?.data.length !=
                                      0 ||
                                  relatedServiceData
                                          .data?.data?.products?.data.length !=
                                      0
                              ? Text(
                                  "You may also like",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 16,
                          ),
                          if (widget.itemType == ItemType.Products)
                            SizedBox(
                              height: 280,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Skeletonizer(
                                      enabled: relatedProductData.state ==
                                          DataState.LOADING,
                                      child:
                                          ServiceAndProductItemCardHorizontal(
                                        width: 163,
                                        height: 165,
                                        product: relatedProductData
                                            .data?.data?.products?.data[index],
                                        type: ItemType.Products,
                                        onAddItemToCart: (id) {
                                          addProductToCart(id);
                                        },
                                        onAddItemToWishList: (id,collectionId) {
                                          if (client != null) {
                                            productWishlistToggle(id);
                                          } else {
                                            showAuthenticated();
                                          }
                                        },
                                        onItemClick:
                                            (id, itemName, categoryIds) {
                                          navigateToItemDetails(
                                              ItemType.Products,
                                              id,
                                              itemName,
                                              categoryIds);
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 12,
                                      ),
                                  itemCount: relatedProductData.state ==
                                          DataState.LOADING
                                      ? 5
                                      : relatedProductData.data?.data?.products
                                              ?.data.length ??
                                          0),
                            ),
                          if (widget.itemType == ItemType.Services)
                            SizedBox(
                              height: 280,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Skeletonizer(
                                      enabled: relatedServiceData.state ==
                                          DataState.LOADING,
                                      child:
                                          ServiceAndProductItemCardHorizontal(
                                        width: 163,
                                        height: 165,
                                        service: relatedServiceData
                                            .data?.data?.services?.data[index],
                                        type: ItemType.Services,
                                        onAddItemToCart: (id) {
                                          addServiceToCart(id);
                                        },
                                        onAddItemToWishList: (id,collectionId) {
                                          if (client != null) {
                                            serviceWishlistToggle(
                                                id.toString());
                                          } else {
                                            showAuthenticated();
                                          }
                                        },
                                        onItemClick:
                                            (id, itemName, categoryIds) {
                                          navigateToItemDetails(
                                              ItemType.Services,
                                              id,
                                              itemName,
                                              categoryIds);
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 12,
                                      ),
                                  itemCount: relatedServiceData.state ==
                                          DataState.LOADING
                                      ? 5
                                      : relatedServiceData.data?.data?.services
                                              ?.data.length ??
                                          0),
                            ),
                          SizedBox(
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      offset: Offset(0, -1), // Negative Y for top shadow
                      blurRadius: 6, // How soft the shadow is
                      spreadRadius: 0, // Optional: how much it spreads
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SAR ${widget.itemType == ItemType.Products ? productItemState.data?.data?.priceAfterDiscount ?? "" : serviceItemState.data?.data?.priceAfterDiscount ?? ""}",
                            style: AppTheme
                                .styleWithTextBlackAdelleSansExtendedFonts18w500,
                          ),
                          Text(
                            "Vat. included",
                            style: AppTheme
                                .styleWithTextGray7AdelleSansExtendedFonts12w400,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 26,
                    ),
                    Expanded(
                      child: AppButton(
                        onPress: () {
                          print("${productItemState.data?.data!.inCart}");
                          if (widget.itemType == ItemType.Products) {
                            if (widget.productDetails != null ||
                                (productItemState.data?.data!.inCart == true &&
                                    productItemState.data?.data!.cartItemId !=
                                        null)) {
                              print(
                                  "cartId : ${productItemState.data?.data!.cartItemId}");

                              editProductToCart(int.parse(productItemState
                                      .data?.data!.cartItemId
                                      .toString() ??
                                  "0"));
                            } else if (productItemState.data?.data?.id !=
                                    null &&
                                productItemState.data?.data?.amount != 0 &&
                                productItemState.data?.data!.inCart == false) {
                              addProductToCart(int.parse(
                                  productItemState.data?.data?.id!.toString() ??
                                      ""));
                            }
                          } else {
                            if (serviceItemState.data?.data?.cardType ==
                                    ServiceTypes.soft_card.name &&
                                serviceItemState.data?.data?.id != null) {
                              calculateSoftService(serviceItemState
                                      .data?.data?.priceAfterDiscount ??
                                  0);
                              makeCheckoutForSoftService(
                                  int.parse(serviceItemState.data?.data?.id!
                                          .toString() ??
                                      ""),
                                  serviceItemState.data?.data);
                            } else if (serviceItemState.data?.data!.inCart ==
                                    true &&
                                serviceItemState.data?.data!.cartItemId !=
                                    null) {
                              print(
                                  "cartId : ${serviceItemState.data?.data!.cartItemId}");

                              editServiceCart(int.parse(serviceItemState
                                      .data?.data?.cartItemId
                                      .toString() ??
                                  "0"));
                            } else if (serviceItemState.data?.data?.id !=
                                    null &&
                                serviceItemState.data?.data!.inCart != true) {
                              addServiceToCart(int.parse(
                                  serviceItemState.data?.data?.id!.toString() ??
                                      ""));
                            }
                          }
                        },
                        text: widget.itemType == ItemType.Products
                            ? widget.productDetails != null
                                // || productItemState.data?.data!.inCart == true
                                ? "Edit Product"
                                : productItemState.data?.data!.inCart == true
                                    ? "Added"
                                    : productItemState.data?.data?.amount == 0
                                        ? "Out of stock"
                                        : "Add to cart"
                            : widget.serviceShowData != null
                                ? "Edit Service"
                                : serviceItemState.data?.data?.cardType ==
                                        ServiceTypes.soft_card.name
                                    ? "Checkout"
                                    : serviceItemState.data?.data!.inCart ==
                                            true
                                        ? "Added"
                                        : "Add to cart",
                        height: 48,
                        backColor: AppTheme.mainAppColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToSellerDetails(
    int sellerId,
  ) {
    context.push(R_SellerDetails, extra: {"sellerId": sellerId});
  }

  void showAllReviews(String? id, FilterScreenTypes? itemType) {
    if (itemType == FilterScreenTypes.Products) {
      ref
          .read(getProductReviews.notifier)
          .getProductDetails(productId: widget.id);
    } else if (itemType == FilterScreenTypes.Services) {
      ref
          .read(getServiceReviews.notifier)
          .getServiceDetails(serviceId: widget.id);
    } else {
      ref
          .read(getSellerDetailsToShowReviewsStateNotifier.notifier)
          .getSellerDetails(providerId: int.tryParse(id ?? "0"));
    }
  }

  void navigateToItemDetails(ItemType itemType, int itemId, String itemName,
      List<int> categoriesIds) async {
    final updateDate = await context
        .push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    }) as UpdateDataModel?;
    if (updateDate != null && updateDate.updateRelatedData == true) {
      if (itemType == ItemType.Products) {
        getDetailsForProduct();
        getRelatedProducts();
      } else {
        getDetailsForService();
        getRelatedServices();
      }
    }
  }

  void addProductToCart(int id) {
    String? parentItemIds;
    String? childItemIds;
    if (productSelectedItemsIds.isNotEmpty) {
      parentItemIds =
          productSelectedItemsIds.keys.map((key) => key.toString()).join(",");
      childItemIds = productSelectedItemsIds.values
          .map((value) => value.join(","))
          .join("|");
    }

    print("addProduct info : $parentItemIds  ,  $childItemIds ");
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref.read(addProductToCartUseCaseStateNotifier.notifier).addToCart(
          productId: id.toString(),
          sessionId: sessionId,
          productSelectedListIds: parentItemIds,
          productSelectedListItemsIds: childItemIds);
    } else {
      ref.read(addProductToCartUseCaseStateNotifier.notifier).addToCart(
          productId: id.toString(),
          productSelectedListIds: parentItemIds,
          productSelectedListItemsIds: childItemIds);
    }
  }

  void editProductToCart(int id) {
    String? parentItemIds;
    String? childItemIds;
    if (productSelectedItemsIds.isNotEmpty) {
      parentItemIds =
          productSelectedItemsIds.keys.map((key) => key.toString()).join(",");
      childItemIds = productSelectedItemsIds.values
          .map((value) => value.join(","))
          .join("|");
    }
    print("editProduct info : $parentItemIds  ,  $childItemIds ");
    ref.read(updateCartItemsStateNotifies.notifier).updateCartItems(
        cartItemId: id.toString(),
        productSelectedListIds: parentItemIds,
        productSelectedListItemsIds: childItemIds);
  }

  void addServiceToCart(int id) {
    String? parentItemIds;
    String? childItemIds;
    if (serviceSelectedItemsIds.isNotEmpty) {
      parentItemIds =
          serviceSelectedItemsIds.keys.map((key) => key.toString()).join(",");
      childItemIds = serviceSelectedItemsIds.values
          .map((value) => value.join(","))
          .join("|");
    }

    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref.read(addServiceToCartUseCaseStateNotifier.notifier).addToCart(
          serviceId: id.toString(),
          sessionId: sessionId,
          serviceSelectedListIds: parentItemIds,
          serviceSelectedListItemsIds: childItemIds);
    } else {
      ref.read(addServiceToCartUseCaseStateNotifier.notifier).addToCart(
          serviceId: id.toString(),
          serviceSelectedListIds: parentItemIds,
          serviceSelectedListItemsIds: childItemIds);
    }
  }

  void editServiceCart(int id) {
    String? parentItemIds;
    String? childItemIds;
    if (serviceSelectedItemsIds.isNotEmpty) {
      parentItemIds =
          serviceSelectedItemsIds.keys.map((key) => key.toString()).join(",");
      childItemIds = serviceSelectedItemsIds.values
          .map((value) => value.join(","))
          .join("|");
    }

    ref.read(updateCartItemsStateNotifies.notifier).updateCartItems(
        cartItemId: id.toString(),
        serviceSelectedListIds: parentItemIds,
        serviceSelectedListItemsIds: childItemIds);
  }

  void productWishlistToggle(int id) {
    ref
        .read(productToggleStateNotifier.notifier)
        .toggle(productId: id.toString());
  }

  void serviceWishlistToggle(String serviceId) {
    ref.read(serviceToggleStateNotifier.notifier).toggle(serviceId: serviceId);
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
  void navigateToSignUp() async {
    context.push(R_SignUp, extra: {"typeOfMode": TypeOfMode.ViewMode});
  }
  void navigateToLogin() async {
    var makeRefresh =
        await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if (makeRefresh == true) {
      // Todo make this action butter
      this.makeRefresh = true;
      if (widget.itemType == ItemType.Products) {
        getDetailsForProduct();
        getRelatedProducts();
        refreshHomeData();
      } else {
        getDetailsForService();
        getRelatedServices();
        refreshHomeData();
      }
    } else {
      this.makeRefresh = false;
    }
  }

  void getDetailsForProduct() {
    ref
        .read(getProductDetails.notifier)
        .getProductDetails(productId: widget.id);
  }

  void getRelatedProducts() {
    ref.read(getRelatedProductsStateNotifiers.notifier).getProductsData(
        page: 1,
        categoriesIds: widget.relatedCategoriesIds,
        productId: widget.id);
  }

  void getDetailsForService() {
    ref
        .read(getServiceDetails.notifier)
        .getServiceDetails(serviceId: widget.id);
  }

  void getRelatedServices() {
    ref.read(getRelatedServicesStateNotifiers.notifier).getServicesData(
        page: 1,
        categoriesIds: widget.relatedCategoriesIds,
        serviceId: widget.id);
  }

  void refreshHomeData() {
    ref.read(homeDataStateNotifiers.notifier).getHomeData();
  }

  void updateCart() {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    ref
        .read(fetchCardDetailsStateNotifies.notifier)
        .getCardDetails(sessionId: sessionId);
  }

  void makeCheckoutForSoftService(int id, ServiceShowData? service) {
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() != null) {
      String? parentItemIds;
      String? childItemIds;
      String? childItemNames;
      if (serviceSelectedItemsIds.isNotEmpty) {
        parentItemIds =
            serviceSelectedItemsIds.keys.map((key) => key.toString()).join(",");
        childItemIds = serviceSelectedItemsIds.values
            .map((value) => value.join(","))
            .join("|");

        childItemNames = serviceSelectedItemsNames.values
            .map((value) => value.join(","))
            .join("|");
      }
      ref.read(cartDateSelectedStateNotifiers.notifier).setCartDataSelection({
        orderTypeKey: OrderTypes.self_order.name,
        serviceIdKey: id.toString(),
        serviceSelectedListIdsKey: parentItemIds.toString(),
        serviceSelectedListItemsIdsKey: childItemIds.toString(),
        serviceSelectedListItemsNamesKey: childItemNames.toString(),
      });

      context.push(R_CartScreen, extra: {
        "type": CheckoutTypes.SoftCard,
        "service": service,
        serviceSelectedListIdsKey: parentItemIds.toString(),
        serviceSelectedListItemsIdsKey: childItemIds.toString()
      });
    } else {
      showAuthenticated();
    }
  }

  void calculateSoftService(num price) {
    ref
        .read(calculationForSoftItemStateNotifies.notifier)
        .calculateSoftItemForCheckout(totalPrice: price);
  }

  void showReviewsBottomSheet(
      {List<ProductDetailsRatingsInner>? productAndServiceRatingsList,
      List<ProviderDataRatingsInner>? sellerRatingsList,
      FilterScreenTypes? type}) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) => RatingBottomSheet(
              productRatingsList: productAndServiceRatingsList,
              type: type??FilterScreenTypes.Products,
              providerRatingsList: sellerRatingsList,
            ));
  }


  void showUnreadyGiftDialog(BuildContext context, ProductTypes type) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent, // Optional: darken the background a bit
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 🔹 Blur effect
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    width: 280.w,
                    height: 160.h,
                    color: Colors.white.withOpacity(0.45),
                    child:
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Text(
                                      type == ProductTypes.ready_made_gifts
                                          ? "Ready Gift"
                                          : "Unready Gift",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: SVGIcons.localSVG(closeIconSvg, width: 32, height: 32),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  type == ProductTypes.ready_made_gifts
                                      ? "These gift will be delivered\nwith no packaging."
                                      : "These gift come with\ncustomizable packaging\nbefore delivery!",
                                  textAlign: TextAlign.center,
                                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500.copyWith(height: 1.5),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),

                          // 🔸 Close button
                          // PositionedDirectional(
                          //   top: 0,
                          //   end: 0,
                          //   child: GestureDetector(
                          //     onTap: () => Navigator.of(context).pop(),
                          //     child: SVGIcons.localSVG(closeIconSvg, width: 32, height: 32),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
