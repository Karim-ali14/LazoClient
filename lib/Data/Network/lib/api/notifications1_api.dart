//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class Notifications1Api {
  Notifications1Api([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// read a notification
  ///
  /// read a notification
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] notificationId:
  Future<Response> readANotification1WithHttpInfo({ String? notificationId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/notification/read';

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
  Future<ReadANotification1200Response?> readANotification1({ String? notificationId, }) async {
    final response = await readANotification1WithHttpInfo( notificationId: notificationId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ReadANotification1200Response',) as ReadANotification1200Response;
    
    }
    return null;
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
  Future<Response> showNotifications1WithHttpInfo({ String? unreadOnly, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/notifications';

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
  Future<ShowNotifications1200Response?> showNotifications1({ String? unreadOnly, }) async {
    final response = await showNotifications1WithHttpInfo( unreadOnly: unreadOnly, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ShowNotifications1200Response',) as ShowNotifications1200Response;
    
    }
    return null;
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
  Future<Response> updateFcmTokenAndDeviceType1WithHttpInfo({ String? deviceType, String? fcmToken, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/update/device-data';

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
  Future<void> updateFcmTokenAndDeviceType1({ String? deviceType, String? fcmToken, }) async {
    final response = await updateFcmTokenAndDeviceType1WithHttpInfo( deviceType: deviceType, fcmToken: fcmToken, );
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
}
