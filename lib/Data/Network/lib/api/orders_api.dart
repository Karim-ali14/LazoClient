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

  /// calculate an instant order
  ///
  /// calculate an instant order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  ///
  /// * [String] serviceQuantity:
  ///
  /// * [String] serviceSelectedListIds:
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///
  /// * [String] promocode:
  Future<Response> calculateInstantOrderWithHttpInfo({ String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, String? promocode, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/instant-order/calculate';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
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
    if (promocode != null) {
      hasFields = true;
      mp.fields[r'promocode'] = parameterToString(promocode);
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

  /// calculate an instant order
  ///
  /// calculate an instant order
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  ///
  /// * [String] serviceQuantity:
  ///
  /// * [String] serviceSelectedListIds:
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///
  /// * [String] promocode:
  Future<ClientOrderDetailsResponse?> calculateInstantOrder({ String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, String? promocode, }) async {
    final response = await calculateInstantOrderWithHttpInfo( serviceId: serviceId, serviceQuantity: serviceQuantity, serviceSelectedListIds: serviceSelectedListIds, serviceSelectedListItemsIds: serviceSelectedListItemsIds, promocode: promocode, );
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

  /// create an instant order
  ///
  /// create an instant order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  ///
  /// * [String] serviceQuantity:
  ///
  /// * [String] serviceSelectedListIds:
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///
  /// * [String] paymentMethod:
  ///
  /// * [String] promocode:
  ///
  /// * [String] receiverName:
  ///
  /// * [String] receiverPhoneNumber:
  ///
  /// * [String] cardMessage:
  ///
  /// * [String] cardFrom:
  ///
  /// * [String] cardTo:
  ///
  /// * [String] deliveryDate:
  ///
  /// * [String] deliveryTime:
  Future<Response> creatInstantOrderWithHttpInfo({ String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, String? paymentMethod, String? promocode, String? receiverName, String? receiverPhoneNumber, String? cardMessage, String? cardFrom, String? cardTo, String? deliveryDate, String? deliveryTime, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/instant-order/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
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
    if (paymentMethod != null) {
      hasFields = true;
      mp.fields[r'payment_method'] = parameterToString(paymentMethod);
    }
    if (promocode != null) {
      hasFields = true;
      mp.fields[r'promocode'] = parameterToString(promocode);
    }
    if (receiverName != null) {
      hasFields = true;
      mp.fields[r'receiver_name'] = parameterToString(receiverName);
    }
    if (receiverPhoneNumber != null) {
      hasFields = true;
      mp.fields[r'receiver_phone_number'] = parameterToString(receiverPhoneNumber);
    }
    if (cardMessage != null) {
      hasFields = true;
      mp.fields[r'card_message'] = parameterToString(cardMessage);
    }
    if (cardFrom != null) {
      hasFields = true;
      mp.fields[r'card_from'] = parameterToString(cardFrom);
    }
    if (cardTo != null) {
      hasFields = true;
      mp.fields[r'card_to'] = parameterToString(cardTo);
    }
    if (deliveryDate != null) {
      hasFields = true;
      mp.fields[r'delivery_date'] = parameterToString(deliveryDate);
    }
    if (deliveryTime != null) {
      hasFields = true;
      mp.fields[r'delivery_time'] = parameterToString(deliveryTime);
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

  /// create an instant order
  ///
  /// create an instant order
  ///
  /// Parameters:
  ///
  /// * [String] serviceId:
  ///
  /// * [String] serviceQuantity:
  ///
  /// * [String] serviceSelectedListIds:
  ///
  /// * [String] serviceSelectedListItemsIds:
  ///
  /// * [String] paymentMethod:
  ///
  /// * [String] promocode:
  ///
  /// * [String] receiverName:
  ///
  /// * [String] receiverPhoneNumber:
  ///
  /// * [String] cardMessage:
  ///
  /// * [String] cardFrom:
  ///
  /// * [String] cardTo:
  ///
  /// * [String] deliveryDate:
  ///
  /// * [String] deliveryTime:
  Future<ClientOrderDetailsResponse?> creatInstantOrder({ String? serviceId, String? serviceQuantity, String? serviceSelectedListIds, String? serviceSelectedListItemsIds, String? paymentMethod, String? promocode, String? receiverName, String? receiverPhoneNumber, String? cardMessage, String? cardFrom, String? cardTo, String? deliveryDate, String? deliveryTime, }) async {
    final response = await creatInstantOrderWithHttpInfo( serviceId: serviceId, serviceQuantity: serviceQuantity, serviceSelectedListIds: serviceSelectedListIds, serviceSelectedListItemsIds: serviceSelectedListItemsIds, paymentMethod: paymentMethod, promocode: promocode, receiverName: receiverName, receiverPhoneNumber: receiverPhoneNumber, cardMessage: cardMessage, cardFrom: cardFrom, cardTo: cardTo, deliveryDate: deliveryDate, deliveryTime: deliveryTime, );
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

  /// Create order
  ///
  /// Create order
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cityId:
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
  /// * [String] latLng:
  ///
  /// * [String] receiverName:
  ///
  /// * [String] receiverAddressDetails:
  ///
  /// * [String] receiverPhone:
  ///
  /// * [bool] saveAddress:
  Future<Response> createOrderWithHttpInfo({ String? cityId, String? deliveryDate, String? deliveryTime, String? giftBoxId, String? giftCardId, String? isIdentitySecret, String? orderType, String? paymentMethod, String? promocode, String? receiverAddress, String? latLng, String? receiverName, String? receiverAddressDetails, String? receiverPhone, bool? saveAddress, }) async {
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
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
    }
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
    if (latLng != null) {
      hasFields = true;
      mp.fields[r'lat_lng'] = parameterToString(latLng);
    }
    if (receiverName != null) {
      hasFields = true;
      mp.fields[r'receiver_name'] = parameterToString(receiverName);
    }
    if (receiverAddressDetails != null) {
      hasFields = true;
      mp.fields[r'receiver_address_details'] = parameterToString(receiverAddressDetails);
    }
    if (receiverPhone != null) {
      hasFields = true;
      mp.fields[r'receiver_phone'] = parameterToString(receiverPhone);
    }
    if (saveAddress != null) {
      hasFields = true;
      mp.fields[r'save_address'] = parameterToString(saveAddress);
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
  /// * [String] cityId:
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
  /// * [String] latLng:
  ///
  /// * [String] receiverName:
  ///
  /// * [String] receiverAddressDetails:
  ///
  /// * [String] receiverPhone:
  ///
  /// * [bool] saveAddress:
  Future<ClientOrderDetailsResponse?> createOrder({ String? cityId, String? deliveryDate, String? deliveryTime, String? giftBoxId, String? giftCardId, String? isIdentitySecret, String? orderType, String? paymentMethod, String? promocode, String? receiverAddress, String? latLng, String? receiverName, String? receiverAddressDetails, String? receiverPhone, bool? saveAddress, }) async {
    final response = await createOrderWithHttpInfo( cityId: cityId, deliveryDate: deliveryDate, deliveryTime: deliveryTime, giftBoxId: giftBoxId, giftCardId: giftCardId, isIdentitySecret: isIdentitySecret, orderType: orderType, paymentMethod: paymentMethod, promocode: promocode, receiverAddress: receiverAddress, latLng: latLng, receiverName: receiverName, receiverAddressDetails: receiverAddressDetails, receiverPhone: receiverPhone, saveAddress: saveAddress, );
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
  /// * [RateOrderRequest] rateOrderRequest:
  Future<Response> rateOrderWithHttpInfo({ RateOrderRequest? rateOrderRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/order/rating';

    // ignore: prefer_final_locals
    Object? postBody = rateOrderRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [RateOrderRequest] rateOrderRequest:
  Future<ClientOrderDetailsResponse?> rateOrder({ RateOrderRequest? rateOrderRequest, }) async {
    final response = await rateOrderWithHttpInfo( rateOrderRequest: rateOrderRequest, );
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
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [num] page:
  Future<Response> showOrdersWithHttpInfo({ String? status, num? page, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/orders';

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

  /// Show orders
  ///
  /// Show orders
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [num] page:
  Future<ShowOrders200Response?> showOrders({ String? status, num? page, }) async {
    final response = await showOrdersWithHttpInfo( status: status, page: page, );
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
