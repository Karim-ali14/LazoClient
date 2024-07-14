//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WishlistApi {
  WishlistApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Show wishlist items (with search by name)
  ///
  /// Show wishlist items (with search by name)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] searchByNameEn:
  ///
  /// * [String] searchByNameAr:
  Future<Response> showWishlistItemsWithSearchByNameWithHttpInfo({ String? searchByNameEn, String? searchByNameAr, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (searchByNameEn != null) {
      queryParams.addAll(_queryParams('', 'search_by_name_en', searchByNameEn));
    }
    if (searchByNameAr != null) {
      queryParams.addAll(_queryParams('', 'search_by_name_ar', searchByNameAr));
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

  /// Show wishlist items (with search by name)
  ///
  /// Show wishlist items (with search by name)
  ///
  /// Parameters:
  ///
  /// * [String] searchByNameEn:
  ///
  /// * [String] searchByNameAr:
  Future<ShowWishlistItemsWithSearchByName200Response?> showWishlistItemsWithSearchByName({ String? searchByNameEn, String? searchByNameAr, }) async {
    final response = await showWishlistItemsWithSearchByNameWithHttpInfo( searchByNameEn: searchByNameEn, searchByNameAr: searchByNameAr, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowWishlistItemsWithSearchByName200Response',) as ShowWishlistItemsWithSearchByName200Response;
    
    }
    return null;
  }

  /// Toggle product/service in wishlist
  ///
  /// Toggle product/service in wishlist
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  ///   Select product or service
  ///
  /// * [String] serviceId:
  ///   Select product or service
  Future<Response> toggleProductServiceInWishlistWithHttpInfo({ String? productId, String? serviceId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/toggle';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (productId != null) {
      hasFields = true;
      mp.fields[r'product_id'] = parameterToString(productId);
    }
    if (serviceId != null) {
      hasFields = true;
      mp.fields[r'service_id'] = parameterToString(serviceId);
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

  /// Toggle product/service in wishlist
  ///
  /// Toggle product/service in wishlist
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  ///   Select product or service
  ///
  /// * [String] serviceId:
  ///   Select product or service
  Future<ToggleProductServiceInWishlist200Response?> toggleProductServiceInWishlist({ String? productId, String? serviceId, }) async {
    final response = await toggleProductServiceInWishlistWithHttpInfo( productId: productId, serviceId: serviceId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ToggleProductServiceInWishlist200Response',) as ToggleProductServiceInWishlist200Response;
    
    }
    return null;
  }
}
