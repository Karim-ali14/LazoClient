//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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
}
