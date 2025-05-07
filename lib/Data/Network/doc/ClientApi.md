# lazo.api.ClientApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignChatNotificationToAProvider**](ClientApi.md#assignchatnotificationtoaprovider) | **POST** /client/chat/notification/assign | Assign chat notification to a provider
[**calculateInstantOrder**](ClientApi.md#calculateinstantorder) | **POST** /client/instant-order/calculate | calculate an instant order
[**clientAccountDeleteGet**](ClientApi.md#clientaccountdeleteget) | **GET** /client/account-delete | client\\'s account deleted successfully
[**clientLogoutGet**](ClientApi.md#clientlogoutget) | **GET** /client/logout | client logout
[**clientWishlistCollectionDeleteDelete**](ClientApi.md#clientwishlistcollectiondeletedelete) | **DELETE** /client/wishlist/collection/delete | delete collection wishlist
[**clientWishlistCollectionResetGet**](ClientApi.md#clientwishlistcollectionresetget) | **GET** /client/wishlist/collection/reset | reset collection wishlist
[**creatInstantOrder**](ClientApi.md#creatinstantorder) | **POST** /client/instant-order/create | create an instant order
[**createOrder**](ClientApi.md#createorder) | **POST** /client/order/create | Create order
[**createWishlistCollection**](ClientApi.md#createwishlistcollection) | **POST** /client/wishlist/collection/create | create wishlist collection
[**manageOrder**](ClientApi.md#manageorder) | **POST** /client/order/manage | Manage order
[**rateOrder**](ClientApi.md#rateorder) | **POST** /client/order/rating | Rate order
[**readANotification122**](ClientApi.md#readanotification122) | **POST** /client/notification/read | read a notification
[**showNotifications2**](ClientApi.md#shownotifications2) | **GET** /client/notifications | show notifications
[**showOrderDetails**](ClientApi.md#showorderdetails) | **GET** /client/order/show | Show order details
[**showOrders**](ClientApi.md#showorders) | **GET** /client/orders | Show orders
[**showProfile**](ClientApi.md#showprofile) | **GET** /client/profile/show | show profile
[**showWishlistCollections**](ClientApi.md#showwishlistcollections) | **GET** /client/wishlist/collections | Show wishlist collections
[**showWishlistItemsWithSearchByName**](ClientApi.md#showwishlistitemswithsearchbyname) | **GET** /client/wishlist/show | Show wishlist items (with search by name)
[**toggleProductServiceInWishlist**](ClientApi.md#toggleproductserviceinwishlist) | **POST** /client/wishlist/toggle | Toggle product/service in wishlist
[**updateFcmTokenAndDeviceType2**](ClientApi.md#updatefcmtokenanddevicetype2) | **POST** /client/update/device-data | update fcm_token and device_type
[**updateProfile**](ClientApi.md#updateprofile) | **POST** /client/profile/update | update profile
[**updateWishlistCollection**](ClientApi.md#updatewishlistcollection) | **POST** /client/wishlist/collection/update | update wishlist collection


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

final api_instance = ClientApi();
final chatroomId = chatroomId_example; // String | 
final notificationMessage = notificationMessage_example; // String | 
final providerId = providerId_example; // String | 

try {
    api_instance.assignChatNotificationToAProvider(chatroomId, notificationMessage, providerId);
} catch (e) {
    print('Exception when calling ClientApi->assignChatNotificationToAProvider: $e\n');
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

# **calculateInstantOrder**
> ClientOrderDetailsResponse calculateInstantOrder(serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds, promocode)

calculate an instant order

calculate an instant order

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final serviceId = serviceId_example; // String | 
final serviceQuantity = serviceQuantity_example; // String | 
final serviceSelectedListIds = serviceSelectedListIds_example; // String | 
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | 
final promocode = promocode_example; // String | 

try {
    final result = api_instance.calculateInstantOrder(serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds, promocode);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->calculateInstantOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | [optional] 
 **serviceQuantity** | **String**|  | [optional] 
 **serviceSelectedListIds** | **String**|  | [optional] 
 **serviceSelectedListItemsIds** | **String**|  | [optional] 
 **promocode** | **String**|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientAccountDeleteGet**
> clientAccountDeleteGet()

client\\'s account deleted successfully

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();

try {
    api_instance.clientAccountDeleteGet();
} catch (e) {
    print('Exception when calling ClientApi->clientAccountDeleteGet: $e\n');
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

# **clientLogoutGet**
> clientLogoutGet()

client logout

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();

try {
    api_instance.clientLogoutGet();
} catch (e) {
    print('Exception when calling ClientApi->clientLogoutGet: $e\n');
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

# **clientWishlistCollectionDeleteDelete**
> clientWishlistCollectionDeleteDelete(collectionId)

delete collection wishlist

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final collectionId = collectionId_example; // String | 

try {
    api_instance.clientWishlistCollectionDeleteDelete(collectionId);
} catch (e) {
    print('Exception when calling ClientApi->clientWishlistCollectionDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientWishlistCollectionResetGet**
> clientWishlistCollectionResetGet(collectionId)

reset collection wishlist

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final collectionId = collectionId_example; // String | 

try {
    api_instance.clientWishlistCollectionResetGet(collectionId);
} catch (e) {
    print('Exception when calling ClientApi->clientWishlistCollectionResetGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **creatInstantOrder**
> ClientOrderDetailsResponse creatInstantOrder(serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds, paymentMethod, promocode, receiverName, receiverPhoneNumber, cardMessage, cardFrom, cardTo, deliveryDate, deliveryTime)

create an instant order

create an instant order

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final serviceId = serviceId_example; // String | 
final serviceQuantity = serviceQuantity_example; // String | 
final serviceSelectedListIds = serviceSelectedListIds_example; // String | 
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | 
final paymentMethod = paymentMethod_example; // String | 
final promocode = promocode_example; // String | 
final receiverName = receiverName_example; // String | 
final receiverPhoneNumber = receiverPhoneNumber_example; // String | 
final cardMessage = cardMessage_example; // String | 
final cardFrom = cardFrom_example; // String | 
final cardTo = cardTo_example; // String | 
final deliveryDate = deliveryDate_example; // String | 
final deliveryTime = deliveryTime_example; // String | 

try {
    final result = api_instance.creatInstantOrder(serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds, paymentMethod, promocode, receiverName, receiverPhoneNumber, cardMessage, cardFrom, cardTo, deliveryDate, deliveryTime);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->creatInstantOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | [optional] 
 **serviceQuantity** | **String**|  | [optional] 
 **serviceSelectedListIds** | **String**|  | [optional] 
 **serviceSelectedListItemsIds** | **String**|  | [optional] 
 **paymentMethod** | **String**|  | [optional] 
 **promocode** | **String**|  | [optional] 
 **receiverName** | **String**|  | [optional] 
 **receiverPhoneNumber** | **String**|  | [optional] 
 **cardMessage** | **String**|  | [optional] 
 **cardFrom** | **String**|  | [optional] 
 **cardTo** | **String**|  | [optional] 
 **deliveryDate** | **String**|  | [optional] 
 **deliveryTime** | **String**|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrder**
> ClientOrderDetailsResponse createOrder(deliveryDate, deliveryTime, giftBoxId, giftCardId, isIdentitySecret, orderType, paymentMethod, promocode, receiverAddress, latLng, receiverName, receiverAddressDetails, receiverPhone)

Create order

Create order

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final deliveryDate = deliveryDate_example; // String | Format: eg: 13 Nov 2024
final deliveryTime = deliveryTime_example; // String | Format: eg: 06:00 PM
final giftBoxId = giftBoxId_example; // String | Optional
final giftCardId = giftCardId_example; // String | Optional
final isIdentitySecret = isIdentitySecret_example; // String | 0-visible, 1-hidden
final orderType = orderType_example; // String | self_order or receiver_order
final paymentMethod = paymentMethod_example; // String | eg: visa, mada, applepay
final promocode = promocode_example; // String | Optional
final receiverAddress = receiverAddress_example; // String | Required in case of self_order (address of client itself)
final latLng = latLng_example; // String | 
final receiverName = receiverName_example; // String | 
final receiverAddressDetails = receiverAddressDetails_example; // String | 
final receiverPhone = receiverPhone_example; // String | 

try {
    final result = api_instance.createOrder(deliveryDate, deliveryTime, giftBoxId, giftCardId, isIdentitySecret, orderType, paymentMethod, promocode, receiverAddress, latLng, receiverName, receiverAddressDetails, receiverPhone);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->createOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deliveryDate** | **String**| Format: eg: 13 Nov 2024 | [optional] 
 **deliveryTime** | **String**| Format: eg: 06:00 PM | [optional] 
 **giftBoxId** | **String**| Optional | [optional] 
 **giftCardId** | **String**| Optional | [optional] 
 **isIdentitySecret** | **String**| 0-visible, 1-hidden | [optional] 
 **orderType** | **String**| self_order or receiver_order | [optional] 
 **paymentMethod** | **String**| eg: visa, mada, applepay | [optional] 
 **promocode** | **String**| Optional | [optional] 
 **receiverAddress** | **String**| Required in case of self_order (address of client itself) | [optional] 
 **latLng** | **String**|  | [optional] 
 **receiverName** | **String**|  | [optional] 
 **receiverAddressDetails** | **String**|  | [optional] 
 **receiverPhone** | **String**|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWishlistCollection**
> CreateWishlistCollection200Response createWishlistCollection(name)

create wishlist collection

create wishlist collection

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final name = name_example; // String | 

try {
    final result = api_instance.createWishlistCollection(name);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->createWishlistCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | [optional] 

### Return type

[**CreateWishlistCollection200Response**](CreateWishlistCollection200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **manageOrder**
> ClientOrderDetailsResponse manageOrder(orderId, statusId)

Manage order

Manage order

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final orderId = orderId_example; // String | 
final statusId = statusId_example; // String | 12-client_cancel_order, 13-client_continue_order_without_an_item_after_provider_rejects

try {
    final result = api_instance.manageOrder(orderId, statusId);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->manageOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **String**|  | [optional] 
 **statusId** | **String**| 12-client_cancel_order, 13-client_continue_order_without_an_item_after_provider_rejects | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rateOrder**
> ClientOrderDetailsResponse rateOrder(rateOrderRequest)

Rate order

Rate order

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final rateOrderRequest = RateOrderRequest(); // RateOrderRequest | 

try {
    final result = api_instance.rateOrder(rateOrderRequest);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->rateOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rateOrderRequest** | [**RateOrderRequest**](RateOrderRequest.md)|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
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

final api_instance = ClientApi();
final notificationId = notificationId_example; // String | 

try {
    final result = api_instance.readANotification122(notificationId);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->readANotification122: $e\n');
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

final api_instance = ClientApi();
final unreadOnly = 1; // String | optional | used when show only unread, otherwise show all takes 0 or 1

try {
    final result = api_instance.showNotifications2(unreadOnly);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showNotifications2: $e\n');
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

# **showOrderDetails**
> ClientOrderDetailsResponse showOrderDetails(orderId)

Show order details

Show order details

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final orderId = 5; // String | 

try {
    final result = api_instance.showOrderDetails(orderId);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showOrderDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **String**|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showOrders**
> ShowOrders200Response showOrders(status, page)

Show orders

Show orders

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final status = status_example; // String | 
final page = 8.14; // num | 

try {
    final result = api_instance.showOrders(status, page);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showOrders: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | [optional] 
 **page** | **num**|  | [optional] 

### Return type

[**ShowOrders200Response**](ShowOrders200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showProfile**
> ShowProfile200Response showProfile()

show profile

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

final api_instance = ClientApi();

try {
    final result = api_instance.showProfile();
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showProfile: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowProfile200Response**](ShowProfile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showWishlistCollections**
> ShowWishlistCollections200Response showWishlistCollections()

Show wishlist collections

Show wishlist collections

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();

try {
    final result = api_instance.showWishlistCollections();
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showWishlistCollections: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowWishlistCollections200Response**](ShowWishlistCollections200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showWishlistItemsWithSearchByName**
> ShowWishlistItemsWithSearchByName200Response showWishlistItemsWithSearchByName(searchByName, type, collectionId, shipmentType)

Show wishlist items (with search by name)

Show wishlist items (with search by name)

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final searchByName = searchByName_example; // String | 
final type = type_example; // String | 
final collectionId = collectionId_example; // String | 
final shipmentType = shipmentType_example; // String | 

try {
    final result = api_instance.showWishlistItemsWithSearchByName(searchByName, type, collectionId, shipmentType);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showWishlistItemsWithSearchByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchByName** | **String**|  | [optional] 
 **type** | **String**|  | [optional] 
 **collectionId** | **String**|  | [optional] 
 **shipmentType** | **String**|  | [optional] 

### Return type

[**ShowWishlistItemsWithSearchByName200Response**](ShowWishlistItemsWithSearchByName200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleProductServiceInWishlist**
> ToggleProductServiceInWishlist200Response toggleProductServiceInWishlist(productId, serviceId, collectionId)

Toggle product/service in wishlist

Toggle product/service in wishlist

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final productId = productId_example; // String | Select product or service
final serviceId = serviceId_example; // String | Select product or service
final collectionId = collectionId_example; // String | 

try {
    final result = api_instance.toggleProductServiceInWishlist(productId, serviceId, collectionId);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->toggleProductServiceInWishlist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Select product or service | [optional] 
 **serviceId** | **String**| Select product or service | [optional] 
 **collectionId** | **String**|  | [optional] 

### Return type

[**ToggleProductServiceInWishlist200Response**](ToggleProductServiceInWishlist200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

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

final api_instance = ClientApi();
final deviceType = deviceType_example; // String | android|ios
final fcmToken = fcmToken_example; // String | 

try {
    api_instance.updateFcmTokenAndDeviceType2(deviceType, fcmToken);
} catch (e) {
    print('Exception when calling ClientApi->updateFcmTokenAndDeviceType2: $e\n');
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

# **updateProfile**
> ClientAuthResponse updateProfile(cityId, email, image, name, phone, countryCode)

update profile

update profile

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final cityId = cityId_example; // String | 
final email = email_example; // String | 
final image = image_example; // String | 
final name = name_example; // String | 
final phone = phone_example; // String | need verification before updating this field here
final countryCode = countryCode_example; // String | 

try {
    final result = api_instance.updateProfile(cityId, email, image, name, phone, countryCode);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->updateProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String**|  | [optional] 
 **email** | **String**|  | [optional] 
 **image** | **String**|  | [optional] 
 **name** | **String**|  | [optional] 
 **phone** | **String**| need verification before updating this field here | [optional] 
 **countryCode** | **String**|  | [optional] 

### Return type

[**ClientAuthResponse**](ClientAuthResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWishlistCollection**
> CreateWishlistCollection200Response updateWishlistCollection(collectionId, name)

update wishlist collection

update wishlist collection

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final collectionId = collectionId_example; // String | 
final name = name_example; // String | 

try {
    final result = api_instance.updateWishlistCollection(collectionId, name);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->updateWishlistCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**|  | [optional] 
 **name** | **String**|  | [optional] 

### Return type

[**CreateWishlistCollection200Response**](CreateWishlistCollection200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

