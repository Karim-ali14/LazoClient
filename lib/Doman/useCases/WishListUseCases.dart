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
  }) {
    state = StateModel.loading();
    request(() => clientApi.toggleProductServiceInWishlist(
        productId: productId, serviceId: serviceId));
  }
}

class WishListProductsUseCase extends StateNotifier<StateModel<ShowWishlistItemsWithSearchByName200Response?>>{
  final Ref _ref;
  final ClientApi _clientApi;
  WishListProductsUseCase(this._ref, this._clientApi):super(StateModel());

  void fetchAllProductsInWishlist({ String? searchByName, String? type, }){
    state = StateModel.loading();
    request(() => _clientApi.showWishlistItemsWithSearchByName(searchByName:searchByName,type: type),onComplete: (res){
      if(res?.data?.products.isEmpty == true){
        state = StateModel.empty();
      }
    });
  }
  void fetchAllServicesInWishlist({ String? searchByName, String? type, }){
    state = StateModel.loading();
    request(() => _clientApi.showWishlistItemsWithSearchByName(searchByName:searchByName,type: type),onComplete: (res){
      if(res?.data?.services.isEmpty == true){
        state = StateModel.empty();
      }
    });
  }
  
  void deleteProductItem(String productId){
    var products = state.data?.data?.products.toList(growable: true);
    var index = products?.indexWhere((item) {

      return item.id.toString() == productId;
    });

    if(index != -1) {
      products?.removeAt(index!);
    }
    var data = state.data;
    data?.data?.products = [...?products];
    if(products?.isEmpty == true){
      state = StateModel.empty(data: data);
    }else{
      state = StateModel.success(data);
    }
  }

  void deleteServiceItem(String serviceId){
    var services = state.data?.data?.services.toList(growable: true);
    var index = services?.indexWhere((item) {

      return item.id.toString() == serviceId;
    });

    if(index != -1) {
      services?.removeAt(index!);
    }
    var data = state.data;
    data?.data?.services = [...?services];

    if(services?.isEmpty == true){
      state = StateModel.empty(data: data);
    }else{
      state = StateModel.success(data);
    }
  }
}