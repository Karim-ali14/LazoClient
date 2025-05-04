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

  /// delete collection wishlist
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  Future<Response> clientWishlistCollectionDeleteDeleteWithHttpInfo({ String? collectionId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/collection/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (collectionId != null) {
      queryParams.addAll(_queryParams('', 'collection_id', collectionId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// delete collection wishlist
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  Future<void> clientWishlistCollectionDeleteDelete({ String? collectionId, }) async {
    final response = await clientWishlistCollectionDeleteDeleteWithHttpInfo( collectionId: collectionId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// reset collection wishlist
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  Future<Response> clientWishlistCollectionResetGetWithHttpInfo({ String? collectionId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/collection/reset';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (collectionId != null) {
      queryParams.addAll(_queryParams('', 'collection_id', collectionId));
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

  /// reset collection wishlist
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  Future<void> clientWishlistCollectionResetGet({ String? collectionId, }) async {
    final response = await clientWishlistCollectionResetGetWithHttpInfo( collectionId: collectionId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// create wishlist collection
  ///
  /// create wishlist collection
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] name:
  Future<Response> createWishlistCollectionWithHttpInfo({ String? name, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/collection/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (name != null) {
      hasFields = true;
      mp.fields[r'name'] = parameterToString(name);
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

  /// create wishlist collection
  ///
  /// create wishlist collection
  ///
  /// Parameters:
  ///
  /// * [String] name:
  Future<CreateWishlistCollection200Response?> createWishlistCollection({ String? name, }) async {
    final response = await createWishlistCollectionWithHttpInfo( name: name, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateWishlistCollection200Response',) as CreateWishlistCollection200Response;
    
    }
    return null;
  }

  /// Show wishlist collections
  ///
  /// Show wishlist collections
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showWishlistCollectionsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/collections';

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

  /// Show wishlist collections
  ///
  /// Show wishlist collections
  Future<ShowWishlistCollections200Response?> showWishlistCollections() async {
    final response = await showWishlistCollectionsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowWishlistCollections200Response',) as ShowWishlistCollections200Response;
    
    }
    return null;
  }

  /// Show wishlist items (with search by name)
  ///
  /// Show wishlist items (with search by name)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] searchByName:
  ///
  /// * [String] type:
  ///
  /// * [String] collectionId:
  ///
  /// * [String] shipmentType:
  Future<Response> showWishlistItemsWithSearchByNameWithHttpInfo({ String? searchByName, String? type, String? collectionId, String? shipmentType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (searchByName != null) {
      queryParams.addAll(_queryParams('', 'search_by_name', searchByName));
    }
    if (type != null) {
      queryParams.addAll(_queryParams('', 'type', type));
    }
    if (collectionId != null) {
      queryParams.addAll(_queryParams('', 'collection_id', collectionId));
    }
    if (shipmentType != null) {
      queryParams.addAll(_queryParams('', 'shipment_type', shipmentType));
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
  /// * [String] searchByName:
  ///
  /// * [String] type:
  ///
  /// * [String] collectionId:
  ///
  /// * [String] shipmentType:
  Future<ShowWishlistItemsWithSearchByName200Response?> showWishlistItemsWithSearchByName({ String? searchByName, String? type, String? collectionId, String? shipmentType, }) async {
    final response = await showWishlistItemsWithSearchByNameWithHttpInfo( searchByName: searchByName, type: type, collectionId: collectionId, shipmentType: shipmentType, );
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
  ///
  /// * [String] collectionId:
  Future<Response> toggleProductServiceInWishlistWithHttpInfo({ String? productId, String? serviceId, String? collectionId, }) async {
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
    if (collectionId != null) {
      hasFields = true;
      mp.fields[r'collection_id'] = parameterToString(collectionId);
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
  ///
  /// * [String] collectionId:
  Future<ToggleProductServiceInWishlist200Response?> toggleProductServiceInWishlist({ String? productId, String? serviceId, String? collectionId, }) async {
    final response = await toggleProductServiceInWishlistWithHttpInfo( productId: productId, serviceId: serviceId, collectionId: collectionId, );
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

  /// update wishlist collection
  ///
  /// update wishlist collection
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  ///
  /// * [String] name:
  Future<Response> updateWishlistCollectionWithHttpInfo({ String? collectionId, String? name, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/wishlist/collection/update';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (collectionId != null) {
      hasFields = true;
      mp.fields[r'collection_id'] = parameterToString(collectionId);
    }
    if (name != null) {
      hasFields = true;
      mp.fields[r'name'] = parameterToString(name);
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

  /// update wishlist collection
  ///
  /// update wishlist collection
  ///
  /// Parameters:
  ///
  /// * [String] collectionId:
  ///
  /// * [String] name:
  Future<CreateWishlistCollection200Response?> updateWishlistCollection({ String? collectionId, String? name, }) async {
    final response = await updateWishlistCollectionWithHttpInfo( collectionId: collectionId, name: name, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateWishlistCollection200Response',) as CreateWishlistCollection200Response;
    
    }
    return null;
  }
}
