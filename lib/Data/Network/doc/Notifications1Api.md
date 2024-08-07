# lazo.api.Notifications1Api

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**readANotification1**](Notifications1Api.md#readanotification1) | **POST** /provider/notification/read | read a notification
[**showNotifications1**](Notifications1Api.md#shownotifications1) | **GET** /provider/notifications | show notifications
[**updateFcmTokenAndDeviceType1**](Notifications1Api.md#updatefcmtokenanddevicetype1) | **POST** /provider/update/device-data | update fcm_token and device_type
[**updateFcmTokenAndDeviceType2**](Notifications1Api.md#updatefcmtokenanddevicetype2) | **POST** /client/update/device-data | update fcm_token and device_type


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

final api_instance = Notifications1Api();
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification1(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling Notifications1Api->readANotification1: $e\n');
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

final api_instance = Notifications1Api();
final unreadOnly = 1; // String | optional | used when show only unread, otherwise show all takes 0 or 1

try {
    final result = api_instance.showNotifications1(unreadOnly);
    print(result);
} catch (e) {
    print('Exception when calling Notifications1Api->showNotifications1: $e\n');
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

final api_instance = Notifications1Api();
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType1(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling Notifications1Api->updateFcmTokenAndDeviceType1: $e\n');
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

final api_instance = Notifications1Api();
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType2(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling Notifications1Api->updateFcmTokenAndDeviceType2: $e\n');
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

