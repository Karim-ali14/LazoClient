import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Constants/Eunms.dart';

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
  HomeDataUseCase(this.ref, this.publicApi) : super(StateModel());

  void getHomeData() async {
    state = StateModel.loading();
    request(() => publicApi.showHome());
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
      list.addAll(res.data);
    });
  }

  void searchInMainList(String value) {
    final filterList =
        list.where((item) => item.name?.contains(value) ?? false);
    state.data?.data = [...filterList];
    print(state.data?.data.isNotEmpty);
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
      list.addAll(res.data);
    });
  }

  void searchInMainList(String value) {
    final filterList =
        list.where((item) => item.name?.contains(value) ?? false);
    state.data?.data = [...filterList];
    print(state.data?.data.isNotEmpty);
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
      String? isPromoted,
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
            occasionsIds: occasionsIds?.map((item) => item.toString()).toList(),
            ratings: ratings,
            isPromoted: isPromoted
        )
        ), onComplete: (res) {
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
  }) async {
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
                      priceFrom: priceFrom,
                      priceTo: priceTo,
                      ratings: ratings,
                      type: type ?? ItemType.Products.name.toLowerCase()),
            ), onComplete: (res) {
      if (page != 1) {
        List<ProviderProduct> list = state.data?.data?.products?.data ?? [];
        state.data?.data?.products?.data = [
          ...list,
          ...(res.data?.products?.data ?? [])
        ];
        state = StateModel.success(state.data);
      } else {
        state = StateModel.success(res);
      }
      if (state.data?.data?.products?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }
}

class GetServicesUseCase
    extends StateNotifier<StateModel<FilterTopProductsServices200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  GetServicesUseCase(this.ref, this.publicApi) : super(StateModel());

  void getServicesData({
    int page = 1,
    String? searchByName,
    List<num>? categoriesIds,
    List<num>? occasionsIds,
    String? priceFrom,
    String? priceTo,
    List<String>? ratings,
    String? type,
  }) async {
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
                priceFrom: priceFrom,
                priceTo: priceTo,
                ratings: ratings,
                type: type ?? ItemType.Services.name.toLowerCase())),
        onComplete: (res) {
      if (page != 1) {
        List<ServiceShowData> list = state.data?.data?.services?.data ?? [];
        state.data?.data?.services?.data = [
          ...list,
          ...(res.data?.services?.data ?? [])
        ];
        state = StateModel.success(state.data);
      } else {
        state = StateModel.success(res);
      }
      if (state.data?.data?.products?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
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
}
