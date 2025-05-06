# lazo.api.WishlistApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientWishlistCollectionDeleteDelete**](WishlistApi.md#clientwishlistcollectiondeletedelete) | **DELETE** /client/wishlist/collection/delete | delete collection wishlist
[**clientWishlistCollectionResetGet**](WishlistApi.md#clientwishlistcollectionresetget) | **GET** /client/wishlist/collection/reset | reset collection wishlist
[**createWishlistCollection**](WishlistApi.md#createwishlistcollection) | **POST** /client/wishlist/collection/create | create wishlist collection
[**showWishlistCollections**](WishlistApi.md#showwishlistcollections) | **GET** /client/wishlist/collections | Show wishlist collections
[**showWishlistItemsWithSearchByName**](WishlistApi.md#showwishlistitemswithsearchbyname) | **GET** /client/wishlist/show | Show wishlist items (with search by name)
[**toggleProductServiceInWishlist**](WishlistApi.md#toggleproductserviceinwishlist) | **POST** /client/wishlist/toggle | Toggle product/service in wishlist
[**updateWishlistCollection**](WishlistApi.md#updatewishlistcollection) | **POST** /client/wishlist/collection/update | update wishlist collection


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

final api_instance = WishlistApi();
final collectionId = collectionId_example; // String | 

try {
    api_instance.clientWishlistCollectionDeleteDelete(collectionId);
} catch (e) {
    print('Exception when calling WishlistApi->clientWishlistCollectionDeleteDelete: $e\n');
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

final api_instance = WishlistApi();
final collectionId = collectionId_example; // String | 

try {
    api_instance.clientWishlistCollectionResetGet(collectionId);
} catch (e) {
    print('Exception when calling WishlistApi->clientWishlistCollectionResetGet: $e\n');
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

final api_instance = WishlistApi();
final name = name_example; // String | 

try {
    final result = api_instance.createWishlistCollection(name);
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->createWishlistCollection: $e\n');
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

final api_instance = WishlistApi();

try {
    final result = api_instance.showWishlistCollections();
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->showWishlistCollections: $e\n');
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

final api_instance = WishlistApi();
final searchByName = searchByName_example; // String | 
final type = type_example; // String | 
final collectionId = collectionId_example; // String | 
final shipmentType = shipmentType_example; // String | 

try {
    final result = api_instance.showWishlistItemsWithSearchByName(searchByName, type, collectionId, shipmentType);
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->showWishlistItemsWithSearchByName: $e\n');
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

final api_instance = WishlistApi();
final productId = productId_example; // String | Select product or service
final serviceId = serviceId_example; // String | Select product or service
final collectionId = collectionId_example; // String | 

try {
    final result = api_instance.toggleProductServiceInWishlist(productId, serviceId, collectionId);
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
 **collectionId** | **String**|  | [optional] 

### Return type

[**ToggleProductServiceInWishlist200Response**](ToggleProductServiceInWishlist200Response.md)

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

final api_instance = WishlistApi();
final collectionId = collectionId_example; // String | 
final name = name_example; // String | 

try {
    final result = api_instance.updateWishlistCollection(collectionId, name);
    print(result);
} catch (e) {
    print('Exception when calling WishlistApi->updateWishlistCollection: $e\n');
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

