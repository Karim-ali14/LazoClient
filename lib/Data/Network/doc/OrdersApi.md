# lazo.api.OrdersApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrder**](OrdersApi.md#createorder) | **POST** /client/order/create | Create order
[**manageOrder**](OrdersApi.md#manageorder) | **POST** /client/order/manage | Manage order
[**rateOrder**](OrdersApi.md#rateorder) | **POST** /client/order/rating | Rate order
[**showOrderDetails**](OrdersApi.md#showorderdetails) | **GET** /client/order/show | Show order details
[**showOrders**](OrdersApi.md#showorders) | **GET** /client/orders | Show orders


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
final receiverAddressDetails = receiverAddressDetails_example; // String | 
final receiverPhone = receiverPhone_example; // String | 

try {
    final result = api_instance.createOrder(deliveryDate, deliveryTime, giftBoxId, giftCardId, isIdentitySecret, orderType, paymentMethod, promocode, receiverAddress, receiverAddressDetails, receiverPhone);
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

final api_instance = OrdersApi();
final comment = comment_example; // String | 
final orderId = orderId_example; // String | 
final rating = rating_example; // String | From 1 to 5

try {
    final result = api_instance.rateOrder(comment, orderId, rating);
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->rateOrder: $e\n');
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

final api_instance = OrdersApi();

try {
    final result = api_instance.showOrders();
    print(result);
} catch (e) {
    print('Exception when calling OrdersApi->showOrders: $e\n');
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

