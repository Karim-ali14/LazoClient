//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OrdersApi {
  OrdersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create order
  ///
  /// Create order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] deliveryDate:
  ///   Format: eg: 13 Nov 2024
  ///
  /// * [String] deliveryTime:
  ///   Format: eg: 06:00 PM
  ///
  /// * [String] giftBoxId:
  ///   Optional
  ///
  /// * [String] giftCardId:
  ///   Optional
  ///
  /// * [String] isIdentitySecret:
  ///   0-visible, 1-hidden
  ///
  /// * [String] orderType:
  ///   self_order or receiver_order
  ///
  /// * [String] paymentMethod:
  ///   eg: visa, mada, applepay
  ///
  /// * [String] promocode:
  ///   Optional
  ///
  /// * [String] receiverAddress:
  ///   Required in case of self_order (address of client itself)
  ///
  /// * [String] receiverAddressDetails:
  ///
  /// * [String] receiverPhone:
  Future<Response> createOrderWithHttpInfo({ String? deliveryDate, String? deliveryTime, String? giftBoxId, String? giftCardId, String? isIdentitySecret, String? orderType, String? paymentMethod, String? promocode, String? receiverAddress, String? receiverAddressDetails, String? receiverPhone, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/order/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (deliveryDate != null) {
      hasFields = true;
      mp.fields[r'delivery_date'] = parameterToString(deliveryDate);
    }
    if (deliveryTime != null) {
      hasFields = true;
      mp.fields[r'delivery_time'] = parameterToString(deliveryTime);
    }
    if (giftBoxId != null) {
      hasFields = true;
      mp.fields[r'gift_box_id'] = parameterToString(giftBoxId);
    }
    if (giftCardId != null) {
      hasFields = true;
      mp.fields[r'gift_card_id'] = parameterToString(giftCardId);
    }
    if (isIdentitySecret != null) {
      hasFields = true;
      mp.fields[r'is_identity_secret'] = parameterToString(isIdentitySecret);
    }
    if (orderType != null) {
      hasFields = true;
      mp.fields[r'order_type'] = parameterToString(orderType);
    }
    if (paymentMethod != null) {
      hasFields = true;
      mp.fields[r'payment_method'] = parameterToString(paymentMethod);
    }
    if (promocode != null) {
      hasFields = true;
      mp.fields[r'promocode'] = parameterToString(promocode);
    }
    if (receiverAddress != null) {
      hasFields = true;
      mp.fields[r'receiver_address'] = parameterToString(receiverAddress);
    }
    if (receiverAddressDetails != null) {
      hasFields = true;
      mp.fields[r'receiver_address_details'] = parameterToString(receiverAddressDetails);
    }
    if (receiverPhone != null) {
      hasFields = true;
      mp.fields[r'receiver_phone'] = parameterToString(receiverPhone);
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

  /// Create order
  ///
  /// Create order
  ///
  /// Parameters:
  ///
  /// * [String] deliveryDate:
  ///   Format: eg: 13 Nov 2024
  ///
  /// * [String] deliveryTime:
  ///   Format: eg: 06:00 PM
  ///
  /// * [String] giftBoxId:
  ///   Optional
  ///
  /// * [String] giftCardId:
  ///   Optional
  ///
  /// * [String] isIdentitySecret:
  ///   0-visible, 1-hidden
  ///
  /// * [String] orderType:
  ///   self_order or receiver_order
  ///
  /// * [String] paymentMethod:
  ///   eg: visa, mada, applepay
  ///
  /// * [String] promocode:
  ///   Optional
  ///
  /// * [String] receiverAddress:
  ///   Required in case of self_order (address of client itself)
  ///
  /// * [String] receiverAddressDetails:
  ///
  /// * [String] receiverPhone:
  Future<ClientOrderDetails?> createOrder({ String? deliveryDate, String? deliveryTime, String? giftBoxId, String? giftCardId, String? isIdentitySecret, String? orderType, String? paymentMethod, String? promocode, String? receiverAddress, String? receiverAddressDetails, String? receiverPhone, }) async {
    final response = await createOrderWithHttpInfo( deliveryDate: deliveryDate, deliveryTime: deliveryTime, giftBoxId: giftBoxId, giftCardId: giftCardId, isIdentitySecret: isIdentitySecret, orderType: orderType, paymentMethod: paymentMethod, promocode: promocode, receiverAddress: receiverAddress, receiverAddressDetails: receiverAddressDetails, receiverPhone: receiverPhone, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientOrderDetails',) as ClientOrderDetails;
    
    }
    return null;
  }

  /// Manage order
  ///
  /// Manage order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  ///
  /// * [String] statusId:
  ///   12-client_cancel_order, 13-client_continue_order_without_an_item_after_provider_rejects
  Future<Response> manageOrderWithHttpInfo({ String? orderId, String? statusId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/order/manage';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
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

  /// Manage order
  ///
  /// Manage order
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  ///
  /// * [String] statusId:
  ///   12-client_cancel_order, 13-client_continue_order_without_an_item_after_provider_rejects
  Future<ClientOrderDetailsResponse?> manageOrder({ String? orderId, String? statusId, }) async {
    final response = await manageOrderWithHttpInfo( orderId: orderId, statusId: statusId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientOrderDetailsResponse',) as ClientOrderDetailsResponse;
    
    }
    return null;
  }

  /// Rate order
  ///
  /// Rate order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] comment:
  ///
  /// * [String] orderId:
  ///
  /// * [String] rating:
  ///   From 1 to 5
  Future<Response> rateOrderWithHttpInfo({ String? comment, String? orderId, String? rating, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/order/rating';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (comment != null) {
      hasFields = true;
      mp.fields[r'comment'] = parameterToString(comment);
    }
    if (orderId != null) {
      hasFields = true;
      mp.fields[r'order_id'] = parameterToString(orderId);
    }
    if (rating != null) {
      hasFields = true;
      mp.fields[r'rating'] = parameterToString(rating);
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

  /// Rate order
  ///
  /// Rate order
  ///
  /// Parameters:
  ///
  /// * [String] comment:
  ///
  /// * [String] orderId:
  ///
  /// * [String] rating:
  ///   From 1 to 5
  Future<ClientOrderDetails?> rateOrder({ String? comment, String? orderId, String? rating, }) async {
    final response = await rateOrderWithHttpInfo( comment: comment, orderId: orderId, rating: rating, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientOrderDetails',) as ClientOrderDetails;
    
    }
    return null;
  }

  /// Show order details
  ///
  /// Show order details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  Future<Response> showOrderDetailsWithHttpInfo({ String? orderId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/order/show';

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

  /// Show order details
  ///
  /// Show order details
  ///
  /// Parameters:
  ///
  /// * [String] orderId:
  Future<ClientOrderDetailsResponse?> showOrderDetails({ String? orderId, }) async {
    final response = await showOrderDetailsWithHttpInfo( orderId: orderId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClientOrderDetailsResponse',) as ClientOrderDetailsResponse;
    
    }
    return null;
  }

  /// Show orders
  ///
  /// Show orders
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showOrdersWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/orders';

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

  /// Show orders
  ///
  /// Show orders
  Future<ShowOrders200Response?> showOrders() async {
    final response = await showOrdersWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowOrders200Response',) as ShowOrders200Response;
    
    }
    return null;
  }
}
