# lazo.api.OrdersApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**calculateInstantOrder**](OrdersApi.md#calculateinstantorder) | **POST** /client/instant-order/calculate | calculate an instant order
[**creatInstantOrder**](OrdersApi.md#creatinstantorder) | **POST** /client/instant-order/create | create an instant order
[**createOrder**](OrdersApi.md#createorder) | **POST** /client/order/create | Create order
[**manageOrder**](OrdersApi.md#manageorder) | **POST** /client/order/manage | Manage order
[**rateOrder**](OrdersApi.md#rateorder) | **POST** /client/order/rating | Rate order
[**showOrderDetails**](OrdersApi.md#showorderdetails) | **GET** /client/order/show | Show order details
[**showOrders**](OrdersApi.md#showorders) | **GET** /client/orders | Show orders


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

final api_instance = OrdersApi();
final serviceId = serviceId_example; // String | 
final serviceQuantity = serviceQuantity_example; // String | 
final serviceSelectedListIds = serviceSelectedListIds_example; // String | 
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | 
final promocode = promocode_example; // String | 

try {
    final result = api_instance.calculateInstantOrder(serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds, promocode);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->calculateInstantOrder: $e\n');
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

final api_instance = OrdersApi();
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
    print('Exception when calling OrdersApi->creatInstantOrder: $e\n');
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

final api_instance = OrdersApi();
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
    print('Exception when calling OrdersApi->createOrder: $e\n');
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

final api_instance = OrdersApi();
final orderId = orderId_example; // String | 
final statusId = statusId_example; // String | 12-client_cancel_order, 13-client_continue_order_without_an_item_after_provider_rejects

try {
    final result = api_instance.manageOrder(orderId, statusId);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->manageOrder: $e\n');
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
> ClientOrderDetailsResponse rateOrder(comments, orderItemsIds, ratings)

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

final api_instance = OrdersApi();
final comments = []; // List<String> | 
final orderItemsIds = []; // List<String> | 
final ratings = []; // List<String> | 

try {
    final result = api_instance.rateOrder(comments, orderItemsIds, ratings);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->rateOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **comments** | [**List<String>**](String.md)|  | [optional] 
 **orderItemsIds** | [**List<String>**](String.md)|  | [optional] 
 **ratings** | [**List<String>**](String.md)|  | [optional] 

### Return type

[**ClientOrderDetailsResponse**](ClientOrderDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
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

final api_instance = OrdersApi();
final orderId = 5; // String | 

try {
    final result = api_instance.showOrderDetails(orderId);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->showOrderDetails: $e\n');
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

final api_instance = OrdersApi();
final status = status_example; // String | 
final page = 8.14; // num | 

try {
    final result = api_instance.showOrders(status, page);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->showOrders: $e\n');
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

