# lazo.api.Orders12Api

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**manageOrders1**](Orders12Api.md#manageorders1) | **POST** /provider/order/manage | manage orders
[**showAllProviderSOrders**](Orders12Api.md#showallprovidersorders) | **GET** /provider/orders | show all provider's orders
[**showOrderDetails2**](Orders12Api.md#showorderdetails2) | **GET** /provider/order/show | show order details


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

final api_instance = Orders12Api();
final cancellationReason = cancellationReason_example; // String | required when status_id = 10 or 11
final orderId = orderId_example; // String | 
final statusId = statusId_example; // String | 2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order

try {
    final result = api_instance.manageOrders1(cancellationReason, orderId, statusId);
    print(result);
} catch (e) {
    print('Exception when calling Orders12Api->manageOrders1: $e\n');
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

final api_instance = Orders12Api();
final status = new; // String | 
final page = 1; // num | 

try {
    final result = api_instance.showAllProviderSOrders(status, page);
    print(result);
} catch (e) {
    print('Exception when calling Orders12Api->showAllProviderSOrders: $e\n');
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

final api_instance = Orders12Api();
final orderId = 11; // String | 

try {
    final result = api_instance.showOrderDetails2(orderId);
    print(result);
} catch (e) {
    print('Exception when calling Orders12Api->showOrderDetails2: $e\n');
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

