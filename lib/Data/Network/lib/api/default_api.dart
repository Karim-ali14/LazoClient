//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add City
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] nameEn (required):
  ///   Add a new city English name
  ///
  /// * [String] nameAr (required):
  ///   Add a new city Arabic name
  Future<Response> call00a7fc2a7d55091042505f1e124d12e2WithHttpInfo(String nameEn, String nameAr,) async {
    // ignore: prefer_const_declarations
    final path = r'/city/add';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'name_en', nameEn));
      queryParams.addAll(_queryParams('', 'name_ar', nameAr));

    const contentTypes = <String>[];


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

  /// Add City
  ///
  /// Parameters:
  ///
  /// * [String] nameEn (required):
  ///   Add a new city English name
  ///
  /// * [String] nameAr (required):
  ///   Add a new city Arabic name
  Future<String?> call00a7fc2a7d55091042505f1e124d12e2(String nameEn, String nameAr,) async {
    final response = await call00a7fc2a7d55091042505f1e124d12e2WithHttpInfo(nameEn, nameAr,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }
}
