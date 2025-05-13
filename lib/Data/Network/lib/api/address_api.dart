//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AddressApi {
  AddressApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// delete address
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addressId:
  Future<Response> clientAddressDeleteDeleteWithHttpInfo({ String? addressId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/address/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (addressId != null) {
      queryParams.addAll(_queryParams('', 'address_id', addressId));
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

  /// delete address
  ///
  /// Parameters:
  ///
  /// * [String] addressId:
  Future<void> clientAddressDeleteDelete({ String? addressId, }) async {
    final response = await clientAddressDeleteDeleteWithHttpInfo( addressId: addressId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// create address
  ///
  /// create address
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] recipientName:
  ///
  /// * [String] recipientPhone:
  ///
  /// * [String] recipientLandmark:
  ///
  /// * [String] recipientAddress:
  ///
  /// * [String] lat:
  ///
  /// * [String] lng:
  ///
  /// * [String] cityId:
  Future<Response> createAddressWithHttpInfo({ String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/address/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (recipientName != null) {
      hasFields = true;
      mp.fields[r'recipient_name'] = parameterToString(recipientName);
    }
    if (recipientPhone != null) {
      hasFields = true;
      mp.fields[r'recipient_phone'] = parameterToString(recipientPhone);
    }
    if (recipientLandmark != null) {
      hasFields = true;
      mp.fields[r'recipient_landmark'] = parameterToString(recipientLandmark);
    }
    if (recipientAddress != null) {
      hasFields = true;
      mp.fields[r'recipient_address'] = parameterToString(recipientAddress);
    }
    if (lat != null) {
      hasFields = true;
      mp.fields[r'lat'] = parameterToString(lat);
    }
    if (lng != null) {
      hasFields = true;
      mp.fields[r'lng'] = parameterToString(lng);
    }
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
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

  /// create address
  ///
  /// create address
  ///
  /// Parameters:
  ///
  /// * [String] recipientName:
  ///
  /// * [String] recipientPhone:
  ///
  /// * [String] recipientLandmark:
  ///
  /// * [String] recipientAddress:
  ///
  /// * [String] lat:
  ///
  /// * [String] lng:
  ///
  /// * [String] cityId:
  Future<CreateAddress200Response?> createAddress({ String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    final response = await createAddressWithHttpInfo( recipientName: recipientName, recipientPhone: recipientPhone, recipientLandmark: recipientLandmark, recipientAddress: recipientAddress, lat: lat, lng: lng, cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateAddress200Response',) as CreateAddress200Response;
    
    }
    return null;
  }

  /// update address
  ///
  /// update address
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addressId:
  ///
  /// * [String] recipientName:
  ///
  /// * [String] recipientPhone:
  ///
  /// * [String] recipientLandmark:
  ///
  /// * [String] recipientAddress:
  ///
  /// * [String] lat:
  ///
  /// * [String] lng:
  ///
  /// * [String] cityId:
  Future<Response> updateAddressWithHttpInfo({ String? addressId, String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/client/address/update';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (addressId != null) {
      hasFields = true;
      mp.fields[r'address_id'] = parameterToString(addressId);
    }
    if (recipientName != null) {
      hasFields = true;
      mp.fields[r'recipient_name'] = parameterToString(recipientName);
    }
    if (recipientPhone != null) {
      hasFields = true;
      mp.fields[r'recipient_phone'] = parameterToString(recipientPhone);
    }
    if (recipientLandmark != null) {
      hasFields = true;
      mp.fields[r'recipient_landmark'] = parameterToString(recipientLandmark);
    }
    if (recipientAddress != null) {
      hasFields = true;
      mp.fields[r'recipient_address'] = parameterToString(recipientAddress);
    }
    if (lat != null) {
      hasFields = true;
      mp.fields[r'lat'] = parameterToString(lat);
    }
    if (lng != null) {
      hasFields = true;
      mp.fields[r'lng'] = parameterToString(lng);
    }
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
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

  /// update address
  ///
  /// update address
  ///
  /// Parameters:
  ///
  /// * [String] addressId:
  ///
  /// * [String] recipientName:
  ///
  /// * [String] recipientPhone:
  ///
  /// * [String] recipientLandmark:
  ///
  /// * [String] recipientAddress:
  ///
  /// * [String] lat:
  ///
  /// * [String] lng:
  ///
  /// * [String] cityId:
  Future<UpdateAddress200Response?> updateAddress({ String? addressId, String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    final response = await updateAddressWithHttpInfo( addressId: addressId, recipientName: recipientName, recipientPhone: recipientPhone, recipientLandmark: recipientLandmark, recipientAddress: recipientAddress, lat: lat, lng: lng, cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateAddress200Response',) as UpdateAddress200Response;
    
    }
    return null;
  }
}
