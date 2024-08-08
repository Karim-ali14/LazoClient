# lazo.api.ProviderApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignChatNotificationToAClient**](ProviderApi.md#assignchatnotificationtoaclient) | **POST** /provider/chat/notification/assign | Assign chat notification to a client
[**manageOrders1**](ProviderApi.md#manageorders1) | **POST** /provider/order/manage | manage orders
[**providerAccountDeleteGet**](ProviderApi.md#provideraccountdeleteget) | **GET** /provider/account-delete | provider\\'s account deleted successfully
[**providerLogoutGet**](ProviderApi.md#providerlogoutget) | **GET** /provider/logout | provider logout
[**providerProfileShowGet**](ProviderApi.md#providerprofileshowget) | **GET** /provider/profile/show | show profile
[**providerProfileUpdatePost**](ProviderApi.md#providerprofileupdatepost) | **POST** /provider/profile/update | update profile main data
[**providerchangePassword**](ProviderApi.md#providerchangepassword) | **POST** /provider/change-password | Change Password
[**readANotification1**](ProviderApi.md#readanotification1) | **POST** /provider/notification/read | read a notification
[**showAllProviderSOrders**](ProviderApi.md#showallprovidersorders) | **GET** /provider/orders | show all provider's orders
[**showNotifications1**](ProviderApi.md#shownotifications1) | **GET** /provider/notifications | show notifications
[**showOrderDetails2**](ProviderApi.md#showorderdetails2) | **GET** /provider/order/show | show order details
[**updateFcmTokenAndDeviceType1**](ProviderApi.md#updatefcmtokenanddevicetype1) | **POST** /provider/update/device-data | update fcm_token and device_type


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

final api_instance = ProviderApi();
final chatroomId = chatroomId_example; // String | 
final notificationMessage = notificationMessage_example; // String | 
final userId = userId_example; // String | User ID of the client

try {
    api_instance.assignChatNotificationToAClient(chatroomId, notificationMessage, userId);
} catch (e) {
    print('Exception when calling ProviderApi->assignChatNotificationToAClient: $e\n');
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

# **manageOrders1**
> ProviderOrderDetailsResponse manageOrders1(cancellationReason, orderId, statusId)

manage orders

manage orders

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final cancellationReason = cancellationReason_example; // String | required when status_id = 10 or 11
final orderId = orderId_example; // String | 
final statusId = statusId_example; // String | 2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order

try {
    final result = api_instance.manageOrders1(cancellationReason, orderId, statusId);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->manageOrders1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cancellationReason** | **String**| required when status_id = 10 or 11 | [optional] 
 **orderId** | **String**|  | [optional] 
 **statusId** | **String**| 2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order | [optional] 

### Return type

[**ProviderOrderDetailsResponse**](ProviderOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerAccountDeleteGet**
> providerAccountDeleteGet()

provider\\'s account deleted successfully

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();

try {
    api_instance.providerAccountDeleteGet();
} catch (e) {
    print('Exception when calling ProviderApi->providerAccountDeleteGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerLogoutGet**
> providerLogoutGet()

provider logout

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();

try {
    api_instance.providerLogoutGet();
} catch (e) {
    print('Exception when calling ProviderApi->providerLogoutGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerProfileShowGet**
> ProviderData providerProfileShowGet()

show profile

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();

try {
    final result = api_instance.providerProfileShowGet();
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->providerProfileShowGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProviderData**](ProviderData.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerProfileUpdatePost**
> ProviderData providerProfileUpdatePost(storeNameEn, storeNameAr, storeOwnerName, cityId)

update profile main data

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final storeNameEn = storeNameEn_example; // String | 
final storeNameAr = storeNameAr_example; // String | 
final storeOwnerName = storeOwnerName_example; // String | 
final cityId = 56; // int | 

try {
    final result = api_instance.providerProfileUpdatePost(storeNameEn, storeNameAr, storeOwnerName, cityId);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->providerProfileUpdatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeNameEn** | **String**|  | [optional] 
 **storeNameAr** | **String**|  | [optional] 
 **storeOwnerName** | **String**|  | [optional] 
 **cityId** | **int**|  | [optional] 

### Return type

[**ProviderData**](ProviderData.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerchangePassword**
> providerchangePassword(providerchangePasswordRequest)

Change Password

Change the password of the provider

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final providerchangePasswordRequest = ProviderchangePasswordRequest(); // ProviderchangePasswordRequest | 

try {
    api_instance.providerchangePassword(providerchangePasswordRequest);
} catch (e) {
    print('Exception when calling ProviderApi->providerchangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerchangePasswordRequest** | [**ProviderchangePasswordRequest**](ProviderchangePasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
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

final api_instance = ProviderApi();
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification1(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->readANotification1: $e\n');
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

# **showAllProviderSOrders**
> ShowAllProviderSOrders200Response showAllProviderSOrders(status, page)

show all provider's orders

show all provider's orders

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final status = new; // String | 
final page = 1; // num | 

try {
    final result = api_instance.showAllProviderSOrders(status, page);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->showAllProviderSOrders: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | [optional] 
 **page** | **num**|  | [optional] 

### Return type

[**ShowAllProviderSOrders200Response**](ShowAllProviderSOrders200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
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

final api_instance = ProviderApi();
final unreadOnly = 1; // String | optional | used when show only unread, otherwise show all takes 0 or 1

try {
    final result = api_instance.showNotifications1(unreadOnly);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->showNotifications1: $e\n');
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

# **showOrderDetails2**
> ProviderOrderDetailsResponse showOrderDetails2(orderId)

show order details

show order details

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final orderId = 11; // String | 

try {
    final result = api_instance.showOrderDetails2(orderId);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->showOrderDetails2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **String**|  | [optional] 

### Return type

[**ProviderOrderDetailsResponse**](ProviderOrderDetailsResponse.md)

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

final api_instance = ProviderApi();
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType1(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling ProviderApi->updateFcmTokenAndDeviceType1: $e\n');
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

