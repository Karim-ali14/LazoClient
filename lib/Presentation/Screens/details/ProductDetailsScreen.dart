import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductMultipleSelectItems.dart';
import 'package:lazo_client/Presentation/Screens/details/componants/ProductSingleSelectItems.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SeeMoreAndLessTextView.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Eunms.dart';
import '../../BottomSheets/AuthenticateBottomSheet.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/BannerCardItems.dart';
import '../../Widgets/ServiceAndProductItemCard.dart';
import '../../Widgets/SvgIcons.dart';
import '../../Widgets/TruncatedText.dart';
import 'componants/ProductRowItem.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String? id;
  final ItemType? itemType;
  final String? name;
  final List<int>? relatedCategoriesIds;
  const ProductDetailsScreen(
      {this.name,
      this.id,
      this.relatedCategoriesIds,
      this.itemType,
      super.key});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  var makeRefresh = false;

  Future<bool> _onWillPop() async {
    // Your custom logic here
    print('Back button pressed!');
    context.pop(makeRefresh);
    return false; // Return true to allow the pop action, false to prevent it
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      // print("sadfasdfas ${widget.relatedCategoriesIds}");

      if (widget.itemType == ItemType.Products) {
        getDetailsForProduct();
        getRelatedProducts();
      } else {
        getDetailsForService();
        getRelatedServices();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientStateProvider);
    final productItemState = ref.watch(getProductDetails);
    final serviceItemState = ref.watch(getServiceDetails);
    final relatedProductData = ref.watch(getRelatedProductsStateNotifiers);
    final relatedServiceData = ref.watch(getRelatedServicesStateNotifiers);

    // handleState(addProductToCartUseCaseStateNotifier, showLoading: true,
    //     onSuccess: (res) {
    //   var id = res.data?.data?.productId;
    //   print("product id : $id");
    //   if (id != null) {
    //     ref.read(getProductDetails.notifier).handelAddProductToCart(id);
    //     ref.read(homeDataStateNotifiers.notifier).handleAddProductToCart(id);
    //     ref.read(getProductsStateNotifiers.notifier).handleAddProductToCart(id);
    //   }
    // });
    //
    // handleState(addServiceToCartUseCaseStateNotifier, showLoading: true,
    //     onSuccess: (res) {
    //   var id = res.data?.data?.serviceId;
    //   if (id != null) {
    //     ref.read(getServiceDetails.notifier).handelAddServiceToCart(id);
    //     ref.read(homeDataStateNotifiers.notifier).handelAddServiceToCart(id);
    //     ref.read(getServicesStateNotifiers.notifier).handelAddServiceToCart(id);
    //   }
    // });
    //
    // handleState(productToggleStateNotifier, showLoading: true,
    //     onSuccess: (res) {
    //   ref
    //       .read(getSellerDetailsWithProductStateNotifier.notifier)
    //       .handleAddProductToWishList(
    //           res.data?.data?.productId?.toInt() ?? 0,
    //           res.data?.data?.categoriesIds ?? [],
    //           res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(getProductDetails.notifier).handelAddProductToWishList(
    //       res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(homeDataStateNotifiers.notifier).handleAddProductToWishList(
    //       res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(getProductsStateNotifiers.notifier).handleAddProductToWishList(
    //       res.data?.data?.productId ?? 0, res.data?.data?.inWishlist ?? false);
    // });
    //
    // handleState(serviceToggleStateNotifier, showLoading: true,
    //     onSuccess: (res) {
    //   ref
    //       .read(getSellerDetailsWithServicesStateNotifier.notifier)
    //       .handleAddServiceToWishList(
    //           res.data?.data?.serviceId?.toInt() ?? 0,
    //           res.data?.data?.categoriesIds ?? [],
    //           res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(getServiceDetails.notifier).handelAddServiceToWishList(
    //       res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(homeDataStateNotifiers.notifier).handelAddServiceToWishList(
    //       res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
    //
    //   ref.read(getServicesStateNotifiers.notifier).handelAddServiceToWishlist(
    //       res.data?.data?.serviceId ?? 0, res.data?.data?.inWishlist ?? false);
    // });

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.name,
        isCenter: false,
        navigated: true,
        appContext: context,
        trailingWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SVGIcons.smallShareIcon(),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    if(client != null) {
                      widget.itemType == ItemType.Products
                          ? productWishlistToggle(
                          productItemState.data?.data?.id?.toInt() ?? 0)
                          : serviceWishlistToggle(
                          serviceItemState.data?.data?.id?.toString() ?? "");
                    }else{
                      showAuthenticated();
                    }
                  },
                  child: widget.itemType == ItemType.Products
                      ? productItemState.data?.data?.inWishlist == true
                          ? SVGIcons.activeFavoriteIcon()
                          : SVGIcons.unFavoriteIconWithLightRedIcon()
                      : serviceItemState.data?.data?.inWishlist == true
                          ? SVGIcons.activeFavoriteIcon()
                          : SVGIcons.unFavoriteIconWithLightRedIcon())
            ],
          ),
        ),
        customCallBack: () {
          context.pop(makeRefresh);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerCardItems(
                        list: widget.itemType == ItemType.Products
                            ? (productItemState.data?.data?.images
                                        .map((item) => item.imagePath ?? "") ??
                                    [])
                                .toList()
                            : (serviceItemState.data?.data?.images
                                        .map((item) => item.imagePath ?? "") ??
                                    [])
                                .toList(),
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        showLoading: false,
                        showIndicator: false,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          TruncatedText(
                              text:
                                  "${widget.itemType == ItemType.Products ? productItemState.data?.data?.name : serviceItemState.data?.data?.name} ",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts18w700,
                              maxLength: 30),
                          Spacer(),
                          widget.itemType == ItemType.Products
                              ? Text(
                                  "${productItemState.data?.data?.amount ?? 0} In Stock",
                                  style: AppTheme
                                      .styleWithTextPreparingColorAdelleSansExtendedFonts14w400,
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SAR ${widget.itemType == ItemType.Products ? productItemState.data?.data?.priceAfterDiscount ?? "" : serviceItemState.data?.data?.priceAfterDiscount ?? ""}",
                            style: AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts20w700,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          widget.itemType == ItemType.Products
                              ? productItemState
                                          .data?.data?.priceAfterDiscount ==
                                      productItemState.data?.data?.price
                                  ? Text(
                                      "SAR ${productItemState.data?.data?.price ?? ""}",
                                      style: AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    )
                                  : SizedBox()
                              : serviceItemState
                                          .data?.data?.priceAfterDiscount ==
                                      serviceItemState.data?.data?.price
                                  ? Text(
                                      "SAR ${serviceItemState.data?.data?.price ?? ""}",
                                      style: AppTheme
                                          .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    )
                                  : SizedBox(),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SVGIcons.smallStarIcon(),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "${productItemState.data?.data?.overallRating ?? 0}",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts14w400,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "(${productItemState.data?.data?.ratingsCount ?? 0})",
                                style: AppTheme
                                    .styleWithTextGray7AdelleSansExtendedFonts12w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "All prices include VAT",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts12w400,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Description",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts20w700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpandedText(
                        textValue:
                            "${widget.itemType == ItemType.Products ? productItemState.data?.data?.description : serviceItemState.data?.data?.description} ",
                        textStyle: AppTheme
                            .styleWithTextAppGrey15AdelleSansExtendedFonts14w400
                            .copyWith(height: 1.5),
                        maxLength: 200,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      if (widget.itemType == ItemType.Products)
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.appGrey8),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 51,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppTheme.appGrey8),
                                    color: AppTheme.appGrey9,
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "About Product",
                                          style: AppTheme
                                              .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                        ),
                                      ],
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Product Color",
                                  endWidget: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: productItemState
                                            .data
                                            ?.data
                                            ?.colors
                                            .first
                                            .hexcode
                                            ?.getColorFromHex),
                                  ),
                                  textValue: productItemState
                                      .data?.data?.colors.first.name,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Product Size",
                                  textValue:
                                      "${productItemState.data?.data?.sizes.first.name}",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Categories",
                                  textValue:
                                      "${productItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}"
                                          .ellipsize(28),
                                  hasDivider: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Occasions",
                                  textValue:
                                      "${productItemState.data?.data?.occasions.map((item) => item.nameEn).join(" - ")}"
                                          .ellipsize(28),
                                  hasDivider: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Time for processing",
                                  textValue:
                                      "${productItemState.data?.data?.expectedProcessingTime}"
                                          .ellipsize(28),
                                  hasDivider: false,
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (widget.itemType == ItemType.Services)
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.appGrey8),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 51,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppTheme.appGrey8),
                                    color: AppTheme.appGrey9,
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "About Service",
                                          style: AppTheme
                                              .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                        ),
                                      ],
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Service Duration",
                                  textValue: serviceItemState
                                      .data?.data?.duration
                                      ?.ellipsize(28),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Card Type",
                                  textValue:
                                      "${serviceItemState.data?.data?.cardType}",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Price for hard card",
                                  textValue:
                                      "SAR ${serviceItemState.data?.data?.cardPrice}",
                                  hasDivider: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Card Expiration",
                                  textValue:
                                      "${serviceItemState.data?.data?.cardExpiration}"
                                          .ellipsize(28),
                                  hasDivider: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title:
                                      "provide this service out of the store",
                                  textValue: (serviceItemState.data?.data
                                              ?.isServiceDeliverableOutsideStore ==
                                          1
                                      ? "Yes"
                                      : "No"),
                                  hasDivider: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ProductRowItem(
                                  title: "Categories",
                                  textValue:
                                      "${serviceItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}"
                                          .ellipsize(28),
                                  hasDivider: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (widget.itemType == ItemType.Products)
                        ...(List.generate(
                            productItemState.data?.data?.lists?.length ?? 0,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Text(
                                      "${productItemState.data?.data!.lists?[index].name}",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppTheme.appGrey8),
                                          color: Colors.white,
                                        ),
                                        child: productItemState
                                                    .data
                                                    ?.data
                                                    ?.lists?[index]
                                                    .isMultiSelectable ==
                                                0
                                            ? ProductSingleSelectItems(
                                                list: productItemState
                                                        .data
                                                        ?.data
                                                        ?.lists?[index]
                                                        .items
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
                                                onItemSelect: (item) {},
                                              )
                                            : ProductMultipleSelectItems(
                                                list: productItemState
                                                        .data
                                                        ?.data
                                                        ?.lists?[index]
                                                        .items
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
                                                onItemSelect: (item) {},
                                              ),
                                      ),
                                    ),
                                  ],
                                )))
                      else
                        ...(List.generate(
                            serviceItemState.data?.data?.lists?.length ?? 0,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Text(
                                      "${serviceItemState.data?.data?.lists?[index].name}",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppTheme.appGrey8),
                                          color: Colors.white,
                                        ),
                                        child: ProductMultipleSelectItems(
                                          list: serviceItemState
                                                  .data?.data?.lists
                                                  ?.map((item) => ItemSelector(
                                                      item.id?.toInt() ?? 0,
                                                      item.name ?? "",
                                                      SizedBox()))
                                                  .toList() ??
                                              [],
                                          onItemSelect: (item) {},
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppTheme.appGrey8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(children: [
                            Row(
                              children: [
                                ImageView(
                                  isCircle: true,
                                  initialImg:
                                      widget.itemType == ItemType.Products
                                          ? productItemState.data?.data
                                                  ?.provider?.imagePath ??
                                              ""
                                          : serviceItemState.data?.data
                                                  ?.provider?.imagePath ??
                                              "",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Sold By",
                                          style: AppTheme
                                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Text(
                                      widget.itemType == ItemType.Products
                                          ? productItemState
                                                  .data?.data?.provider?.name
                                                  ?.ellipsize(28) ??
                                              ""
                                          : serviceItemState
                                                  .data?.data?.provider?.name
                                                  ?.ellipsize(28) ??
                                              "",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts16w700,
                                    )
                                  ],
                                )
                              ],
                            ),
                            PositionedDirectional(
                              end: 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SVGIcons.smallStarIcon(),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    widget.itemType == ItemType.Products
                                        ? "${productItemState.data?.data?.provider?.overallRating ?? 0}"
                                        : "${serviceItemState.data?.data?.provider?.overallRating ?? 0}",
                                    style: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts14w400,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "(${widget.itemType == ItemType.Products ? "${productItemState.data?.data?.provider?.ratingsCount ?? 0}" : "${serviceItemState.data?.data?.provider?.ratingsCount ?? 0}"})",
                                    style: AppTheme
                                        .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Product Rating & Reviews",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppTheme.appGrey8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(children: [
                            Row(
                              children: [
                                SVGIcons.smallStarIcon(size: 24),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${productItemState.data?.data?.overallRating ?? 0}",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts24w700,
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Based on ${productItemState.data?.data?.ratingsCount ?? 0} ratings",
                                      style: AppTheme
                                          .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      if (widget.itemType == ItemType.Products)
                        ...(List.generate(
                          productItemState.data?.data?.ratings?.length ?? 0,
                          (index) => Container(
                            margin: const EdgeInsetsDirectional.symmetric(
                                vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppTheme.appGrey8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${productItemState.data?.data?.ratings?[index].userName}",
                                        style: AppTheme
                                            .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                                      ),
                                      Spacer(),
                                      Text(
                                        productItemState
                                                .data
                                                ?.data
                                                ?.ratings?[index]
                                                .date
                                                ?.convertDateToDdMmmYyyy ??
                                            "",
                                        style: AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SVGIcons.smallStarIcon(),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${productItemState.data?.data?.ratings?[index].rating ?? 0}",
                                        style: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts14w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ExpandedText(
                                    textValue:
                                        "${productItemState.data?.data?.ratings?[index].ratingComment ?? 0}",
                                    textStyle: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts14w500
                                        .copyWith(height: 1.5),
                                    maxLength: 70,
                                    showLessText: "Read Less",
                                    showMoreText: "Read More",
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                      if (widget.itemType == ItemType.Services)
                        ...(List.generate(
                          serviceItemState.data?.data?.ratings?.length ?? 0,
                          (index) => Container(
                            margin:
                                EdgeInsetsDirectional.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppTheme.appGrey8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${serviceItemState.data?.data?.ratings?[index].userName}",
                                        style: AppTheme
                                            .styleWithTextAppGrey7AdelleSansExtendedFonts14w500,
                                      ),
                                      Spacer(),
                                      Text(
                                        "${serviceItemState.data?.data?.ratings?[index].date}",
                                        style: AppTheme
                                            .styleWithTextGray7AdelleSansExtendedFonts12w400,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SVGIcons.smallStarIcon(),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${serviceItemState.data?.data?.ratings?[index].rating ?? 0}",
                                        style: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts14w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ExpandedText(
                                    textValue:
                                        "${serviceItemState.data?.data?.ratings?[index].ratingComment ?? 0}",
                                    textStyle: AppTheme
                                        .styleWithTextBlackAdelleSansExtendedFonts14w500
                                        .copyWith(height: 1.5),
                                    maxLength: 70,
                                    showLessText: "Read Less",
                                    showMoreText: "Read More",
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                      SizedBox(
                        height: 16,
                      ),
                      AppButton(
                        onPress: () {
                          navigateToShowAllReviews(widget.id, widget.itemType);
                        },
                        strokeWidth: 1,
                        height: 46,
                        width: double.infinity,
                        outlined: true,
                        text: "View more reviews",
                        backColor: AppTheme.mainAppColor,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      relatedProductData.data?.data?.products?.data.length !=
                                  0 ||
                              relatedServiceData
                                      .data?.data?.products?.data.length !=
                                  0
                          ? Text(
                              widget.itemType == ItemType.Products
                                  ? "Related Products"
                                  : "Related Service",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts18w700,
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 32,
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
                                  child: ServiceAndProductItemCardHorizontal(
                                    width: 163,
                                    product: relatedProductData
                                        .data?.data?.products?.data[index],
                                    type: ItemType.Products,
                                    onAddItemToCart: (id) {},
                                    onAddItemToWishList: (id) {},
                                    onItemClick: (id, itemName, categoryIds) {
                                      navigateToItemDetails(ItemType.Products,
                                          id, itemName, categoryIds);
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 12,
                                  ),
                              itemCount:
                                  relatedProductData.state == DataState.LOADING
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
                                  child: ServiceAndProductItemCardHorizontal(
                                    width: 163,
                                    service: relatedServiceData
                                        .data?.data?.services?.data[index],
                                    type: ItemType.Services,
                                    onAddItemToCart: (id) {},
                                    onAddItemToWishList: (id) {},
                                    onItemClick: (id, itemName, categoryIds) {
                                      navigateToItemDetails(ItemType.Services,
                                          id, itemName, categoryIds);
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 12,
                                  ),
                              itemCount:
                                  relatedServiceData.state == DataState.LOADING
                                      ? 5
                                      : relatedServiceData.data?.data?.services
                                              ?.data.length ??
                                          0),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppButton(
                onPress: () {
                  if (widget.itemType == ItemType.Products) {
                    if (productItemState.data?.data?.id != null) {
                      addProductToCart(int.parse(
                          productItemState.data?.data?.id!.toString() ?? ""));
                    }
                  } else {
                    if (serviceItemState.data?.data?.id != null) {
                      addServiceToCart(int.parse(
                          serviceItemState.data?.data?.id!.toString() ?? ""));
                    }
                  }
                },
                text: widget.itemType == ItemType.Products
                    ? productItemState.data?.data!.inCart == true
                        ? "Added"
                        : "Add to cart"
                    : serviceItemState.data?.data!.inCart == true
                        ? "Added"
                        : "Add to cart",
                height: 46,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  void navigateToShowAllReviews(String? id, ItemType? itemType) {
    context.push(R_ShowAllReviews, extra: {"id": id, "type": itemType});
  }

  void navigateToItemDetails(
      ItemType itemType, int itemId, String itemName, List<int> categoriesIds) async{
    context.push("$R_ProductAndServiceDetails/${itemId.toString()}", extra: {
      "type": itemType,
      "name": itemName,
      "categoryIds": categoriesIds
    });
  }

  void addProductToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString(), sessionId: sessionId);
    } else {
      ref
          .read(addProductToCartUseCaseStateNotifier.notifier)
          .addToCart(productId: id.toString());
    }
  }

  void addServiceToCart(int id) {
    var sessionId = ref
        .read(getSessionHandlerStateNotifier.notifier)
        .checkIfSessionIdExist();
    if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null &&
        sessionId?.isNotEmpty == true) {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString(), sessionId: sessionId);
    } else {
      ref
          .read(addServiceToCartUseCaseStateNotifier.notifier)
          .addToCart(serviceId: id.toString());
    }
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
          },
        ));
  }

  void navigateToLogin() async{
    var makeRefresh = await context.push(R_LoginScreen, extra: {"type": TypeOfMode.ViewMode});
    if(makeRefresh == true){ // Todo make this action butter
      this.makeRefresh = true;
      if(widget.itemType == ItemType.Products){
        getDetailsForProduct();
        getRelatedProducts();
        refreshHomeData();
      }else{
        getDetailsForService();
        getRelatedServices();
        refreshHomeData();
      }
    }else{
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
}
