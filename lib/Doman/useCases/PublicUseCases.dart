import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../Constants/Eunms.dart';
import '../../Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../main.dart';

class CitiesUseCases extends StateNotifier<StateModel<CitiesResponse?>> {
  final Ref ref;
  final PublicApi publicApi;
  CitiesUseCases(this.ref, this.publicApi) : super(StateModel());

  void getCities() async {
    state = StateModel.loading();
    request(() => publicApi.citiesGet(lang: "ar"));
  }
}

class HomeDataUseCase extends StateNotifier<StateModel<ShowHome200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  ShowHome200Response? data;
  HomeDataUseCase(this.ref, this.publicApi) : super(StateModel());

  void getHomeData() async {
    state = StateModel.loading();
    request(() => publicApi.showHome(), onComplete: (res) {
      data = res;
    });
  }

  void handleAddProductToCart(num productId) {
    if (data != null) {
      var index = data?.data?.topRatedProducts
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedProducts.getSafe(index)?.inCart = true;
      }
      state = StateModel.success(data);
    }
  }

  void handelAddServiceToCart(num serviceId) {
    if (data != null) {
      var index = data?.data?.topRatedServices
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedServices.getSafe(index)?.inCart = true;
      }
      state = StateModel.success(data);
    }
  }

  void handleAddProductToWishList(num productId,bool inWishlist) {
    if (data != null) {
      var index = data?.data?.topRatedProducts
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedProducts.getSafe(index)?.inWishlist = inWishlist;
      }
      state = StateModel.success(data);
    }
  }

  void handelAddServiceToWishList(num serviceId, bool inWishlist) {
    if (data != null) {
      var index = data?.data?.topRatedServices
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedServices.getSafe(index)?.inWishlist = inWishlist;
      }
      state = StateModel.success(data);
    }
  }
}

class GetCategoriesUseCase
    extends StateNotifier<StateModel<CategoriesResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  final List<Category> list = [];
  GetCategoriesUseCase(this.ref, this.publicApi) : super(StateModel());

  void getCategoriesData() async {
    state = StateModel.loading();
    request(() => publicApi.showAllCategories(), onComplete: (res) {
      list.clear();
      list.addAll(res.data);
    });
  }

  void searchInMainList(String value) {
    final filterList = list.where((item) {
      if (item.name?.contains(value) == true ||
          item.nameAr?.contains(value) == true ||
          item.nameEn?.contains(value) == true) {
        return true;
      } else {
        return false;
      }
    });
    state.data?.data = [...filterList];
    print("sadklfj ${state.data?.data.isNotEmpty}");
    if (state.data?.data.isNotEmpty == true) {
      state = StateModel.success(state.data);
    } else {
      state = StateModel.empty(data: state.data);
    }
  }

  void selectCategoriesInMainList(List<int> idsList) {
    list.forEach((item) {
      item.isChecked = idsList.any((id) => id == item.id);
    });
    state.data?.data = [...list];
    print(state.data?.data.isNotEmpty);
    if (state.data?.data.isNotEmpty == true) {
      state = StateModel.success(state.data);
    } else {
      state = StateModel.empty(data: state.data);
    }
  }

  void resetMainList(List<int> idsList) {
    list.forEach((item) {
      item.isChecked = false;
    });
    state.data?.data = [...list];
    print(state.data?.data.isNotEmpty);
    if (state.data?.data.isNotEmpty == true) {
      state = StateModel.success(state.data);
    } else {
      state = StateModel.empty(data: state.data);
    }
  }
}

class GetOccasionsUseCase extends StateNotifier<StateModel<OccasionsResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  final List<Occasion> list = [];
  GetOccasionsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getOccasionsData() async {
    state = StateModel.loading();
    request(() => publicApi.showAllOccasions(), onComplete: (res) {
      list.clear();
      list.addAll(res.data);
    });
  }

  void searchInMainList(String value) {
    final filterList = list.where((item) {
      if (item.name?.contains(value) == true ||
          item.nameAr?.contains(value) == true ||
          item.nameEn?.contains(value) == true) {
        return true;
      } else {
        return false;
      }
    });
    state.data?.data = [...filterList];
    print("sadklfj ${state.data?.data.isNotEmpty}");
    if (state.data?.data.isNotEmpty == true) {
      state = StateModel.success(state.data);
    } else {
      state = StateModel.empty(data: state.data);
    }
  }
}

class GetTopSellersUseCase
    extends StateNotifier<StateModel<FilterTopSellers200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  // final List<ProviderData> list = [];
  GetTopSellersUseCase(this.ref, this.publicApi) : super(StateModel());

  void getTopSellersData(
      {num? page,
      String? searchByName,
      List<int>? categoriesIds,
      num? isPromoted,
      List<int>? occasionsIds,
      List<String>? ratings}) async {
    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
        () => publicApi.filterTopSellers(
            filterTopSellersRequest: FilterTopSellersRequest(
                page: page,
                searchByName: searchByName,
                categoriesIds:
                    categoriesIds?.map((item) => item.toString()).toList(),
                occasionsIds:
                    occasionsIds?.map((item) => item.toString()).toList(),
                ratings: ratings,
                isPromoted: isPromoted)), onComplete: (res) {
      if (page != 1) {
        List<ProviderData> list = state.data?.data?.data ?? [];
        state.data?.data?.data = [...list, ...(res.data?.data ?? [])];
        state = StateModel.success(state.data);
      } else {
        state = StateModel.success(res);
      }
      if (state.data?.data?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }
}

class GetProductsUseCase
    extends StateNotifier<StateModel<FilterTopProductsServices200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  GetProductsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getProductsData({
    int page = 1,
    String? searchByName,
    List<num>? categoriesIds,
    List<num>? occasionsIds,
    String? priceFrom,
    String? priceTo,
    List<String>? ratings,
    String? type,
    String? productId,
    num? providerId,
  }) async {
    String? priceFromValue = priceFrom;
    if (priceTo != null && priceFrom == null) {
      priceFromValue = "0";
    }

    if (state.data?.data?.products?.lastPage != null &&
        page > (state.data?.data?.products?.lastPage ?? 0)) return;

    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();

    requestForPagination(
        () => publicApi.filterTopProductsServices(
              filterTopProductsServicesRequest:
                  FilterTopProductsServicesRequest(
                      page: page,
                      searchByName: searchByName,
                      categoriesIds: categoriesIds,
                      occasionsIds: occasionsIds,
                      priceFrom: num.tryParse(priceFromValue ?? ""),
                      priceTo: num.tryParse(priceTo ?? ""),
                      ratings: ratings,
                      type: type ?? ItemType.Products.name.toLowerCase(),
                      providerId: providerId),
            ), onComplete: (res) {
      if (page != 1) {
        List<ProviderProduct> list = state.data?.data?.products?.data ?? [];

        state.data?.data?.products?.data = [
          ...list,
          ...(res.data?.products?.data ?? [])
        ];

        state = StateModel.success(state.data);
      } else if (page == 1 && res.data?.products?.data.isNotEmpty == true) {
        if (productId != null) {
          var list = res.data?.products?.data.toList() ?? [];
          var indexWhere = list.indexWhere((item) {
            return item.id?.toInt() == int.parse(productId ?? "0");
          });
          list.removeAt(indexWhere);
          res.data?.products?.data = list;
        }
        state = StateModel.success(res);
      } else if (page == 1 && res.data?.products?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void handleAddProductToCart(num productId) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.products?.data
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.products?.data.getSafe(index)?.inCart = true;
      }
      state = StateModel.success(data);
    }
  }

  void handleAddProductToWishList(num productId, bool inWishList) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.products?.data
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.products?.data.getSafe(index)?.inWishlist = inWishList;
      }
      state = StateModel.success(data);
    }
  }
}

class GetServicesUseCase
    extends StateNotifier<StateModel<FilterTopProductsServices200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  GetServicesUseCase(this.ref, this.publicApi) : super(StateModel());

  void getServicesData(
      {int page = 1,
      String? searchByName,
      List<num>? categoriesIds,
      List<num>? occasionsIds,
      String? priceFrom,
      String? priceTo,
      List<String>? ratings,
      String? type,
      String? serviceId,
      num? providerId}) async {
    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
        () => publicApi.filterTopProductsServices(
            filterTopProductsServicesRequest: FilterTopProductsServicesRequest(
                page: page,
                searchByName: searchByName,
                categoriesIds: categoriesIds,
                occasionsIds: occasionsIds,
                priceFrom: num.tryParse(priceFrom ?? ""),
                priceTo: num.tryParse(priceTo ?? ""),
                ratings: ratings,
                type: type ?? ItemType.Services.name.toLowerCase(),
                providerId: providerId)), onComplete: (res) {
      if (page != 1) {
        List<ServiceShowData> list = state.data?.data?.services?.data ?? [];
        state.data?.data?.services?.data = [
          ...list,
          ...(res.data?.services?.data ?? [])
        ];
        state = StateModel.success(state.data);
      } else if (page == 1 && res.data?.services?.data.isNotEmpty == true) {
        if (serviceId != null) {
          var list = res.data?.services?.data.toList() ?? [];
          var indexWhere = list.indexWhere((item) {
            return item.id?.toInt() == int.parse(serviceId ?? "0");
          });

          list.removeAt(indexWhere);

          res.data?.services?.data = list;
        }
        state = StateModel.success(res);
      } else if (page == 1 && res.data?.services?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void handelAddServiceToCart(num serviceId) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.services?.data
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.services?.data.getSafe(index)?.inCart = true;
      }
      state = StateModel.success(data);
    }
  }

  void handelAddServiceToWishlist(num serviceId,bool inWishlist) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.services?.data
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.services?.data.getSafe(index)?.inWishlist = inWishlist;
      }
      state = StateModel.success(data);
    }
  }
}

class FilterDataUseCase extends StateNotifier<FilterData> {
  final Ref ref;
  FilterDataUseCase(this.ref) : super(FilterData());

  void applyDataFilter(
      {int? promotionSelected,
      int? priceFromSelected,
      int? priceToSelected,
      List<int>? categoriesIdsSelected,
      List<int>? occasionsIdsSelected,
      List<int>? ratingValueSelected}) {
    state = FilterData(
        promotionSelected: promotionSelected,
        categoriesIdsSelected: categoriesIdsSelected,
        occasionsIdsSelected: occasionsIdsSelected,
        ratingValueSelected: ratingValueSelected,
        priceFromSelected: priceFromSelected,
        priceToSelected: priceToSelected);
  }

  void resetDataFilter() {
    state = FilterData();
  }
}

class GetProductDetailsUseCase
    extends StateNotifier<StateModel<ProductDetailsResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetProductDetailsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getProductDetails({
    String? productId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.showProductDetails(productId: productId));
  }

  void handelAddProductToCart(num productId) {
    final data = state.data;
    data?.data?.inCart = true;
    state = StateModel.success(data);
  }

  void handelAddProductToWishList(num productId,bool inWishlist) {
    final data = state.data;
    data?.data?.inWishlist = inWishlist;
    state = StateModel.success(data);
  }
}

class GetServiceDetailsUseCase
    extends StateNotifier<StateModel<ServiceShowResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetServiceDetailsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getServiceDetails({
    String? serviceId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.showServiceDetails(serviceId: serviceId));
  }

  void handelAddServiceToCart(num serviceId) {
    final data = state.data;
    data?.data?.inCart = true;
    state = StateModel.success(data);
  }
  void handelAddServiceToWishList(num serviceId,bool inWishList) {
    final data = state.data;
    data?.data?.inWishlist = inWishList;
    state = StateModel.success(data);
  }
}

class GetProductReviewsUseCase
    extends StateNotifier<StateModel<ProductDetailsResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetProductReviewsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getProductDetails({
    String? productId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.showProductReviews(productId: productId));
  }
}

class GetServiceReviewsUseCase
    extends StateNotifier<StateModel<ServiceShowResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetServiceReviewsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getServiceDetails({
    String? serviceId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.showServiceReviews(serviceId: serviceId));
  }
}

class GetSellerDetailsUseCase
    extends StateNotifier<StateModel<ShowAProviderDetails200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  final int type;
  GetSellerDetailsUseCase(this.ref, this.publicApi, this.type)
      : super(StateModel());

  void getSellerDetails({
    num? providerId,
  }) {
    state = StateModel.loading();
    request(() =>
        publicApi.showAProviderDetails(providerId: providerId, type: type));
  }

  void handleAddProductToCart(int id,List<String> categories){
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if(data?.data?.categories?[i].id == int.parse(categoryId)){
          for (int n = 0; n < (data?.data?.categories?[i].products?.length ?? 0); n++) {
            if(data?.data?.categories?[i].products?[n].id == id){
              data?.data?.categories?[i].products?[n].inCart = true;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddProductToWishList(int id,List<String> categories,bool inWishlist){
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if(data?.data?.categories?[i].id == int.parse(categoryId)){
          for (int n = 0; n < (data?.data?.categories?[i].products?.length ?? 0); n++) {
            if(data?.data?.categories?[i].products?[n].id == id){
              data?.data?.categories?[i].products?[n].inWishlist = inWishlist;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddServiceToCart(int id,List<String> categories){
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if(data?.data?.categories?[i].id == int.parse(categoryId)){
          for (int n = 0; n < (data?.data?.categories?[i].services?.length ?? 0); n++) {
            if(data?.data?.categories?[i].services?[n].id == id){
              data?.data?.categories?[i].services?[n].inCart = true;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddServiceToWishList(int id,List<String> categories, bool inWishList){
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if(data?.data?.categories?[i].id == int.parse(categoryId)){
          for (int n = 0; n < (data?.data?.categories?[i].services?.length ?? 0); n++) {
            if(data?.data?.categories?[i].services?[n].id == id){
              data?.data?.categories?[i].services?[n].inWishlist = inWishList;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }
}

class AppInfoUseCase extends StateNotifier<StateModel<GetAppInfo200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  AppInfoUseCase(this.ref, this.publicApi) : super(StateModel());

  void getAppInfo() {
    state = StateModel.loading();
    request(() => publicApi.getAppInfo());
  }
}

class AddToCartUseCase extends StateNotifier<
    StateModel<AddProductServiceToCartCartItem200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  AddToCartUseCase(this.ref, this.publicApi) : super(StateModel());

  void addToCart({
    String? sessionId,
    String? productId,
    String? productQuantity = "1",
    String? productSelectedListIds,
    String? productSelectedListItemsIds,
    String? serviceId,
    String? serviceQuantity = "1",
    String? serviceSelectedListIds,
    String? serviceSelectedListItemsIds,
  }) {
    state = StateModel.loading();
    request(
        () => publicApi.addProductServiceToCartCartItem(
            sessionId: sessionId,
            productId: productId,
            productQuantity: productQuantity,
            productSelectedListIds: productSelectedListIds,
            productSelectedListItemsIds: productSelectedListItemsIds,
            serviceId: serviceId,
            serviceQuantity: serviceQuantity,
            serviceSelectedListIds: serviceSelectedListIds,
            serviceSelectedListItemsIds: serviceSelectedListItemsIds),
        onComplete: (res) {
      if (ref.read(clientStateProvider.notifier).checkIfUserExist() == null) {
        ref
            .read(getSessionHandlerStateNotifier.notifier)
            .setSessionId(res.data?.sessionId);
        print(
            "${ref.read(getSessionHandlerStateNotifier.notifier).checkIfSessionIdExist()}");
      }
    });
  }
}

class SessionHandler extends StateNotifier<String?> {
  final Ref ref;
  SessionHandler(this.ref) : super(null);

  String? checkIfSessionIdExist() {
    print("SessionId = ${prefs.getString(sessionIdKey)}");
    String? sessionId = prefs.getString(sessionIdKey);
    print("SessionId = $sessionId");
    if(sessionId?.isNotEmpty == true){
      ref.read(apiClient).defaultHeaderMap["session_id"] = sessionId??"";
    }
    return sessionId?.isNotEmpty == true ? sessionId : null;
  }

  void setSessionId(String? sessionId) {
    state = sessionId;
    prefs.setString(sessionIdKey, sessionId ?? "");
    ref.read(apiClient).defaultHeaderMap["session_id"] = sessionId??"";
    print("clint model saved $sessionId");
  }

  Future<bool> clearSessionId() async {
    state = null;
    await prefs.remove(sessionIdKey);
    return true;
  }
}
