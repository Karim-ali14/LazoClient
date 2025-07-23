import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/Eunms.dart';
import '../../../../Data/Models/StateModel.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/TextWithoutPadding.dart';
import 'CartItemView.dart';

class CartItemsWithNotes extends ConsumerStatefulWidget {
  final bool? isReadOnlyMode;
  const CartItemsWithNotes( {super.key,this.isReadOnlyMode,});

  @override
  ConsumerState<CartItemsWithNotes> createState() => _CartItemsWithNotesState();
}

class _CartItemsWithNotesState extends ConsumerState<CartItemsWithNotes> {
  List<ProviderData> listItems = [
    ProviderData(
        items: [
          CartItemsInner(),
          CartItemsInner(),
          CartItemsInner(),
          CartItemsInner(),
          CartItemsInner()
        ]
    )
  ];
  String? deleteCartItemId;
  @override
  Widget build(BuildContext context) {
    var cartData = ref.watch(fetchCardDetailsStateNotifies);


    handleState(productToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(fetchCardDetailsStateNotifies.notifier).toggleWishlistStatusByItemId(res.data?.data?.productId ?? 0,CartItemType.Product,res.data?.data?.collectionId);
        });

    handleState(serviceToggleStateNotifier, showLoading: true,
        onSuccess: (res) {
          ref.read(fetchCardDetailsStateNotifies.notifier).toggleWishlistStatusByItemId(res.data?.data?.serviceId ?? 0,CartItemType.Service,res.data?.data?.collectionId);
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWithoutPadding(
            "Please note that unready gifts come with customizable packaging before delivery.",
            style: AppTheme
                .styleWithTextGray27AdelleSansExtendedFonts12w400,
            height: 1.2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child:  Divider(
              thickness: 1,
              color: AppTheme.appGrey6,
            ),
          ),
          ...(List.generate(
              cartData.state != DataState.LOADING
                  ? cartData.data?.data?.cartItems.length ?? 0
                  : listItems.length, (index) {
            return Skeletonizer(
              enabled: cartData.state == DataState.LOADING,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWithoutPadding(
                        cartData.data?.data?.cartItems[index]
                            .name ??
                            "",
                        style: AppTheme
                            .styleWithTextBlackColor2AdelleSansExtendedFonts14w500,
                      ),
                      const SizedBox(
                        height: defaultPaddingHorizontal,
                      ),
                      ...(List.generate(
                          cartData.state != DataState.LOADING
                              ? cartData
                              .data
                              ?.data
                              ?.cartItems[index]
                              .items
                              ?.length ??
                              0
                              : listItems[index].items?.length ??
                              0, (cartIndex) {
                        return CartItemView(
                          isReadOnlyMode: widget.isReadOnlyMode ?? false,
                          cartItem:
                          cartData.state != DataState.LOADING
                              ? cartData
                              .data
                              ?.data
                              ?.cartItems[index]
                              .items![cartIndex]
                              : listItems[index].items?[cartIndex],
                          onUpdateQuantity:
                              (cartItemId, quantity) {
                            updateItemQuantity(
                                cartItemId, quantity);
                          },
                          onDeleteItem: (cartItemId) {
                            deleteCartItem(cartItemId);
                          },
                          onProductClickListener:
                              (product, cartId) {
                            navigateToItemDetails(
                                ItemType.Products,
                                product,
                                null,
                                cartId,null);
                          },
                          onServiceClickListener:
                              (service, cartId) {
                            navigateToItemDetails(
                                ItemType.Services,
                                null,
                                service,
                                cartId,cartData
                                .data
                                ?.data
                                ?.cartItems[index]
                                .items![cartIndex].isOutsideDelivery);
                          }, toggleItem: (type , id,collectionId,inWishlist ) {
                            if(inWishlist) {
                              toggleItem(type,id.toInt());
                            }else{
                              ref.read(handelAddItemToWishListStateNotifier.notifier).addItemToWishList(
                                  itemId: id.toInt(),
                                  collectionId: int.tryParse(collectionId ?? "0"),
                                  type:type == CartItemType.Product? OrderItemType.Product : OrderItemType.Service);
                            }
                        }, orderItem: null,
                        );
                      })),
                      (cartData.data?.data?.cartItems.length??0) - 1 != index ? const Divider(
                        thickness: 1,
                        color: AppTheme.appGrey6,
                      ) : const SizedBox()
                    ]),
              ),
            );
          })),
        ],
      ),
    );
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
      ServiceShowData? service, int? cartId,int? isOutsideDelivery) {
    if(itemType == ItemType.Products){
      product?.cartItemId = cartId.toString();
    }else{
      service?.cartItemId = cartId.toString();
    }
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
      "product": cartId == null ? null : product,
      "service": cartId == null ? null : service,
      "cartId": cartId,
      "isOutsideDelivery":isOutsideDelivery
    });
  }

  void toggleItem(CartItemType type, int id) {
    if(type == CartItemType.Product){
      productWishlistToggle(id);
    }else{
      serviceWishlistToggle(id.toString());
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
}
