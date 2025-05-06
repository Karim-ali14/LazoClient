# lazo.api.CartApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addProductServiceToCartCartItem**](CartApi.md#addproductservicetocartcartitem) | **POST** /cart/create | Add product/service to cart (cart-item)
[**deleteCartItem**](CartApi.md#deletecartitem) | **POST** /cart-item/delete | Delete cart item
[**resetCartForClient**](CartApi.md#resetcartforclient) | **POST** /cart/delete | Reset cart for client
[**showCartDetails**](CartApi.md#showcartdetails) | **POST** /cart/show | show cart details
[**updateCartItemQuantity**](CartApi.md#updatecartitemquantity) | **POST** /cart/update | Update cart item quantity


# **addProductServiceToCartCartItem**
> AddProductServiceToCartCartItem200Response addProductServiceToCartCartItem(sessionId, productId, productQuantity, productSelectedListIds, productSelectedListItemsIds, serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds)

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

final api_instance = CartApi();
final sessionId = sessionId_example; // String | 
final productId = productId_example; // String | Optional (insert a product or a service)
final productQuantity = productQuantity_example; // String | Required with product_id
final productSelectedListIds = productSelectedListIds_example; // String | Optional, but required with product_id if provided
final productSelectedListItemsIds = productSelectedListItemsIds_example; // String | Optional, but required with product_id if provided
final serviceId = serviceId_example; // String | Optional (insert a product or a service)
final serviceQuantity = serviceQuantity_example; // String | Required with service_id
final serviceSelectedListIds = serviceSelectedListIds_example; // String | Optional, but required with service_id if provided
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | Optional, but required with service_id if provided

try {
    final result = api_instance.addProductServiceToCartCartItem(sessionId, productId, productQuantity, productSelectedListIds, productSelectedListItemsIds, serviceId, serviceQuantity, serviceSelectedListIds, serviceSelectedListItemsIds);
    print(result);
} catch (e) {
    print('Exception when calling CartApi->addProductServiceToCartCartItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | [optional] 
 **productId** | **String**| Optional (insert a product or a service) | [optional] 
 **productQuantity** | **String**| Required with product_id | [optional] 
 **productSelectedListIds** | **String**| Optional, but required with product_id if provided | [optional] 
 **productSelectedListItemsIds** | **String**| Optional, but required with product_id if provided | [optional] 
 **serviceId** | **String**| Optional (insert a product or a service) | [optional] 
 **serviceQuantity** | **String**| Required with service_id | [optional] 
 **serviceSelectedListIds** | **String**| Optional, but required with service_id if provided | [optional] 
 **serviceSelectedListItemsIds** | **String**| Optional, but required with service_id if provided | [optional] 

### Return type

[**AddProductServiceToCartCartItem200Response**](AddProductServiceToCartCartItem200Response.md)

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

final api_instance = CartApi();
final cartItemId = cartItemId_example; // String | 

try {
    api_instance.deleteCartItem(cartItemId);
} catch (e) {
    print('Exception when calling CartApi->deleteCartItem: $e\n');
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

# **resetCartForClient**
> resetCartForClient(sessionId)

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

final api_instance = CartApi();
final sessionId = sessionId_example; // String | 

try {
    api_instance.resetCartForClient(sessionId);
} catch (e) {
    print('Exception when calling CartApi->resetCartForClient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showCartDetails**
> ShowCartDetails200Response showCartDetails(sessionId)

show cart details

show cart details

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CartApi();
final sessionId = sessionId_example; // String | 

try {
    final result = api_instance.showCartDetails(sessionId);
    print(result);
} catch (e) {
    print('Exception when calling CartApi->showCartDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | [optional] 

### Return type

[**ShowCartDetails200Response**](ShowCartDetails200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCartItemQuantity**
> UpdateCartItemQuantity200Response updateCartItemQuantity(cartItemId, quantity, productSelectedListIds, productSelectedListItemsIds, serviceSelectedListIds, serviceSelectedListItemsIds)

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

final api_instance = CartApi();
final cartItemId = cartItemId_example; // String | 
final quantity = quantity_example; // String | 
final productSelectedListIds = productSelectedListIds_example; // String | 
final productSelectedListItemsIds = productSelectedListItemsIds_example; // String | 
final serviceSelectedListIds = serviceSelectedListIds_example; // String | 
final serviceSelectedListItemsIds = serviceSelectedListItemsIds_example; // String | 

try {
    final result = api_instance.updateCartItemQuantity(cartItemId, quantity, productSelectedListIds, productSelectedListItemsIds, serviceSelectedListIds, serviceSelectedListItemsIds);
    print(result);
} catch (e) {
    print('Exception when calling CartApi->updateCartItemQuantity: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartItemId** | **String**|  | [optional] 
 **quantity** | **String**|  | [optional] 
 **productSelectedListIds** | **String**|  | [optional] 
 **productSelectedListItemsIds** | **String**|  | [optional] 
 **serviceSelectedListIds** | **String**|  | [optional] 
 **serviceSelectedListItemsIds** | **String**|  | [optional] 

### Return type

[**UpdateCartItemQuantity200Response**](UpdateCartItemQuantity200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

