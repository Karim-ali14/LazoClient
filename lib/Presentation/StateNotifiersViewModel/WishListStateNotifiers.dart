import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/WishListUseCases.dart';

final productToggleStateNotifier = StateNotifierProvider.autoDispose<
        ToggleProductServiceInWishlistUseCase,
        StateModel<ToggleProductServiceInWishlist200Response>>(
    (ref) => ToggleProductServiceInWishlistUseCase(ref, (ref.read(clientApi))));

final serviceToggleStateNotifier = StateNotifierProvider.autoDispose<
        ToggleProductServiceInWishlistUseCase,
        StateModel<ToggleProductServiceInWishlist200Response>>(
    (ref) => ToggleProductServiceInWishlistUseCase(ref, (ref.read(clientApi))));

final getWishListItemsStateNotifier = StateNotifierProvider<
        WishListProductsUseCase,
        StateModel<ShowWishlistItemsWithSearchByName200Response?>>(
    (ref) => WishListProductsUseCase(ref,ref.read(clientApi)));

final getWishListReadyGiftsProductsStateNotifier = StateNotifierProvider<
        WishListProductsUseCase,
        StateModel<ShowWishlistItemsWithSearchByName200Response?>>(
    (ref) => WishListProductsUseCase(ref,ref.read(clientApi)));

final getWishListUnReadyGiftsProductsStateNotifier = StateNotifierProvider<
        WishListProductsUseCase,
        StateModel<ShowWishlistItemsWithSearchByName200Response?>>(
    (ref) => WishListProductsUseCase(ref,ref.read(clientApi)));

final getWishListServicesStateNotifier = StateNotifierProvider<
        WishListProductsUseCase,
        StateModel<ShowWishlistItemsWithSearchByName200Response?>>(
    (ref) => WishListProductsUseCase(ref,ref.read(clientApi)));


final createWishlistCollectionStateNotifier = StateNotifierProvider.autoDispose<
    CreateWishlistCollectionUseCase,
        StateModel<CreateWishlistCollection200Response?>>(
    (ref) => CreateWishlistCollectionUseCase(ref.read(wishlistApi)));

final createWishlistFromBottomSheetCollectionStateNotifier = StateNotifierProvider.autoDispose<
    CreateWishlistCollectionUseCase,
        StateModel<CreateWishlistCollection200Response?>>(
    (ref) => CreateWishlistCollectionUseCase(ref.read(wishlistApi)));

final showWishlistCollectionsStateNotifier = StateNotifierProvider<
    ShowWishlistCollectionsUseCase,
        StateModel<ShowWishlistCollections200Response?>>(
    (ref) => ShowWishlistCollectionsUseCase(ref.read(wishlistApi)));

final deleteWishlistCollectionStateNotifier = StateNotifierProvider.autoDispose<
    DeleteWishlistCollectionUseCase,
        StateModel<void>>(
    (ref) => DeleteWishlistCollectionUseCase(ref.read(wishlistApi)));

final editWishlistCollectionStateNotifier = StateNotifierProvider.autoDispose<
    EditWishlistCollectionUseCase,
        StateModel<CreateWishlistCollection200Response?>>(
    (ref) => EditWishlistCollectionUseCase(ref.read(wishlistApi)));

final resetCollectionStateNotifier = StateNotifierProvider.autoDispose<
    ResetWishlistCollectionUseCase,
        StateModel<void>>(
    (ref) => ResetWishlistCollectionUseCase(ref.read(wishlistApi)));
