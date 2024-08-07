# lazo.api.NotificationsApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignChatNotificationToAClient**](NotificationsApi.md#assignchatnotificationtoaclient) | **POST** /provider/chat/notification/assign | Assign chat notification to a client
[**assignChatNotificationToAProvider**](NotificationsApi.md#assignchatnotificationtoaprovider) | **POST** /client/chat/notification/assign | Assign chat notification to a provider


# **assignChatNotificationToAClient**
> assignChatNotificationToAClient(chatroomId, notificationMessage, userId)

Assign chat notification to a client

Assign chat notification to a client

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationsApi();
final chatroomId = chatroomId_example; // String | 
final notificationMessage = notificationMessage_example; // String | 
final userId = userId_example; // String | User ID of the client

try {
    api_instance.assignChatNotificationToAClient(chatroomId, notificationMessage, userId);
} catch (e) {
    print('Exception when calling NotificationsApi->assignChatNotificationToAClient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatroomId** | **String**|  | [optional] 
 **notificationMessage** | **String**|  | [optional] 
 **userId** | **String**| User ID of the client | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assignChatNotificationToAProvider**
> assignChatNotificationToAProvider(chatroomId, notificationMessage, providerId)

Assign chat notification to a provider

Assign chat notification to a provider

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationsApi();
final chatroomId = chatroomId_example; // String | 
final notificationMessage = notificationMessage_example; // String | 
final providerId = providerId_example; // String | 

try {
    api_instance.assignChatNotificationToAProvider(chatroomId, notificationMessage, providerId);
} catch (e) {
    print('Exception when calling NotificationsApi->assignChatNotificationToAProvider: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatroomId** | **String**|  | [optional] 
 **notificationMessage** | **String**|  | [optional] 
 **providerId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

