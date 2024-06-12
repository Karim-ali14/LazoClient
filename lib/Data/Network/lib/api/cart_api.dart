//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CartApi {
  CartApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add product/service to cart (cart-item)
  ///
  /// Add product/service to cart (cart-item)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  ///   Optional (insert a product or a service)
  ///
  /// * [String] productQuantity:
  ///   Required with product_id
  ///
  /// * [String] productSelectedListIds:
  ///   Optional, but required with product_id if provided
  ///
  /// * [String] productSelectedListItemsIds:
  ///   Optional, but required with product_id if provided
  ///
  /// * [String] serviceId:
  ///   Optional (insert a product or a service)
  ///
  /// * [String] serviceQuantity:
  ///   Required with service_id
  ///
  /// * [String] serviceSelectedListIds:
  ///   Optional, but required with service_id if provided
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///   Optional, but required with service_id if provided
  Future<Response> addProductServiceToCartCartItemWithHttpInfo({ String? productId, String? productQuantity, String? productSelectedListIds, String? productSelectedListItemsIds, String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/cart/create';

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
    if (productQuantity != null) {
      hasFields = true;
      mp.fields[r'product_quantity'] = parameterToString(productQuantity);
    }
    if (productSelectedListIds != null) {
      hasFields = true;
      mp.fields[r'product_selected_list_ids'] = parameterToString(productSelectedListIds);
    }
    if (productSelectedListItemsIds != null) {
      hasFields = true;
      mp.fields[r'product_selected_list_items_ids'] = parameterToString(productSelectedListItemsIds);
    }
    if (serviceId != null) {
      hasFields = true;
      mp.fields[r'service_id'] = parameterToString(serviceId);
    }
    if (serviceQuantity != null) {
      hasFields = true;
      mp.fields[r'service_quantity'] = parameterToString(serviceQuantity);
    }
    if (serviceSelectedListIds != null) {
      hasFields = true;
      mp.fields[r'service_selected_list_ids'] = parameterToString(serviceSelectedListIds);
    }
    if (serviceSelectedListItemsIds != null) {
      hasFields = true;
      mp.fields[r'service_selected_list_items_ids'] = parameterToString(serviceSelectedListItemsIds);
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

  /// Add product/service to cart (cart-item)
  ///
  /// Add product/service to cart (cart-item)
  ///
  /// Parameters:
  ///
  /// * [String] productId:
  ///   Optional (insert a product or a service)
  ///
  /// * [String] productQuantity:
  ///   Required with product_id
  ///
  /// * [String] productSelectedListIds:
  ///   Optional, but required with product_id if provided
  ///
  /// * [String] productSelectedListItemsIds:
  ///   Optional, but required with product_id if provided
  ///
  /// * [String] serviceId:
  ///   Optional (insert a product or a service)
  ///
  /// * [String] serviceQuantity:
  ///   Required with service_id
  ///
  /// * [String] serviceSelectedListIds:
  ///   Optional, but required with service_id if provided
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///   Optional, but required with service_id if provided
  Future<void> addProductServiceToCartCartItem({ String? productId, String? productQuantity, String? productSelectedListIds, String? productSelectedListItemsIds, String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, }) async {
    final response = await addProductServiceToCartCartItemWithHttpInfo( productId: productId, productQuantity: productQuantity, productSelectedListIds: productSelectedListIds, productSelectedListItemsIds: productSelectedListItemsIds, serviceId: serviceId, serviceQuantity: serviceQuantity, serviceSelectedListIds: serviceSelectedListIds, serviceSelectedListItemsIds: serviceSelectedListItemsIds, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete cart item
  ///
  /// Delete cart item
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cartItemId:
  Future<Response> deleteCartItemWithHttpInfo({ String? cartItemId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/cart-item/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (cartItemId != null) {
      hasFields = true;
      mp.fields[r'cart_item_id'] = parameterToString(cartItemId);
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

  /// Delete cart item
  ///
  /// Delete cart item
  ///
  /// Parameters:
  ///
  /// * [String] cartItemId:
  Future<void> deleteCartItem({ String? cartItemId, }) async {
    final response = await deleteCartItemWithHttpInfo( cartItemId: cartItemId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Reset cart for client
  ///
  /// Reset cart for client
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> resetCartForClientWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/cart/delete';

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

  /// Reset cart for client
  ///
  /// Reset cart for client
  Future<void> resetCartForClient() async {
    final response = await resetCartForClientWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// show cart details
  ///
  /// show cart details
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showCartDetailsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/cart/show';

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

  /// show cart details
  ///
  /// show cart details
  Future<ShowCartDetails200Response?> showCartDetails() async {
    final response = await showCartDetailsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowCartDetails200Response',) as ShowCartDetails200Response;
    
    }
    return null;
  }

  /// Update cart item quantity
  ///
  /// Update cart item quantity
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cartItemId:
  ///
  /// * [String] quantity:
  Future<Response> updateCartItemQuantityWithHttpInfo({ String? cartItemId, String? quantity, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/cart/update';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (cartItemId != null) {
      hasFields = true;
      mp.fields[r'cart_item_id'] = parameterToString(cartItemId);
    }
    if (quantity != null) {
      hasFields = true;
      mp.fields[r'quantity'] = parameterToString(quantity);
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

  /// Update cart item quantity
  ///
  /// Update cart item quantity
  ///
  /// Parameters:
  ///
  /// * [String] cartItemId:
  ///
  /// * [String] quantity:
  Future<void> updateCartItemQuantity({ String? cartItemId, String? quantity, }) async {
    final response = await updateCartItemQuantityWithHttpInfo( cartItemId: cartItemId, quantity: quantity, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
