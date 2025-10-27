//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PaymentApi {
  PaymentApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// verify payment
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] resourcePath (required):
  ///
  /// * [String] paymentBrand (required):
  Future<Response> paymentVerifyGetWithHttpInfo(String resourcePath, String paymentBrand,) async {
    // ignore: prefer_const_declarations
    final path = r'/payment/verify';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'resourcePath', resourcePath));
      queryParams.addAll(_queryParams('', 'paymentBrand', paymentBrand));

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

  /// verify payment
  ///
  /// Parameters:
  ///
  /// * [String] resourcePath (required):
  ///
  /// * [String] paymentBrand (required):
  Future<PaymentVerifyResponse?> paymentVerifyGet(String resourcePath, String paymentBrand,) async {
    final response = await paymentVerifyGetWithHttpInfo(resourcePath, paymentBrand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PaymentVerifyResponse',) as PaymentVerifyResponse;
    
    }
    return null;
  }
}
