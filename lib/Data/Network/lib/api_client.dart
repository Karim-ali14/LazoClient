//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'http://localhost', this.authentication,});

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PATCH': return await _client.patch(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(uri, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(uri, headers: nullableHeaderParams,);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String json, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(json, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String json, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? json
      : _deserialize(jsonDecode(json), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  static dynamic _deserialize(dynamic value, String targetType, {bool growable = false}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'Banner':
          return Banner.fromJson(value);
        case 'BannersResponse':
          return BannersResponse.fromJson(value);
        case 'CategoriesResponse':
          return CategoriesResponse.fromJson(value);
        case 'Category':
          return Category.fromJson(value);
        case 'CategoryMenu':
          return CategoryMenu.fromJson(value);
        case 'CitiesResponse':
          return CitiesResponse.fromJson(value);
        case 'City':
          return City.fromJson(value);
        case 'ClientAuthResponse':
          return ClientAuthResponse.fromJson(value);
        case 'ClientAuthResponseData':
          return ClientAuthResponseData.fromJson(value);
        case 'CodeConfirmRequest':
          return CodeConfirmRequest.fromJson(value);
        case 'CodeConfirmResponse':
          return CodeConfirmResponse.fromJson(value);
        case 'CodeSendRequest':
          return CodeSendRequest.fromJson(value);
        case 'CodeSendResponse':
          return CodeSendResponse.fromJson(value);
        case 'Color':
          return Color.fromJson(value);
        case 'ColorsResponse':
          return ColorsResponse.fromJson(value);
        case 'GiftBox':
          return GiftBox.fromJson(value);
        case 'GiftCard':
          return GiftCard.fromJson(value);
        case 'ImageItem':
          return ImageItem.fromJson(value);
        case 'ManageOrders1200Response':
          return ManageOrders1200Response.fromJson(value);
        case 'ManageOrders1200ResponseData':
          return ManageOrders1200ResponseData.fromJson(value);
        case 'ManageOrders1200ResponseDataOrderItemsInner':
          return ManageOrders1200ResponseDataOrderItemsInner.fromJson(value);
        case 'ManageOrders1200ResponseDataOrderItemsInnerProduct':
          return ManageOrders1200ResponseDataOrderItemsInnerProduct.fromJson(value);
        case 'ManageOrders1200ResponseDataOrderItemsInnerProductListsInner':
          return ManageOrders1200ResponseDataOrderItemsInnerProductListsInner.fromJson(value);
        case 'ManageOrders1200ResponseDataOrderItemsInnerProductListsInnerItemsInner':
          return ManageOrders1200ResponseDataOrderItemsInnerProductListsInnerItemsInner.fromJson(value);
        case 'Occasion':
          return Occasion.fromJson(value);
        case 'OccasionsResponse':
          return OccasionsResponse.fromJson(value);
        case 'ProductDetails':
          return ProductDetails.fromJson(value);
        case 'ProductDetailsResponse':
          return ProductDetailsResponse.fromJson(value);
        case 'ProductListItem':
          return ProductListItem.fromJson(value);
        case 'ProductListItemDetail':
          return ProductListItemDetail.fromJson(value);
        case 'ProductsListResponse':
          return ProductsListResponse.fromJson(value);
        case 'ProductsListResponseData':
          return ProductsListResponseData.fromJson(value);
        case 'PromocodeDetails':
          return PromocodeDetails.fromJson(value);
        case 'ProviderCategoryMenuResponse':
          return ProviderCategoryMenuResponse.fromJson(value);
        case 'ProviderData':
          return ProviderData.fromJson(value);
        case 'ProviderDataCity':
          return ProviderDataCity.fromJson(value);
        case 'ProviderDataLocationsInner':
          return ProviderDataLocationsInner.fromJson(value);
        case 'ProviderDataTagsInner':
          return ProviderDataTagsInner.fromJson(value);
        case 'ProviderLocation':
          return ProviderLocation.fromJson(value);
        case 'ProviderLoginResponse':
          return ProviderLoginResponse.fromJson(value);
        case 'ProviderLoginResponseData':
          return ProviderLoginResponseData.fromJson(value);
        case 'ProviderProduct':
          return ProviderProduct.fromJson(value);
        case 'ProviderProfileShowResponse':
          return ProviderProfileShowResponse.fromJson(value);
        case 'ProviderProfileUpdateRequest':
          return ProviderProfileUpdateRequest.fromJson(value);
        case 'ProviderProfileUpdateResponse':
          return ProviderProfileUpdateResponse.fromJson(value);
        case 'ProviderProfileUpdateResponseData':
          return ProviderProfileUpdateResponseData.fromJson(value);
        case 'ProviderRegisterRequest':
          return ProviderRegisterRequest.fromJson(value);
        case 'ProviderRegisterResponse':
          return ProviderRegisterResponse.fromJson(value);
        case 'ProviderRegisterResponseData':
          return ProviderRegisterResponseData.fromJson(value);
        case 'ProviderchangePasswordRequest':
          return ProviderchangePasswordRequest.fromJson(value);
        case 'ReadANotification1200Response':
          return ReadANotification1200Response.fromJson(value);
        case 'ReadANotification1200ResponseData':
          return ReadANotification1200ResponseData.fromJson(value);
        case 'ResetCodeConfirmRequest':
          return ResetCodeConfirmRequest.fromJson(value);
        case 'ResetCodeConfirmResponse':
          return ResetCodeConfirmResponse.fromJson(value);
        case 'ResetCodeSendRequest':
          return ResetCodeSendRequest.fromJson(value);
        case 'ResetCodeSendResponse':
          return ResetCodeSendResponse.fromJson(value);
        case 'ResetPasswordRequest':
          return ResetPasswordRequest.fromJson(value);
        case 'ResetPasswordResponse':
          return ResetPasswordResponse.fromJson(value);
        case 'ServiceList':
          return ServiceList.fromJson(value);
        case 'ServiceListItem':
          return ServiceListItem.fromJson(value);
        case 'ServiceShowData':
          return ServiceShowData.fromJson(value);
        case 'ServiceShowResponse':
          return ServiceShowResponse.fromJson(value);
        case 'ShowAllGiftBoxes200Response':
          return ShowAllGiftBoxes200Response.fromJson(value);
        case 'ShowAllGiftCards200Response':
          return ShowAllGiftCards200Response.fromJson(value);
        case 'ShowAllProviderSOrders200Response':
          return ShowAllProviderSOrders200Response.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseData':
          return ShowAllProviderSOrders200ResponseData.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInner':
          return ShowAllProviderSOrders200ResponseDataDataInner.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInner':
          return ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInner.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerService':
          return ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerService.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerServiceListsInner':
          return ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerServiceListsInner.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerServiceListsInnerItemsInner':
          return ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInnerServiceListsInnerItemsInner.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerPromocode':
          return ShowAllProviderSOrders200ResponseDataDataInnerPromocode.fromJson(value);
        case 'ShowAllProviderSOrders200ResponseDataDataInnerUser':
          return ShowAllProviderSOrders200ResponseDataDataInnerUser.fromJson(value);
        case 'ShowAllServicesWithFilter200Response':
          return ShowAllServicesWithFilter200Response.fromJson(value);
        case 'ShowAllServicesWithFilter200ResponseData':
          return ShowAllServicesWithFilter200ResponseData.fromJson(value);
        case 'ShowAllServicesWithFilter200ResponseDataDataInner':
          return ShowAllServicesWithFilter200ResponseDataDataInner.fromJson(value);
        case 'ShowAllServicesWithFilter200ResponseDataLinksInner':
          return ShowAllServicesWithFilter200ResponseDataLinksInner.fromJson(value);
        case 'ShowCartDetails200Response':
          return ShowCartDetails200Response.fromJson(value);
        case 'ShowCartDetails200ResponseData':
          return ShowCartDetails200ResponseData.fromJson(value);
        case 'ShowCartDetails200ResponseDataCartItemsInner':
          return ShowCartDetails200ResponseDataCartItemsInner.fromJson(value);
        case 'ShowCartDetails200ResponseDataCartItemsInnerProduct':
          return ShowCartDetails200ResponseDataCartItemsInnerProduct.fromJson(value);
        case 'ShowCartDetails200ResponseDataCartItemsInnerService':
          return ShowCartDetails200ResponseDataCartItemsInnerService.fromJson(value);
        case 'ShowHome200Response':
          return ShowHome200Response.fromJson(value);
        case 'ShowHome200ResponseData':
          return ShowHome200ResponseData.fromJson(value);
        case 'ShowHome200ResponseDataCategoriesInner':
          return ShowHome200ResponseDataCategoriesInner.fromJson(value);
        case 'ShowHome200ResponseDataOccasionsInner':
          return ShowHome200ResponseDataOccasionsInner.fromJson(value);
        case 'ShowHome200ResponseDataTopRatedProductsInner':
          return ShowHome200ResponseDataTopRatedProductsInner.fromJson(value);
        case 'ShowHome200ResponseDataTopRatedProvidersInner':
          return ShowHome200ResponseDataTopRatedProvidersInner.fromJson(value);
        case 'ShowHome200ResponseDataTopRatedServicesInner':
          return ShowHome200ResponseDataTopRatedServicesInner.fromJson(value);
        case 'ShowNotifications1200Response':
          return ShowNotifications1200Response.fromJson(value);
        case 'ShowNotifications1200ResponseDataInner':
          return ShowNotifications1200ResponseDataInner.fromJson(value);
        case 'ShowNotifications1200ResponseDataInnerProvider':
          return ShowNotifications1200ResponseDataInnerProvider.fromJson(value);
        case 'ShowNotifications1200ResponseDataInnerUser':
          return ShowNotifications1200ResponseDataInnerUser.fromJson(value);
        case 'ShowOrderDetails2200Response':
          return ShowOrderDetails2200Response.fromJson(value);
        case 'ShowOrderDetails2200ResponseData':
          return ShowOrderDetails2200ResponseData.fromJson(value);
        case 'ShowOrderDetails2200ResponseDataOrderItemsInner':
          return ShowOrderDetails2200ResponseDataOrderItemsInner.fromJson(value);
        case 'ShowOrderDetails2200ResponseDataOrderItemsInnerProduct':
          return ShowOrderDetails2200ResponseDataOrderItemsInnerProduct.fromJson(value);
        case 'ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInner':
          return ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInner.fromJson(value);
        case 'ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner':
          return ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner.fromJson(value);
        case 'ShowProfile200Response':
          return ShowProfile200Response.fromJson(value);
        case 'ShowProfile200ResponseData':
          return ShowProfile200ResponseData.fromJson(value);
        case 'ShowProfile200ResponseDataCity':
          return ShowProfile200ResponseDataCity.fromJson(value);
        case 'ShowPromocodeDetails200Response':
          return ShowPromocodeDetails200Response.fromJson(value);
        case 'ShowPromocodeDetails200ResponseData':
          return ShowPromocodeDetails200ResponseData.fromJson(value);
        case 'ShowWishlistItemsWithSearchByName200Response':
          return ShowWishlistItemsWithSearchByName200Response.fromJson(value);
        case 'ShowWishlistItemsWithSearchByName200ResponseDataInner':
          return ShowWishlistItemsWithSearchByName200ResponseDataInner.fromJson(value);
        case 'ShowWishlistItemsWithSearchByName200ResponseDataInnerItemsInner':
          return ShowWishlistItemsWithSearchByName200ResponseDataInnerItemsInner.fromJson(value);
        case 'Size':
          return Size.fromJson(value);
        case 'SizesResponse':
          return SizesResponse.fromJson(value);
        case 'Tag':
          return Tag.fromJson(value);
        case 'TagsResponse':
          return TagsResponse.fromJson(value);
        case 'UpdateProfile200Response':
          return UpdateProfile200Response.fromJson(value);
        case 'UpdateProfile200ResponseData':
          return UpdateProfile200ResponseData.fromJson(value);
        case 'UpdateProfile200ResponseDataCity':
          return UpdateProfile200ResponseDataCity.fromJson(value);
        case 'UploadFiles':
          return UploadFiles.fromJson(value);
        case 'UploadFilesResponse':
          return UploadFilesResponse.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient._deserialize(
        jsonDecode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);
