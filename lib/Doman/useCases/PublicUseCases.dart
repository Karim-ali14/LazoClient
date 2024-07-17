import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

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

  void getTopSellersData({int page = 1, String? searchByName}) async {
    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
        () =>
            publicApi.filterTopSellers(page: page, searchByName: searchByName),
        onComplete: (res) {
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

class GetProductAndServiceUseCase
    extends StateNotifier<StateModel<FilterTopSellers200Response>> {
  final Ref ref;
  final PublicApi publicApi;
  GetProductAndServiceUseCase(this.ref, this.publicApi) : super(StateModel());

  void getProductAndServiceData({
    int page = 1,
    String? searchByName,
    List<String>? categoriesIds,
    List<String>? occasionsIds,
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
            page: page,
            searchByName: searchByName,
            categoriesIds: categoriesIds,
            occasionsIds: occasionsIds,
            priceFrom: priceFrom,
            priceTo: priceTo,
            ratings: ratings,
            type: type), onComplete: (res) {
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
