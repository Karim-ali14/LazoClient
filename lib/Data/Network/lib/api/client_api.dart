//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClientApi {
  ClientApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

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

  /// Assign chat notification to a provider
  ///
  /// Assign chat notification to a provider
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] chatroomId:
  ///
  /// * [String] notificationMessage:
  ///
  /// * [String] providerId:
  Future<Response> assignChatNotificationToAProviderWithHttpInfo({ String? chatroomId, String? notificationMessage, String? providerId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/chat/notification/assign';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (chatroomId != null) {
      hasFields = true;
      mp.fields[r'chatroom_id'] = parameterToString(chatroomId);
    }
    if (notificationMessage != null) {
      hasFields = true;
      mp.fields[r'notification_message'] = parameterToString(notificationMessage);
    }
    if (providerId != null) {
      hasFields = true;
      mp.fields[r'provider_id'] = parameterToString(providerId);
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

  /// Assign chat notification to a provider
  ///
  /// Assign chat notification to a provider
  ///
  /// Parameters:
  ///
  /// * [String] chatroomId:
  ///
  /// * [String] notificationMessage:
  ///
  /// * [String] providerId:
  Future<void> assignChatNotificationToAProvider({ String? chatroomId, String? notificationMessage, String? providerId, }) async {
    final response = await assignChatNotificationToAProviderWithHttpInfo( chatroomId: chatroomId, notificationMessage: notificationMessage, providerId: providerId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// client\\'s account deleted successfully
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> clientAccountDeleteGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/account-delete';

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

  /// client\\'s account deleted successfully
  Future<void> clientAccountDeleteGet() async {
    final response = await clientAccountDeleteGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// client logout
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> clientLogoutGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/logout';

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

  /// client logout
  Future<void> clientLogoutGet() async {
    final response = await clientLogoutGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

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
  /// * [List<String>] comments:
  ///
  /// * [List<String>] orderItemsIds:
  ///
  /// * [List<String>] ratings:
  Future<Response> rateOrderWithHttpInfo({ List<String>? comments, List<String>? orderItemsIds, List<String>? ratings, }) async {
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
    if (comments != null) {
      hasFields = true;
      mp.fields[r'comments'] = parameterToString(comments);
    }
    if (orderItemsIds != null) {
      hasFields = true;
      mp.fields[r'order_items_ids'] = parameterToString(orderItemsIds);
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

  /// Rate order
  ///
  /// Rate order
  ///
  /// Parameters:
  ///
  /// * [List<String>] comments:
  ///
  /// * [List<String>] orderItemsIds:
  ///
  /// * [List<String>] ratings:
  Future<ClientOrderDetails?> rateOrder({ List<String>? comments, List<String>? orderItemsIds, List<String>? ratings, }) async {
    final response = await rateOrderWithHttpInfo( comments: comments, orderItemsIds: orderItemsIds, ratings: ratings, );
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

  /// read a notification
  ///
  /// read a notification
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] notificationId:
  Future<Response> readANotification122WithHttpInfo({ String? notificationId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/notification/read';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (notificationId != null) {
      hasFields = true;
      mp.fields[r'notification_id'] = parameterToString(notificationId);
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

  /// read a notification
  ///
  /// read a notification
  ///
  /// Parameters:
  ///
  /// * [String] notificationId:
  Future<ReadANotification122200Response?> readANotification122({ String? notificationId, }) async {
    final response = await readANotification122WithHttpInfo( notificationId: notificationId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ReadANotification122200Response',) as ReadANotification122200Response;
    
    }
    return null;
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

  /// show notifications
  ///
  /// show notifications
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] unreadOnly:
  ///   optional | used when show only unread, otherwise show all takes 0 or 1
  Future<Response> showNotifications2WithHttpInfo({ String? unreadOnly, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/notifications';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (unreadOnly != null) {
      queryParams.addAll(_queryParams('', 'unread_only', unreadOnly));
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

  /// show notifications
  ///
  /// show notifications
  ///
  /// Parameters:
  ///
  /// * [String] unreadOnly:
  ///   optional | used when show only unread, otherwise show all takes 0 or 1
  Future<ShowNotifications2200Response?> showNotifications2({ String? unreadOnly, }) async {
    final response = await showNotifications2WithHttpInfo( unreadOnly: unreadOnly, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowNotifications2200Response',) as ShowNotifications2200Response;
    
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

  /// show profile
  ///
  /// show profile
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> showProfileWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/client/profile/show';

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

  /// show profile
  ///
  /// show profile
  Future<ShowProfile200Response?> showProfile() async {
    final response = await showProfileWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowProfile200Response',) as ShowProfile200Response;
    
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

  /// update fcm_token and device_type
  ///
  /// update fcm_token and device_type
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] deviceType:
  ///   android|ios
  ///
  /// * [String] fcmToken:
  Future<Response> updateFcmTokenAndDeviceType2WithHttpInfo({ String? deviceType, String? fcmToken, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/update/device-data';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (deviceType != null) {
      hasFields = true;
      mp.fields[r'device_type'] = parameterToString(deviceType);
    }
    if (fcmToken != null) {
      hasFields = true;
      mp.fields[r'fcm_token'] = parameterToString(fcmToken);
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

  /// update fcm_token and device_type
  ///
  /// update fcm_token and device_type
  ///
  /// Parameters:
  ///
  /// * [String] deviceType:
  ///   android|ios
  ///
  /// * [String] fcmToken:
  Future<void> updateFcmTokenAndDeviceType2({ String? deviceType, String? fcmToken, }) async {
    final response = await updateFcmTokenAndDeviceType2WithHttpInfo( deviceType: deviceType, fcmToken: fcmToken, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// update profile
  ///
  /// update profile
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cityId:
  ///
  /// * [String] email:
  ///
  /// * [String] image:
  ///
  /// * [String] name:
  ///
  /// * [String] phone:
  ///   need verification before updating this field here
  Future<Response> updateProfileWithHttpInfo({ String? cityId, String? email, String? image, String? name, String? phone, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/profile/update';

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

  /// update profile
  ///
  /// update profile
  ///
  /// Parameters:
  ///
  /// * [String] cityId:
  ///
  /// * [String] email:
  ///
  /// * [String] image:
  ///
  /// * [String] name:
  ///
  /// * [String] phone:
  ///   need verification before updating this field here
  Future<UpdateProfile200Response?> updateProfile({ String? cityId, String? email, String? image, String? name, String? phone, }) async {
    final response = await updateProfileWithHttpInfo( cityId: cityId, email: email, image: image, name: name, phone: phone, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateProfile200Response',) as UpdateProfile200Response;
    
    }
    return null;
  }
}
