//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class Orders12Api {
  Orders12Api([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// manage orders
  ///
  /// manage orders
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cancellationReason:
  ///   required when status_id = 10 or 11
  ///
  /// * [String] orderId:
  ///
  /// * [String] statusId:
  ///   2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order
  Future<Response> manageOrders1WithHttpInfo({ String? cancellationReason, String? orderId, String? statusId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/order/manage';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (cancellationReason != null) {
      hasFields = true;
      mp.fields[r'cancellation_reason'] = parameterToString(cancellationReason);
    }
    if (orderId != null) {
      hasFields = true;
      mp.fields[r'order_id'] = parameterToString(orderId);
    }
    if (statusId != null) {
      hasFields = true;
      mp.fields[r'status_id'] = parameterToString(statusId);
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

  /// manage orders
  ///
  /// manage orders
  ///
  /// Parameters:
  ///
  /// * [String] cancellationReason:
  ///   required when status_id = 10 or 11
  ///
  /// * [String] orderId:
  ///
  /// * [String] statusId:
  ///   2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order
  Future<ManageOrders1200Response?> manageOrders1({ String? cancellationReason, String? orderId, String? statusId, }) async {
    final response = await manageOrders1WithHttpInfo( cancellationReason: cancellationReason, orderId: orderId, statusId: statusId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ManageOrders1200Response',) as ManageOrders1200Response;
    
    }
    return null;
  }

  /// show all provider's orders
  ///
  /// show all provider's orders
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [num] page:
  Future<Response> showAllProviderSOrdersWithHttpInfo({ String? status, num? page, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/orders';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
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

  /// show all provider's orders
  ///
  /// show all provider's orders
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [num] page:
  Future<ShowAllProviderSOrders200Response?> showAllProviderSOrders({ String? status, num? page, }) async {
    final response = await showAllProviderSOrdersWithHttpInfo( status: status, page: page, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowAllProviderSOrders200Response',) as ShowAllProviderSOrders200Response;
    
    }
    return null;
  }

  /// show order details
  ///
  /// show order details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  Future<Response> showOrderDetails2WithHttpInfo({ String? orderId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/order/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (orderId != null) {
      queryParams.addAll(_queryParams('', 'order_id', orderId));
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

  /// show order details
  ///
  /// show order details
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  Future<ShowOrderDetails2200Response?> showOrderDetails2({ String? orderId, }) async {
    final response = await showOrderDetails2WithHttpInfo( orderId: orderId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowOrderDetails2200Response',) as ShowOrderDetails2200Response;
    
    }
    return null;
  }
}
