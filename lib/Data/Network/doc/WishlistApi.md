# lazo.api.WishlistApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showWishlistItemsWithSearchByName**](WishlistApi.md#showwishlistitemswithsearchbyname) | **GET** /client/wishlist/show | Show wishlist items (with search by name)
[**toggleProductServiceInWishlist**](WishlistApi.md#toggleproductserviceinwishlist) | **POST** /client/wishlist/toggle | Toggle product/service in wishlist


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

final api_instance = WishlistApi();
final searchByNameEn = serv; // String | 
final searchByNameAr = الخدمة; // String | 

try {
    final result = api_instance.showWishlistItemsWithSearchByName(searchByNameEn, searchByNameAr);
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->showWishlistItemsWithSearchByName: $e\n');
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
> ToggleProductServiceInWishlist200Response toggleProductServiceInWishlist(productId, serviceId)

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

final api_instance = WishlistApi();
final productId = productId_example; // String | Select product or service
final serviceId = serviceId_example; // String | Select product or service

try {
    final result = api_instance.toggleProductServiceInWishlist(productId, serviceId);
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->toggleProductServiceInWishlist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Select product or service | [optional] 
 **serviceId** | **String**| Select product or service | [optional] 

### Return type

[**ToggleProductServiceInWishlist200Response**](ToggleProductServiceInWishlist200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

