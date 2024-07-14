//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class Notifications2Api {
  Notifications2Api([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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
}
