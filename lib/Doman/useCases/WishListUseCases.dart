import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';

class ToggleProductServiceInWishlistUseCase extends StateNotifier<
    StateModel<ToggleProductServiceInWishlist200Response>> {
  final Ref ref;
  final ClientApi clientApi;
  ToggleProductServiceInWishlistUseCase(this.ref, this.clientApi)
      : super(StateModel());

  void toggle({
    String? productId,
    String? serviceId,
    String? collectionId,
  }) {
    state = StateModel.loading();
    print("alskdjflaskdjflkajsdfkl $productId  $collectionId");
    requestWithHandleMessage(() => clientApi.toggleProductServiceInWishlist(
        productId: productId,
        serviceId: serviceId,
        collectionId: collectionId));
  }
}

class WishListProductsUseCase extends StateNotifier<
    StateModel<ShowWishlistItemsWithSearchByName200Response?>> {
  final Ref _ref;
  final ClientApi _clientApi;
  WishListProductsUseCase(this._ref, this._clientApi) : super(StateModel());

  void fetchAllProductsInWishlist({
    String? searchByName,
    String? type,
    String? collectionId,
    String? shipmentType,
  }) {
    state = StateModel.loading();
    request(
        () => _clientApi.showWishlistItemsWithSearchByName(
            searchByName: searchByName, type: type,collectionId: collectionId,shipmentType: shipmentType), onComplete: (res) {
      if (res?.data?.products.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void fetchAllServicesInWishlist({
    String? searchByName,
    String? type,
    String? collectionId,
  }) {
    state = StateModel.loading();
    request(
        () => _clientApi.showWishlistItemsWithSearchByName(
            searchByName: searchByName, type: type,collectionId: collectionId), onComplete: (res) {
      if (res?.data?.services.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void deleteProductItem(String productId) {
    var products = state.data?.data?.products.toList(growable: true);
    var index = products?.indexWhere((item) {
      return item.id.toString() == productId;
    });

    if (index != -1) {
      products?.removeAt(index!);
    }
    var data = state.data;
    data?.data?.products = [...?products];
    if (products?.isEmpty == true) {
      state = StateModel.empty(data: data);
    } else {
      state = StateModel.success(data);
    }
  }

  void deleteServiceItem(String serviceId) {
    var services = state.data?.data?.services.toList(growable: true);
    var index = services?.indexWhere((item) {
      return item.id.toString() == serviceId;
    });

    if (index != -1) {
      services?.removeAt(index!);
    }
    var data = state.data;
    data?.data?.services = [...?services];

    print("jhkjhkjhkjhkjhjk ${services?.isEmpty}");
    if (services?.isEmpty == true || services == null) {
      state = StateModel.empty(data: data);
    } else {
      state = StateModel.success(data);
    }
  }
}

class ShowWishlistCollectionsUseCase
    extends StateNotifier<StateModel<ShowWishlistCollections200Response?>> {
  final WishlistApi wishlistApi;
  ShowWishlistCollectionsUseCase(this.wishlistApi) : super(StateModel());
  void fetchWishlistCollections() {
    state = StateModel.loading();
    requestWithHandleMessage(() => wishlistApi.showWishlistCollections());
  }
  void clearCollections() {
    state = StateModel.empty();
  }
}

class CreateWishlistCollectionUseCase
    extends StateNotifier<StateModel<CreateWishlistCollection200Response?>> {
  final WishlistApi wishlistApi;
  CreateWishlistCollectionUseCase(this.wishlistApi) : super(StateModel());
  void createCollection({String? name}) {
    state = StateModel.loading();
    requestWithHandleMessage(
        () => wishlistApi.createWishlistCollection(name: name));
  }
}

class DeleteWishlistCollectionUseCase extends StateNotifier<StateModel<void>> {
  final WishlistApi wishlistApi;
  DeleteWishlistCollectionUseCase(this.wishlistApi) : super(StateModel());
  void deleteCollection({String? collectionId}) {
    state = StateModel.loading();
    requestWithHandleMessage(() => wishlistApi
        .clientWishlistCollectionDeleteDelete(collectionId: collectionId));
  }
}

class EditWishlistCollectionUseCase
    extends StateNotifier<StateModel<CreateWishlistCollection200Response?>> {
  final WishlistApi wishlistApi;
  EditWishlistCollectionUseCase(this.wishlistApi) : super(StateModel());
  void updateCollection({
    String? collectionId,
    String? name,
  }) {
    state = StateModel.loading();
    requestWithHandleMessage(() => wishlistApi.updateWishlistCollection(
        collectionId: collectionId, name: name));
  }
}

class ResetWishlistCollectionUseCase
    extends StateNotifier<StateModel<void>> {
  final WishlistApi wishlistApi;
  ResetWishlistCollectionUseCase(this.wishlistApi) : super(StateModel());
  void resetCollection({
    String? collectionId
  }) {
    state = StateModel.loading();
    requestWithHandleMessage(() => wishlistApi.clientWishlistCollectionResetGet(
        collectionId: collectionId));
  }
}
