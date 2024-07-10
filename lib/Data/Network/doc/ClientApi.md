# lazo.api.ClientApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addProductServiceToCartCartItem**](ClientApi.md#addproductservicetocartcartitem) | **POST** /client/cart/create | Add product/service to cart (cart-item)
[**assignChatNotificationToAProvider**](ClientApi.md#assignchatnotificationtoaprovider) | **POST** /client/chat/notification/assign | Assign chat notification to a provider
[**clientAccountDeleteGet**](ClientApi.md#clientaccountdeleteget) | **GET** /client/account-delete | client\\'s account deleted successfully
[**clientLogoutGet**](ClientApi.md#clientlogoutget) | **GET** /client/logout | client logout
[**createOrder**](ClientApi.md#createorder) | **POST** /client/order/create | Create order
[**deleteCartItem**](ClientApi.md#deletecartitem) | **POST** /client/cart-item/delete | Delete cart item
[**manageOrder**](ClientApi.md#manageorder) | **POST** /client/order/manage | Manage order
[**rateOrder**](ClientApi.md#rateorder) | **POST** /client/order/rating | Rate order
[**readANotification122**](ClientApi.md#readanotification122) | **POST** /client/notification/read | read a notification
[**resetCartForClient**](ClientApi.md#resetcartforclient) | **GET** /client/cart/delete | Reset cart for client
[**showNotifications2**](ClientApi.md#shownotifications2) | **GET** /client/notifications | show notifications
[**showOrderDetails**](ClientApi.md#showorderdetails) | **GET** /client/order/show | Show order details
[**showOrders**](ClientApi.md#showorders) | **GET** /client/orders | Show orders
[**showProfile**](ClientApi.md#showprofile) | **GET** /client/profile/show | show profile
[**showWishlistItemsWithSearchByName**](ClientApi.md#showwishlistitemswithsearchbyname) | **GET** /client/wishlist/show | Show wishlist items (with search by name)
[**toggleProductServiceInWishlist**](ClientApi.md#toggleproductserviceinwishlist) | **POST** /client/wishlist/toggle | Toggle product/service in wishlist
[**updateCartItemQuantity**](ClientApi.md#updatecartitemquantity) | **POST** /client/cart/update | Update cart item quantity
[**updateFcmTokenAndDeviceType2**](ClientApi.md#updatefcmtokenanddevicetype2) | **POST** /client/update/device-data | update fcm_token and device_type
[**updateProfile**](ClientApi.md#updateprofile) | **POST** /client/profile/update | update profile


# **addProductServiceToCartCartItem**
> addProductServiceToCartCartItem(productId, productQuantity, productSelectedListIds, productSelectedListItemsIds, serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds)

Add product/service to cart (cart-item)

Add product/service to cart (cart-item)

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
final productId = productId_example; // String | Optional (insert a product or a service)
final productQuantity = productQuantity_example; // String | Required with product_id
final productSelectedListIds = productSelectedListIds_example; // String | Optional, but required with product_id if provided
final productSelectedListItemsIds = productSelectedListItemsIds_example; // String | Optional, but required with product_id if provided
final serviceId = serviceId_example; // String | Optional (insert a product or a service)
final serviceQuantity = serviceQuantity_example; // String | Required with service_id
final serviceSelectedListIds = serviceSelectedListIds_example; // String | Optional, but required with service_id if provided
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | Optional, but required with service_id if provided

try {
    api_instance.addProductServiceToCartCartItem(productId, productQuantity, productSelectedListIds, productSelectedListItemsIds, serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds);
} catch (e) {
    print('Exception when calling ClientApi->addProductServiceToCartCartItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Optional (insert a product or a service) | [optional] 
 **productQuantity** | **String**| Required with product_id | [optional] 
 **productSelectedListIds** | **String**| Optional, but required with product_id if provided | [optional] 
 **productSelectedListItemsIds** | **String**| Optional, but required with product_id if provided | [optional] 
 **serviceId** | **String**| Optional (insert a product or a service) | [optional] 
 **serviceQuantity** | **String**| Required with service_id | [optional] 
 **serviceSelectedListIds** | **String**| Optional, but required with service_id if provided | [optional] 
 **serviceSelectedListItemsIds** | **String**| Optional, but required with service_id if provided | [optional] 

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

# **createOrder**
> ClientOrderDetails createOrder(deliveryDate, deliveryTime, giftBoxId, giftCardId, isIdentitySecret, orderType, paymentMethod, promocode, receiverAddress, receiverAddressDetails, receiverPhone)

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
final receiverAddressDetails = receiverAddressDetails_example; // String | 
final receiverPhone = receiverPhone_example; // String | 

try {
    final result = api_instance.createOrder(deliveryDate, deliveryTime, giftBoxId, giftCardId, isIdentitySecret, orderType, paymentMethod, promocode, receiverAddress, receiverAddressDetails, receiverPhone);
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
 **receiverAddressDetails** | **String**|  | [optional] 
 **receiverPhone** | **String**|  | [optional] 

### Return type

[**ClientOrderDetails**](ClientOrderDetails.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCartItem**
> deleteCartItem(cartItemId)

Delete cart item

Delete cart item

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
final cartItemId = cartItemId_example; // String | 

try {
    api_instance.deleteCartItem(cartItemId);
} catch (e) {
    print('Exception when calling ClientApi->deleteCartItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartItemId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

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
> ClientOrderDetails rateOrder(comment, orderId, rating)

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
final comment = comment_example; // String | 
final orderId = orderId_example; // String | 
final rating = rating_example; // String | From 1 to 5

try {
    final result = api_instance.rateOrder(comment, orderId, rating);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->rateOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **comment** | **String**|  | [optional] 
 **orderId** | **String**|  | [optional] 
 **rating** | **String**| From 1 to 5 | [optional] 

### Return type

[**ClientOrderDetails**](ClientOrderDetails.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readANotification122**
> ReadANotification1200Response readANotification122(notificationId)

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

[**ReadANotification1200Response**](ReadANotification1200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetCartForClient**
> resetCartForClient()

Reset cart for client

Reset cart for client

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
    api_instance.resetCartForClient();
} catch (e) {
    print('Exception when calling ClientApi->resetCartForClient: $e\n');
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
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showNotifications2**
> ShowNotifications1200Response showNotifications2(unreadOnly)

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

[**ShowNotifications1200Response**](ShowNotifications1200Response.md)

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
> ShowOrders200Response showOrders()

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

try {
    final result = api_instance.showOrders();
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showOrders: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

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

# **showWishlistItemsWithSearchByName**
> ShowWishlistItemsWithSearchByName200Response showWishlistItemsWithSearchByName(searchByNameEn, searchByNameAr)

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
final searchByNameEn = serv; // String | 
final searchByNameAr = الخدمة; // String | 

try {
    final result = api_instance.showWishlistItemsWithSearchByName(searchByNameEn, searchByNameAr);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showWishlistItemsWithSearchByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchByNameEn** | **String**|  | [optional] 
 **searchByNameAr** | **String**|  | [optional] 

### Return type

[**ShowWishlistItemsWithSearchByName200Response**](ShowWishlistItemsWithSearchByName200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleProductServiceInWishlist**
> toggleProductServiceInWishlist(productId, serviceId)

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

try {
    api_instance.toggleProductServiceInWishlist(productId, serviceId);
} catch (e) {
    print('Exception when calling ClientApi->toggleProductServiceInWishlist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Select product or service | [optional] 
 **serviceId** | **String**| Select product or service | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCartItemQuantity**
> updateCartItemQuantity(cartItemId, quantity)

Update cart item quantity

Update cart item quantity

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
final cartItemId = cartItemId_example; // String | 
final quantity = quantity_example; // String | 

try {
    api_instance.updateCartItemQuantity(cartItemId, quantity);
} catch (e) {
    print('Exception when calling ClientApi->updateCartItemQuantity: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartItemId** | **String**|  | [optional] 
 **quantity** | **String**|  | [optional] 

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
> UpdateProfile200Response updateProfile(cityId, email, image, name, phone)

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

try {
    final result = api_instance.updateProfile(cityId, email, image, name, phone);
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

### Return type

[**UpdateProfile200Response**](UpdateProfile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

