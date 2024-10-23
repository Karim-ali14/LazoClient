import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Constants/Eunms.dart';
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

final getRelatedProductsStateNotifiers = StateNotifierProvider.autoDispose<
        GetProductsUseCase, StateModel<FilterTopProductsServices200Response>>(
    (ref) => GetProductsUseCase(ref, ref.read(publicApi)));

final getRelatedServicesStateNotifiers = StateNotifierProvider.autoDispose<
        GetServicesUseCase, StateModel<FilterTopProductsServices200Response>>(
    (ref) => GetServicesUseCase(ref, ref.read(publicApi)));

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

final getProductDetails = StateNotifierProvider.autoDispose<
        GetProductDetailsUseCase, StateModel<ProductDetailsResponse>>(
    (ref) => GetProductDetailsUseCase(ref, ref.read(publicApi)));

final getServiceDetails = StateNotifierProvider.autoDispose<
        GetServiceDetailsUseCase, StateModel<ServiceShowResponse>>(
    (ref) => GetServiceDetailsUseCase(ref, ref.read(publicApi)));

final getProductReviews = StateNotifierProvider.autoDispose<
        GetProductReviewsUseCase, StateModel<ProductDetailsResponse>>(
    (ref) => GetProductReviewsUseCase(ref, ref.read(publicApi)));

final getServiceReviews = StateNotifierProvider.autoDispose<
        GetServiceReviewsUseCase, StateModel<ServiceShowResponse>>(
    (ref) => GetServiceReviewsUseCase(ref, ref.read(publicApi)));

final getSellerDetailsWithProductStateNotifier =
    StateNotifierProvider.autoDispose<GetSellerDetailsUseCase,
            StateModel<ShowAProviderDetails200Response>>(
        (ref) => GetSellerDetailsUseCase(
            ref, ref.read(publicApi), ItemType.Products.index));

final getSellerDetailsWithServicesStateNotifier =
    StateNotifierProvider.autoDispose<GetSellerDetailsUseCase,
            StateModel<ShowAProviderDetails200Response>>(
        (ref) => GetSellerDetailsUseCase(
            ref, ref.read(publicApi), ItemType.Services.index));

final getSellerDetailsWithReviewsStateNotifier =
    StateNotifierProvider.autoDispose<GetSellerDetailsUseCase,
            StateModel<ShowAProviderDetails200Response>>(
        (ref) => GetSellerDetailsUseCase(ref, ref.read(publicApi), 2));

final getAppInfoStateNotifier =
    StateNotifierProvider<AppInfoUseCase, StateModel<GetAppInfo200Response>>(
        (ref) => AppInfoUseCase(ref, ref.read(publicApi)));

final getSessionHandlerStateNotifier =
    StateNotifierProvider<SessionHandler, String?>(
        (ref) => SessionHandler(ref));

final addProductToCartUseCaseStateNotifier = StateNotifierProvider.autoDispose<
        AddToCartUseCase,
        StateModel<AddProductServiceToCartCartItem200Response>>(
    (ref) => AddToCartUseCase(ref, ref.read(publicApi)));

final addServiceToCartUseCaseStateNotifier = StateNotifierProvider.autoDispose<
        AddToCartUseCase,
        StateModel<AddProductServiceToCartCartItem200Response>>(
    (ref) => AddToCartUseCase(ref, ref.read(publicApi)));

final fetchAllGiftCardsStateNotifies = StateNotifierProvider.autoDispose<
        FetchAllGiftCardsUseCase, StateModel<ShowAllGiftCards200Response?>>(
    (ref) => FetchAllGiftCardsUseCase(ref, ref.read(publicApi)));

final fetchAllGiftBoxStateNotifies = StateNotifierProvider.autoDispose<
        FetchAllGiftBoxUseCase, StateModel<ShowAllGiftBoxes200Response?>>(
    (ref) => FetchAllGiftBoxUseCase(ref, ref.read(publicApi)));

final fetchCardDetailsStateNotifies = StateNotifierProvider.autoDispose<
        FetchCardDetailsUseCase, StateModel<ShowCartDetails200Response?>>(
    (ref) => FetchCardDetailsUseCase(ref, ref.read(publicApi)));

final cartCalculationStateNotifies = StateNotifierProvider<CartCalculation,
        StateModel<CartCalculation200Response?>>(
    (ref) => CartCalculation(ref, ref.read(publicApi)));

final showPromoCodeDetailsStateNotifies = StateNotifierProvider.autoDispose<
        ShowPromoCodeDetails, StateModel<ShowPromocodeDetails200Response?>>(
    (ref) => ShowPromoCodeDetails(ref, ref.read(publicApi)));

final updateCartItemsStateNotifies = StateNotifierProvider.autoDispose<
        UpdateCartItemsUseCase, StateModel<UpdateCartItemQuantity200Response?>>(
    (ref) => UpdateCartItemsUseCase(ref, ref.read(publicApi)));

final deleteItemCartStateNotifies = StateNotifierProvider.autoDispose<
        DeleteItemCartUseCase, StateModel<Object?>>(
    (ref) => DeleteItemCartUseCase(ref, ref.read(publicApi)));

final cartDateSelectedStateNotifiers =
    StateNotifierProvider<CartSelectionInfo, Map<String, Object>>(
        (ref) => CartSelectionInfo());
