//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PublicApi {
  PublicApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// show all cities
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lang:
  Future<Response> citiesGetWithHttpInfo({ String? lang, }) async {
    // ignore: prefer_const_declarations
    final path = r'/cities';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lang != null) {
      headerParams[r'lang'] = parameterToString(lang);
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all cities
  ///
  /// Parameters:
  ///
  /// * [String] lang:
  Future<CitiesResponse?> citiesGet({ String? lang, }) async {
    final response = await citiesGetWithHttpInfo( lang: lang, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CitiesResponse',) as CitiesResponse;
    
    }
    return null;
  }

  /// client login
  ///
  /// client login
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] phone:
  Future<Response> clientLoginWithHttpInfo({ String? phone, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/login';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (phone != null) {
      hasFields = true;
      mp.fields[r'phone'] = parameterToString(phone);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// client login
  ///
  /// client login
  ///
  /// Parameters:
  ///
  /// * [String] phone:
  Future<ClientAuthResponse?> clientLogin({ String? phone, }) async {
    final response = await clientLoginWithHttpInfo( phone: phone, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientAuthResponse',) as ClientAuthResponse;
    
    }
    return null;
  }

  /// client signup
  ///
  /// client signup
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cityId:
  ///
  /// * [String] email:
  ///   optional
  ///
  /// * [String] image:
  ///   optional
  ///
  /// * [String] name:
  ///
  /// * [String] phone:
  Future<Response> clientSignupWithHttpInfo({ String? cityId, String? email, String? image, String? name, String? phone, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/register';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
    }
    if (email != null) {
      hasFields = true;
      mp.fields[r'email'] = parameterToString(email);
    }
    if (image != null) {
      hasFields = true;
      mp.fields[r'image'] = parameterToString(image);
    }
    if (name != null) {
      hasFields = true;
      mp.fields[r'name'] = parameterToString(name);
    }
    if (phone != null) {
      hasFields = true;
      mp.fields[r'phone'] = parameterToString(phone);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// client signup
  ///
  /// client signup
  ///
  /// Parameters:
  ///
  /// * [String] cityId:
  ///
  /// * [String] email:
  ///   optional
  ///
  /// * [String] image:
  ///   optional
  ///
  /// * [String] name:
  ///
  /// * [String] phone:
  Future<ClientAuthResponse?> clientSignup({ String? cityId, String? email, String? image, String? name, String? phone, }) async {
    final response = await clientSignupWithHttpInfo( cityId: cityId, email: email, image: image, name: name, phone: phone, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientAuthResponse',) as ClientAuthResponse;
    
    }
    return null;
  }

  /// Filter top products & services
  ///
  /// Filter top products & services
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] categoriesIds:
  ///
  /// * [List<String>] occasionsIds:
  ///
  /// * [String] priceFrom:
  ///
  /// * [String] priceTo:
  ///
  /// * [List<String>] ratings:
  ///
  /// * [String] type:
  ///   products or services
  Future<Response> filterTopProductsServicesWithHttpInfo({ List<String>? categoriesIds, List<String>? occasionsIds, String? priceFrom, String? priceTo, List<String>? ratings, String? type, }) async {
    // ignore: prefer_const_declarations
    final path = r'/top-products-services/filter';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (categoriesIds != null) {
      hasFields = true;
      mp.fields[r'categories_ids'] = parameterToString(categoriesIds);
    }
    if (occasionsIds != null) {
      hasFields = true;
      mp.fields[r'occasions_ids'] = parameterToString(occasionsIds);
    }
    if (priceFrom != null) {
      hasFields = true;
      mp.fields[r'price_from'] = parameterToString(priceFrom);
    }
    if (priceTo != null) {
      hasFields = true;
      mp.fields[r'price_to'] = parameterToString(priceTo);
    }
    if (ratings != null) {
      hasFields = true;
      mp.fields[r'ratings'] = parameterToString(ratings);
    }
    if (type != null) {
      hasFields = true;
      mp.fields[r'type'] = parameterToString(type);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Filter top products & services
  ///
  /// Filter top products & services
  ///
  /// Parameters:
  ///
  /// * [List<String>] categoriesIds:
  ///
  /// * [List<String>] occasionsIds:
  ///
  /// * [String] priceFrom:
  ///
  /// * [String] priceTo:
  ///
  /// * [List<String>] ratings:
  ///
  /// * [String] type:
  ///   products or services
  Future<void> filterTopProductsServices({ List<String>? categoriesIds, List<String>? occasionsIds, String? priceFrom, String? priceTo, List<String>? ratings, String? type, }) async {
    final response = await filterTopProductsServicesWithHttpInfo( categoriesIds: categoriesIds, occasionsIds: occasionsIds, priceFrom: priceFrom, priceTo: priceTo, ratings: ratings, type: type, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Filter top sellers
  ///
  /// Filter top sellers
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] categoriesIds:
  ///
  /// * [String] isPromoted:
  ///   0-not_promoted, 1-promoted
  ///
  /// * [List<String>] occasionsIds:
  ///
  /// * [List<String>] ratings:
  Future<Response> filterTopSellersWithHttpInfo({ List<String>? categoriesIds, String? isPromoted, List<String>? occasionsIds, List<String>? ratings, }) async {
    // ignore: prefer_const_declarations
    final path = r'/top-sellers/filter';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (categoriesIds != null) {
      hasFields = true;
      mp.fields[r'categories_ids'] = parameterToString(categoriesIds);
    }
    if (isPromoted != null) {
      hasFields = true;
      mp.fields[r'is_promoted'] = parameterToString(isPromoted);
    }
    if (occasionsIds != null) {
      hasFields = true;
      mp.fields[r'occasions_ids'] = parameterToString(occasionsIds);
    }
    if (ratings != null) {
      hasFields = true;
      mp.fields[r'ratings'] = parameterToString(ratings);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Filter top sellers
  ///
  /// Filter top sellers
  ///
  /// Parameters:
  ///
  /// * [List<String>] categoriesIds:
  ///
  /// * [String] isPromoted:
  ///   0-not_promoted, 1-promoted
  ///
  /// * [List<String>] occasionsIds:
  ///
  /// * [List<String>] ratings:
  Future<void> filterTopSellers({ List<String>? categoriesIds, String? isPromoted, List<String>? occasionsIds, List<String>? ratings, }) async {
    final response = await filterTopSellersWithHttpInfo( categoriesIds: categoriesIds, isPromoted: isPromoted, occasionsIds: occasionsIds, ratings: ratings, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// show all banners
  ///
  /// show all banners
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllBannersWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/banners';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all banners
  ///
  /// show all banners
  Future<BannersResponse?> showAllBanners() async {
    final response = await showAllBannersWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BannersResponse',) as BannersResponse;
    
    }
    return null;
  }

  /// show all categories
  ///
  /// show all categories
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllCategoriesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/categories';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all categories
  ///
  /// show all categories
  Future<CategoriesResponse?> showAllCategories() async {
    final response = await showAllCategoriesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CategoriesResponse',) as CategoriesResponse;
    
    }
    return null;
  }

  /// show all colors
  ///
  /// show all colors
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllColorsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/colors';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all colors
  ///
  /// show all colors
  Future<ColorsResponse?> showAllColors() async {
    final response = await showAllColorsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ColorsResponse',) as ColorsResponse;
    
    }
    return null;
  }

  /// Show all gift boxes
  ///
  /// Retrieve a list of all available gift boxes
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllGiftBoxesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/gift-boxes';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Show all gift boxes
  ///
  /// Retrieve a list of all available gift boxes
  Future<ShowAllGiftBoxes200Response?> showAllGiftBoxes() async {
    final response = await showAllGiftBoxesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowAllGiftBoxes200Response',) as ShowAllGiftBoxes200Response;
    
    }
    return null;
  }

  /// Show all gift cards
  ///
  /// Retrieve a list of all available gift cards
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllGiftCardsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/gift-cards';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Show all gift cards
  ///
  /// Retrieve a list of all available gift cards
  Future<ShowAllGiftCards200Response?> showAllGiftCards() async {
    final response = await showAllGiftCardsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowAllGiftCards200Response',) as ShowAllGiftCards200Response;
    
    }
    return null;
  }

  /// show all occasions
  ///
  /// show all occasions
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllOccasionsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/occasions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all occasions
  ///
  /// show all occasions
  Future<OccasionsResponse?> showAllOccasions() async {
    final response = await showAllOccasionsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OccasionsResponse',) as OccasionsResponse;
    
    }
    return null;
  }

  /// show all products
  ///
  /// show all products
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] providerId:
  Future<Response> showAllProductsWithHttpInfo({ String? providerId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/products/filter';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (providerId != null) {
      queryParams.addAll(_queryParams('', 'provider_id', providerId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all products
  ///
  /// show all products
  ///
  /// Parameters:
  ///
  /// * [String] providerId:
  Future<ProductsListResponse?> showAllProducts({ String? providerId, }) async {
    final response = await showAllProductsWithHttpInfo( providerId: providerId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductsListResponse',) as ProductsListResponse;
    
    }
    return null;
  }

  /// show all services (with filter)
  ///
  /// show all services (with filter)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] providerId:
  ///   optional
  Future<Response> showAllServicesWithFilterWithHttpInfo({ String? providerId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/services/filter';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (providerId != null) {
      queryParams.addAll(_queryParams('', 'provider_id', providerId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all services (with filter)
  ///
  /// show all services (with filter)
  ///
  /// Parameters:
  ///
  /// * [String] providerId:
  ///   optional
  Future<ShowAllServicesWithFilter200Response?> showAllServicesWithFilter({ String? providerId, }) async {
    final response = await showAllServicesWithFilterWithHttpInfo( providerId: providerId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowAllServicesWithFilter200Response',) as ShowAllServicesWithFilter200Response;
    
    }
    return null;
  }

  /// show all sizes
  ///
  /// show all sizes
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showAllSizesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/sizes';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all sizes
  ///
  /// show all sizes
  Future<SizesResponse?> showAllSizes() async {
    final response = await showAllSizesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SizesResponse',) as SizesResponse;
    
    }
    return null;
  }

  /// Show home
  ///
  /// Show home
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showHomeWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/home';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Show home
  ///
  /// Show home
  Future<ShowHome200Response?> showHome() async {
    final response = await showHomeWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowHome200Response',) as ShowHome200Response;
    
    }
    return null;
  }

  /// show product details
  ///
  /// show product details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  Future<Response> showProductDetailsWithHttpInfo({ String? productId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/product/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (productId != null) {
      queryParams.addAll(_queryParams('', 'product_id', productId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show product details
  ///
  /// show product details
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  Future<ProductDetailsResponse?> showProductDetails({ String? productId, }) async {
    final response = await showProductDetailsWithHttpInfo( productId: productId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDetailsResponse',) as ProductDetailsResponse;
    
    }
    return null;
  }

  /// show promocode details
  ///
  /// show promocode details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] promocodeId:
  ///   optional but choose either id or code
  ///
  /// * [String] code:
  ///   optional but choose either id or code
  Future<Response> showPromocodeDetailsWithHttpInfo({ String? promocodeId, String? code, }) async {
    // ignore: prefer_const_declarations
    final path = r'/promocode/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (promocodeId != null) {
      queryParams.addAll(_queryParams('', 'promocode_id', promocodeId));
    }
    if (code != null) {
      queryParams.addAll(_queryParams('', 'code', code));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show promocode details
  ///
  /// show promocode details
  ///
  /// Parameters:
  ///
  /// * [String] promocodeId:
  ///   optional but choose either id or code
  ///
  /// * [String] code:
  ///   optional but choose either id or code
  Future<ShowPromocodeDetails200Response?> showPromocodeDetails({ String? promocodeId, String? code, }) async {
    final response = await showPromocodeDetailsWithHttpInfo( promocodeId: promocodeId, code: code, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowPromocodeDetails200Response',) as ShowPromocodeDetails200Response;
    
    }
    return null;
  }

  /// show service details
  ///
  /// show service details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  Future<Response> showServiceDetailsWithHttpInfo({ String? serviceId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/service/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (serviceId != null) {
      queryParams.addAll(_queryParams('', 'service_id', serviceId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show service details
  ///
  /// show service details
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  Future<ServiceShowResponse?> showServiceDetails({ String? serviceId, }) async {
    final response = await showServiceDetailsWithHttpInfo( serviceId: serviceId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ServiceShowResponse',) as ServiceShowResponse;
    
    }
    return null;
  }

  /// show all tags
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lang:
  Future<Response> tagsGetWithHttpInfo({ String? lang, }) async {
    // ignore: prefer_const_declarations
    final path = r'/tags';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lang != null) {
      headerParams[r'lang'] = parameterToString(lang);
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show all tags
  ///
  /// Parameters:
  ///
  /// * [String] lang:
  Future<TagsResponse?> tagsGet({ String? lang, }) async {
    final response = await tagsGetWithHttpInfo( lang: lang, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TagsResponse',) as TagsResponse;
    
    }
    return null;
  }

  /// upload file(s)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files:
  Future<Response> uploadFilesPostWithHttpInfo({ List<MultipartFile>? files, }) async {
    // ignore: prefer_const_declarations
    final path = r'/upload/files';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (files != null) {
      hasFields = true;
      // mp.fields[r'files'] = files.field;
      mp.files.addAll(files);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// upload file(s)
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files:
  Future<UploadFilesResponse?> uploadFilesPost({ List<MultipartFile>? files, }) async {
    final response = await uploadFilesPostWithHttpInfo( files: files, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UploadFilesResponse',) as UploadFilesResponse;
    
    }
    return null;
  }
}
