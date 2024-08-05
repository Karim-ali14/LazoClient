import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/FilterData.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Doman/useCases/PublicUseCases.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/AuthUaseCases.dart';

final getCities = StateNotifierProvider.autoDispose<CitiesUseCases,
        StateModel<CitiesResponse?>>(
    (ref) => CitiesUseCases(ref, ref.read(publicApi)));

final uploadFilesStateNotifiers = StateNotifierProvider.autoDispose<
        UploadFilesUseCase, StateModel<UploadFilesResponse>>(
    (ref) => UploadFilesUseCase(ref, ref.read(publicApi)));

final homeDataStateNotifiers =
    StateNotifierProvider<HomeDataUseCase, StateModel<ShowHome200Response>>(
        (ref) => HomeDataUseCase(ref, ref.read(publicApi)));

final getCategoriesDataStateNotifiers =
    StateNotifierProvider<GetCategoriesUseCase, StateModel<CategoriesResponse>>(
        (ref) => GetCategoriesUseCase(ref, ref.read(publicApi)));

final getOccasionsDataStateNotifiers =
    StateNotifierProvider<GetOccasionsUseCase, StateModel<OccasionsResponse>>(
        (ref) => GetOccasionsUseCase(ref, ref.read(publicApi)));

final getTopSellersDataStateNotifiers = StateNotifierProvider<
        GetTopSellersUseCase, StateModel<FilterTopSellers200Response>>(
    (ref) => GetTopSellersUseCase(ref, ref.read(publicApi)));

final getProductsStateNotifiers = StateNotifierProvider<GetProductsUseCase,
        StateModel<FilterTopProductsServices200Response>>(
    (ref) => GetProductsUseCase(ref, ref.read(publicApi)));

final getServicesStateNotifiers = StateNotifierProvider<GetServicesUseCase,
        StateModel<FilterTopProductsServices200Response>>(
    (ref) => GetServicesUseCase(ref, ref.read(publicApi)));

final filterForProductStateNotifiers =
    StateNotifierProvider<FilterDataUseCase, FilterData>(
        (ref) => FilterDataUseCase(ref));

final filterForServiceStateNotifiers =
    StateNotifierProvider<FilterDataUseCase, FilterData>(
        (ref) => FilterDataUseCase(ref));

final filterForSellerStateNotifiers =
    StateNotifierProvider<FilterDataUseCase, FilterData>(
        (ref) => FilterDataUseCase(ref));

final getProductDetails = StateNotifierProvider<GetProductDetailsUseCase,
        StateModel<ProductDetailsResponse>>(
    (ref) => GetProductDetailsUseCase(ref, ref.read(publicApi)));

final getServiceDetails = StateNotifierProvider<GetServiceDetailsUseCase,
        StateModel<ServiceShowResponse>>(
    (ref) => GetServiceDetailsUseCase(ref, ref.read(publicApi)));
