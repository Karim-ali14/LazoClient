# lazo.api.NotificationsApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignChatNotificationToAClient**](NotificationsApi.md#assignchatnotificationtoaclient) | **POST** /provider/chat/notification/assign | Assign chat notification to a client
[**assignChatNotificationToAProvider**](NotificationsApi.md#assignchatnotificationtoaprovider) | **POST** /client/chat/notification/assign | Assign chat notification to a provider
[**readANotification1**](NotificationsApi.md#readanotification1) | **POST** /provider/notification/read | read a notification
[**readANotification122**](NotificationsApi.md#readanotification122) | **POST** /client/notification/read | read a notification
[**showNotifications1**](NotificationsApi.md#shownotifications1) | **GET** /provider/notifications | show notifications
[**showNotifications2**](NotificationsApi.md#shownotifications2) | **GET** /client/notifications | show notifications
[**updateFcmTokenAndDeviceType1**](NotificationsApi.md#updatefcmtokenanddevicetype1) | **POST** /provider/update/device-data | update fcm_token and device_type
[**updateFcmTokenAndDeviceType2**](NotificationsApi.md#updatefcmtokenanddevicetype2) | **POST** /client/update/device-data | update fcm_token and device_type


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

# **readANotification1**
> ReadANotification1200Response readANotification1(notificationId)

read a notification

read a notification

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
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification1(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling NotificationsApi->readANotification1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationId** | **String**|  | [optional] 

### Return type

[**ReadANotification1200Response**](ReadANotification1200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readANotification122**
> ReadANotification122200Response readANotification122(notificationId)

read a notification

read a notification

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
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification122(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling NotificationsApi->readANotification122: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationId** | **String**|  | [optional] 

### Return type

[**ReadANotification122200Response**](ReadANotification122200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showNotifications1**
> ShowNotifications1200Response showNotifications1(unreadOnly)

show notifications

show notifications

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
final unreadOnly = 1; // String | optional | used when show only unread, otherwise show all takes 0 or 1

try {
    final result = api_instance.showNotifications1(unreadOnly);
    print(result);
} catch (e) {
    print('Exception when calling NotificationsApi->showNotifications1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unreadOnly** | **String**| optional | used when show only unread, otherwise show all takes 0 or 1 | [optional] 

### Return type

[**ShowNotifications1200Response**](ShowNotifications1200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showNotifications2**
> ShowNotifications2200Response showNotifications2(unreadOnly)

show notifications

show notifications

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
final unreadOnly = 1; // String | optional | used when show only unread, otherwise show all takes 0 or 1

try {
    final result = api_instance.showNotifications2(unreadOnly);
    print(result);
} catch (e) {
    print('Exception when calling NotificationsApi->showNotifications2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unreadOnly** | **String**| optional | used when show only unread, otherwise show all takes 0 or 1 | [optional] 

### Return type

[**ShowNotifications2200Response**](ShowNotifications2200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateFcmTokenAndDeviceType1**
> updateFcmTokenAndDeviceType1(deviceType, fcmToken)

update fcm_token and device_type

update fcm_token and device_type

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
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType1(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling NotificationsApi->updateFcmTokenAndDeviceType1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceType** | **String**| android|ios | [optional] 
 **fcmToken** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateFcmTokenAndDeviceType2**
> updateFcmTokenAndDeviceType2(deviceType, fcmToken)

update fcm_token and device_type

update fcm_token and device_type

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
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType2(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling NotificationsApi->updateFcmTokenAndDeviceType2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceType** | **String**| android|ios | [optional] 
 **fcmToken** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

