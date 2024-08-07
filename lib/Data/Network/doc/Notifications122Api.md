# lazo.api.Notifications122Api

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**readANotification122**](Notifications122Api.md#readanotification122) | **POST** /client/notification/read | read a notification


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

final api_instance = Notifications122Api();
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification122(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling Notifications122Api->readANotification122: $e\n');
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

