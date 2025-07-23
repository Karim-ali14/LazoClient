import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../Constants/Eunms.dart';
import '../../Localization/Keys.dart';
import '../../Localization/LanguageProvider.dart';
import '../../Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../main.dart';

class CountriesUseCases extends StateNotifier<StateModel<CountriesResponse?>> {
  final Ref ref;
  final PublicApi publicApi;
  CountriesUseCases(this.ref, this.publicApi) : super(StateModel());

  void fetchCountries() async {
    state = StateModel.loading();
    request(() =>
        publicApi.countriesGet(lang: ref.read(langProvider).languageCode));
  }
}

class CitiesUseCases extends StateNotifier<StateModel<CitiesResponse?>> {
  final Ref ref;
  final PublicApi publicApi;
  CitiesUseCases(this.ref, this.publicApi) : super(StateModel());

  void getCities({
    String? countryId,
  }) async {
    state = StateModel.loading();
    request(() => publicApi.citiesGet(
        lang: ref.read(langProvider).languageCode, countryId: countryId));
  }
}

class HomeDataUseCase extends StateNotifier<StateModel<ShowHome200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  ShowHome200Response? data;
  HomeDataUseCase(this.ref, this.publicApi) : super(StateModel());

  void getHomeData({
    String? cityId,
  }) async {
    state = StateModel.loading();
    request(() => publicApi.showHome(cityId: cityId), onComplete: (res) {
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

  void handleAddProductToWishList(
      num productId, bool inWishlist, int? collectionId) {
    if (data != null) {
      var index = data?.data?.topRatedProducts
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedProducts.getSafe(index)?.inWishlist = inWishlist;
        data?.data?.topRatedProducts.getSafe(index)?.wishlistCollectionId =
            collectionId?.toString();
      }
      state = StateModel.success(data);
    }
  }

  void handelAddServiceToWishList(
      num serviceId, bool inWishlist, int? collectionId) {
    if (data != null) {
      var index = data?.data?.topRatedServices
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.topRatedServices.getSafe(index)?.inWishlist = inWishlist;
        data?.data?.topRatedProducts.getSafe(index)?.wishlistCollectionId =
            collectionId?.toString();
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
                cityId: prefs.getInt(selectedCityIdKey).toString(),
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

  void getProductsData(
      {int page = 1,
      String? searchByName,
      List<num>? categoriesIds,
      List<num>? occasionsIds,
      String? priceFrom,
      String? priceTo,
      List<String>? ratings,
      String? type,
      String? productId,
      num? providerId,
      String? shipmentType}) async {
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
                      cityId: prefs.getInt(selectedCityIdKey).toString(),
                      page: page,
                      searchByName: searchByName,
                      categoriesIds: categoriesIds,
                      occasionsIds: occasionsIds,
                      priceFrom: num.tryParse(priceFromValue ?? ""),
                      priceTo: num.tryParse(priceTo ?? ""),
                      ratings: ratings,
                      type: type ?? ItemType.Products.name.toLowerCase(),
                      providerId: providerId,
                      shipmentType: shipmentType),
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
          if (indexWhere != -1) {
            list.removeAt(indexWhere);
          }
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

  void handleAddProductToWishList(
      num productId, bool inWishList, int? collectionId) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.products?.data
          .indexWhere((product) => productId == product.id);
      if (index != null && index != -1) {
        data?.data?.products?.data.getSafe(index)?.inWishlist = inWishList;
        data?.data?.products?.data.getSafe(index)?.wishlistCollectionId =
            collectionId?.toString();
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
                cityId: prefs.getInt(selectedCityIdKey).toString(),
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
          if (indexWhere != -1) {
            list.removeAt(indexWhere);
          }

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

  void handelAddServiceToWishlist(
      num serviceId, bool inWishlist, int? collectionId) {
    if (state.data != null) {
      final data = state.data;
      var index = data?.data?.services?.data
          .indexWhere((product) => serviceId == product.id);
      if (index != null && index != -1) {
        data?.data?.services?.data.getSafe(index)?.inWishlist = inWishlist;
        data?.data?.services?.data.getSafe(index)?.wishlistCollectionId =
            collectionId?.toString();
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
      int? shipmentTypeSelected,
      String? priceFromSelected,
      String? priceToSelected,
      List<int>? categoriesIdsSelected,
      List<int>? occasionsIdsSelected,
      List<int>? ratingValueSelected}) {
    state = FilterData(
        promotionSelected: promotionSelected,
        shipmentTypeSelected: shipmentTypeSelected,
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

class FilterNumberCountUseCase extends StateNotifier<int> {
  final Ref ref;
  FilterNumberCountUseCase(this.ref) : super(0);

  void updateNumber({int? number}) {
    print("number : $number");
    state = number ?? 0;
  }
}

class GetProductDetailsUseCase
    extends StateNotifier<StateModel<ProductDetailsResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetProductDetailsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getProductDetails({String? productId, ProductDetails? product}) {
    state = StateModel.loading();
    request(() => publicApi.showProductDetails(productId: productId),
        onComplete: (res) {
      if (product != null) {
        print("sadkfjakdjsl${product.cartItemId}");
        print("sadkfjakdjsl${res.data?.cartItemId}");
        res.data?.inCart = true;
        res.data?.cartItemId = product.cartItemId;
        res.data?.lists = [...?product.lists];
        state = StateModel.success(res);
      }
    });
  }

  void handelAddProductToCart(num productId) {
    final data = state.data;
    data?.data?.inCart = true;
    state = StateModel.success(data);
  }

  void handelAddProductToWishList(
      num productId, bool inWishlist, int? collectionId) {
    final data = state.data;
    data?.data?.inWishlist = inWishlist;
    data?.data?.wishlistCollectionId = collectionId?.toString();
    state = StateModel.success(data);
  }

  void productDetails(ProductDetails product) {
    ProductDetailsResponse response =
        ProductDetailsResponse(status: true, message: "", data: product);
    state = StateModel.success(response);
  }
}

class GetServiceDetailsUseCase
    extends StateNotifier<StateModel<ServiceShowResponse>> {
  final Ref ref;
  final PublicApi publicApi;
  GetServiceDetailsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getServiceDetails({String? serviceId, ServiceShowData? service}) {
    state = StateModel.loading();
    request(() => publicApi.showServiceDetails(serviceId: serviceId),
        onComplete: (res) {
      if (service != null) {
        res.data?.inCart = true;
        res.data?.cartItemId = service.cartItemId;
        res.data?.lists = [...?service.lists];
        state = StateModel.success(res);
      }
    });
  }

  void handelAddServiceToCart(num serviceId) {
    final data = state.data;
    data?.data?.inCart = true;
    state = StateModel.success(data);
  }

  void handelAddServiceToWishList(
      num serviceId, bool inWishList, int? collectionId) {
    final data = state.data;
    data?.data?.inWishlist = inWishList;
    data?.data?.wishlistCollectionId = collectionId?.toString();

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

  void handleAddProductToCart(int id, List<String> categories) {
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if (data?.data?.categories?[i].id == int.parse(categoryId)) {
          for (int n = 0;
              n < (data?.data?.categories?[i].products?.length ?? 0);
              n++) {
            if (data?.data?.categories?[i].products?[n].id == id) {
              data?.data?.categories?[i].products?[n].inCart = true;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddProductToWishList(
      int id, List<String> categories, bool inWishlist, int? collectionId) {
    final data = state.data;

    print("before categoriessdfas $categories");

    for (var categoryId in categories) {
      print("processing categoryId $categoryId");
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        print("processing checking ${data?.data?.categories?[i].id} == $categoryId");
        if (data?.data?.categories?[i].id == int.parse(categoryId)) {
          for (int n = 0;
              n < (data?.data?.categories?[i].products?.length ?? 0);
              n++) {
            print("processing checking ${data?.data?.categories?[i].products?[n].id} == $id");

            if (data?.data?.categories?[i].products?[n].id == id) {
              data?.data?.categories?[i].products?[n].inWishlist = inWishlist;
              data?.data?.categories?[i].products?[n].wishlistCollectionId =
                  collectionId?.toString();
              print("processing  after checking ${data?.data?.categories?.first.products?.first.inWishlist} categories $collectionId");

            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddServiceToCart(int id, List<String> categories) {
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if (data?.data?.categories?[i].id == int.parse(categoryId)) {
          for (int n = 0;
              n < (data?.data?.categories?[i].services?.length ?? 0);
              n++) {
            if (data?.data?.categories?[i].services?[n].id == id) {
              data?.data?.categories?[i].services?[n].inCart = true;
            }
          }
        }
      }
    }
    state = StateModel.success(data);
  }

  void handleAddServiceToWishList(
      int id, List<String> categories, bool inWishList, int? collectionId) {
    final data = state.data;
    for (var categoryId in categories) {
      for (int i = 0; i < (data?.data?.categories?.length ?? 0); i++) {
        if (data?.data?.categories?[i].id == int.parse(categoryId)) {
          for (int n = 0;
              n < (data?.data?.categories?[i].services?.length ?? 0);
              n++) {
            if (data?.data?.categories?[i].services?[n].id == id) {
              data?.data?.categories?[i].services?[n].inWishlist = inWishList;
              if (collectionId != null) {
                data?.data?.categories?[i].services?[n].wishlistCollectionId =
                    collectionId.toString();
              }
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
    int? isOutsideDelivery,
  }) {
    state = StateModel.loading();
    requestWithHandleMessage(
        () => publicApi.addProductServiceToCartCartItem(
            cityId: prefs.getInt(selectedCityIdKey).toString(),
            sessionId: sessionId,
            productId: productId,
            productQuantity: productQuantity,
            productSelectedListIds: productSelectedListIds,
            productSelectedListItemsIds: productSelectedListItemsIds,
            serviceId: serviceId,
            serviceQuantity: serviceQuantity,
            serviceSelectedListIds: serviceSelectedListIds,
            serviceSelectedListItemsIds: serviceSelectedListItemsIds,
            isOutsideDelivery : isOutsideDelivery
        ),

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

class FetchAllGiftCardsUseCase
    extends StateNotifier<StateModel<ShowAllGiftCards200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  FetchAllGiftCardsUseCase(this.ref, this.publicApi) : super(StateModel());

  void fetchAllGiftCards() {
    state = StateModel.loading();
    request(
      () => publicApi.showAllGiftCards(),
    );
  }
}

class FetchAllGiftBoxUseCase
    extends StateNotifier<StateModel<ShowAllGiftBoxes200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  FetchAllGiftBoxUseCase(this.ref, this.publicApi) : super(StateModel());

  void fetchAllGiftBox() {
    state = StateModel.loading();
    request(() => publicApi.showAllGiftBoxes());
  }
}

class FetchCardDetailsUseCase
    extends StateNotifier<StateModel<ShowCartDetails200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  FetchCardDetailsUseCase(this.ref, this.publicApi) : super(StateModel());

  void getCardDetails({
    String? sessionId,
  }) {
    state = StateModel.loading();
    request(
        () => publicApi.showCartDetails(
            sessionId: sessionId,
            cityId: prefs.getInt(selectedCityIdKey).toString()),
        onComplete: (res) {
      print("asdfasdfasdfs${res?.data?.cartItems.isEmpty}");
      if (res?.data?.cartItems.isEmpty != true) {
        state = StateModel.empty(data: res?.data);
      }
    });
  }

  void updateItem(CartItemsInner updatedItem) {
    final providers =
        (state.data?.data?.cartItems ?? []).toList(growable: true);

    int? providerIndex;
    int? cartItemIndex;

    // Find the provider and item index
    for (int pIndex = 0; pIndex < providers.length; pIndex++) {
      final provider = providers[pIndex];
      final items = provider.items;

      final iIndex = items?.indexWhere((item) => item.id == updatedItem.id);
      if (iIndex != -1) {
        providerIndex = pIndex;
        cartItemIndex = iIndex;
        break;
      }
    }

    if (providerIndex != null && cartItemIndex != null) {
      providers[providerIndex!].items?[cartItemIndex!] = updatedItem;

      state.data?.data?.cartItems = providers;

      state = StateModel.success(state.data);

      // Optionally, print or log the indices
      print(
          'Updated item at providerIndex: $providerIndex, cartItemIndex: $cartItemIndex');
    }
  }

  void toggleWishlistStatusByItemId(num itemId, CartItemType type, int? collectionId) {
    print("object");
    final providers = (state.data?.data?.cartItems ?? []).toList(growable: true);

    int? providerIndex;
    int? itemIndex;

    // Search for the item by ID and type inside each provider
    for (int pIndex = 0; pIndex < providers.length; pIndex++) {
      final provider = providers[pIndex];
      final items = provider.items;

      final iIndex = items?.indexWhere((item) {
        print("object itemId : $itemId selectedItemId :${item.id} itemType :$type selectedType :${item.type}");
        if(item.type == type.name.toLowerCase().toString()){
          if (item.type == CartItemType.Product.name.toLowerCase().toString()) {
            return item.product?.id == itemId;
          } else if (item.type == CartItemType.Service.name.toLowerCase().toString()) {
            return item.service?.id == itemId;
          }
        }
       return false;
      }); // Filter by both id and type

      if (iIndex != null && iIndex != -1) {
        providerIndex = pIndex;
        itemIndex = iIndex;
        break;
      }
    }
    print("object providerIndex : $providerIndex , itemIndex : $itemIndex");

    if (providerIndex != null && itemIndex != null) {
      final item = providers[providerIndex!].items![itemIndex!];

      // Toggle the wishlist flag
      if (item.type == CartItemType.Product.name.toLowerCase().toString()) {
        item.product?.inWishlist = !(item.product?.inWishlist ?? false);
        item.product?.wishlistCollectionId = collectionId.toString();
      } else if (item.type == CartItemType.Service.name.toLowerCase().toString()) {
        item.service?.inWishlist = !(item.service?.inWishlist ?? false);
        item.service?.wishlistCollectionId = collectionId.toString();
      }

      // Reassign to trigger UI/state updates if needed
      providers[providerIndex!].items![itemIndex!] = item;

      // Update state
      var data = state.data;
      data?.data?.cartItems = providers;
      state = StateModel.success(data);

      print(
          'Toggled wishlist for item at providerIndex: $providerIndex, itemIndex: $itemIndex');
    }
  }

  void deleteItem(num cartItemId) {
    final providers =
        (state.data?.data?.cartItems ?? []).toList(growable: true);

    int? providerIndex;
    int? cartItemIndex;

    for (int pIndex = 0; pIndex < providers.length; pIndex++) {
      final provider = providers[pIndex];
      final items = provider.items;

      final iIndex = items?.indexWhere((item) {
        print("object itemId : $cartItemId selectedItemId :${item.id}");

        return item.id == cartItemId;
      } );
      if (iIndex != -1) {
        providerIndex = pIndex;
        cartItemIndex = iIndex;
        break;
      }
    }


    print(
        'Deleted item at providerIndex: $providerIndex, cartItemIndex: $cartItemIndex');

    if (providerIndex != null && cartItemIndex != null) {
      var list = providers[providerIndex].items?.toList(growable: true);

      list?.removeAt(cartItemIndex);

      providers[providerIndex].items = list;
      if (providers[providerIndex].items?.isEmpty == true) {
        providers.removeAt(providerIndex);
      }

      var data = state.data;
      data?.data?.cartItems = providers;

      if (data?.data?.cartItems.isNotEmpty == true) {
        state = StateModel.success(data);
      } else {
        state = StateModel.empty(data: data);
      }

      // Optionally, print or log the indices
      print(
          'Deleted item at providerIndex: $providerIndex, cartItemIndex: $cartItemIndex');
    }
  }
}

class CartSelectionInfo extends StateNotifier<Map<String, Object?>> {
  CartSelectionInfo() : super({});

  void setCartDataSelection(Map<String, Object?> dateSelection) {
    state = {};
    state = dateSelection;
  }
}

class CartCalculation
    extends StateNotifier<StateModel<CartCalculation200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  CartCalculation(this.ref, this.publicApi) : super(StateModel());

  void cartCalculation({
    String? cartId,
    String? promocode,
    String? giftBoxId,
    String? giftCardId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.cartCalculation(
        cartId: cartId,
        promocode: promocode,
        giftBoxId: giftBoxId,
        giftCardId: giftCardId));
  }

  void calculateSoftItemForCheckout({
    num? totalPrice,
    String? promocode,
    String? giftBoxId,
    String? giftCardId,
  }) {
    state = StateModel.success(CartCalculation200Response(
        data: CartCalculation200ResponseData(
            totalAfter: totalPrice, totalBefore: totalPrice)));
  }
}

class ShowPromoCodeDetails
    extends StateNotifier<StateModel<ShowPromocodeDetails200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  ShowPromoCodeDetails(this.ref, this.publicApi) : super(StateModel());
  void showPromoCodeDetails({
    String? promocodeId,
    String? code,
  }) {
    state = StateModel.loading();
    requestWithHandleMessage(() =>
        publicApi.showPromocodeDetails(code: code, promocodeId: promocodeId));
  }
}

class UpdateCartItemsUseCase
    extends StateNotifier<StateModel<UpdateCartItemQuantity200Response?>> {
  final Ref ref;
  final PublicApi publicApi;
  UpdateCartItemsUseCase(this.ref, this.publicApi) : super(StateModel());

  void updateCartItems({
    String? cartItemId,
    String? quantity,
    String? productSelectedListIds,
    String? productSelectedListItemsIds,
    String? serviceSelectedListIds,
    String? serviceSelectedListItemsIds,
  }) {
    state = StateModel.loading();
    request(() => publicApi.updateCartItemQuantity(
        cartItemId: cartItemId,
        quantity: quantity,
        productSelectedListIds: productSelectedListIds,
        productSelectedListItemsIds: productSelectedListItemsIds,
        serviceSelectedListIds: serviceSelectedListIds,
        serviceSelectedListItemsIds: serviceSelectedListItemsIds));
  }
}

class DeleteItemCartUseCase extends StateNotifier<StateModel<void>> {
  final Ref ref;
  final PublicApi publicApi;
  DeleteItemCartUseCase(this.ref, this.publicApi) : super(StateModel());

  void deleteItemCart({
    String? cartItemId,
  }) {
    state = StateModel.loading();
    request(() => publicApi.deleteCartItem(cartItemId: cartItemId));
  }
}

class SessionHandler extends StateNotifier<String?> {
  final Ref ref;
  SessionHandler(this.ref) : super(null);

  String? checkIfSessionIdExist() {
    print("SessionId = ${prefs.getString(sessionIdKey)}");
    String? sessionId = prefs.getString(sessionIdKey);
    print("SessionId = $sessionId");
    if (sessionId?.isNotEmpty == true) {
      ref.read(apiClient).defaultHeaderMap["session_id"] = sessionId ?? "";
    }
    return sessionId?.isNotEmpty == true ? sessionId : null;
  }

  void setSessionId(String? sessionId) {
    state = sessionId;
    prefs.setString(sessionIdKey, sessionId ?? "");
    ref.read(apiClient).defaultHeaderMap["session_id"] = sessionId ?? "";
    print("clint model saved $sessionId");
  }

  Future<bool> clearSessionId() async {
    state = null;
    await prefs.remove(sessionIdKey);
    return true;
  }
}

class SendTestPushNotificationUseCase
    extends StateNotifier<StateModel<SendPushNotification200Response?>> {
  final PublicApi publicApi;
  SendTestPushNotificationUseCase(this.publicApi) : super(StateModel());

  void sendTestNotification({
    String? token,
    String? deviceType,
  }) {
    request(() =>
        publicApi.sendPushNotification(token: token, deviceType: "android"));
  }
}
