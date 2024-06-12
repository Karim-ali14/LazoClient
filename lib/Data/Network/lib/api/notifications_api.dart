//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class NotificationsApi {
  NotificationsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Assign chat notification to a client
  ///
  /// Assign chat notification to a client
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] chatroomId:
  ///
  /// * [String] notificationMessage:
  ///
  /// * [String] userId:
  ///   User ID of the client
  Future<Response> assignChatNotificationToAClientWithHttpInfo({ String? chatroomId, String? notificationMessage, String? userId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/chat/notification/assign';

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
    if (userId != null) {
      hasFields = true;
      mp.fields[r'user_id'] = parameterToString(userId);
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

  /// Assign chat notification to a client
  ///
  /// Assign chat notification to a client
  ///
  /// Parameters:
  ///
  /// * [String] chatroomId:
  ///
  /// * [String] notificationMessage:
  ///
  /// * [String] userId:
  ///   User ID of the client
  Future<void> assignChatNotificationToAClient({ String? chatroomId, String? notificationMessage, String? userId, }) async {
    final response = await assignChatNotificationToAClientWithHttpInfo( chatroomId: chatroomId, notificationMessage: notificationMessage, userId: userId, );
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
}
