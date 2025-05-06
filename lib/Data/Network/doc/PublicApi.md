# lazo.api.PublicApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addProductServiceToCartCartItem**](PublicApi.md#addproductservicetocartcartitem) | **POST** /cart/create | Add product/service to cart (cart-item)
[**cartCalculation**](PublicApi.md#cartcalculation) | **POST** /cart/calculate | cart calculation
[**citiesGet**](PublicApi.md#citiesget) | **GET** /cities | show all cities
[**clientLogin**](PublicApi.md#clientlogin) | **POST** /client/login | client login
[**clientSignup**](PublicApi.md#clientsignup) | **POST** /client/register | client signup
[**deleteCartItem**](PublicApi.md#deletecartitem) | **POST** /cart-item/delete | Delete cart item
[**filterTopProductsServices**](PublicApi.md#filtertopproductsservices) | **POST** /top-products-services/filter | Filter top products & services
[**filterTopSellers**](PublicApi.md#filtertopsellers) | **POST** /top-sellers/filter | Filter top sellers
[**getAppInfo**](PublicApi.md#getappinfo) | **GET** /app-info | get app info
[**resetCartForClient**](PublicApi.md#resetcartforclient) | **POST** /cart/delete | Reset cart for client
[**sendPushNotification**](PublicApi.md#sendpushnotification) | **POST** /push/test | send push notification
[**showAProviderDetails**](PublicApi.md#showaproviderdetails) | **GET** /provider/details | provider details
[**showAllBanners**](PublicApi.md#showallbanners) | **GET** /banners | show all banners
[**showAllCategories**](PublicApi.md#showallcategories) | **GET** /categories | show all categories
[**showAllColors**](PublicApi.md#showallcolors) | **GET** /colors | show all colors
[**showAllGiftBoxes**](PublicApi.md#showallgiftboxes) | **GET** /gift-boxes | Show all gift boxes
[**showAllGiftCards**](PublicApi.md#showallgiftcards) | **GET** /gift-cards | Show all gift cards
[**showAllOccasions**](PublicApi.md#showalloccasions) | **GET** /occasions | show all occasions
[**showAllProducts**](PublicApi.md#showallproducts) | **GET** /products/filter | show all products
[**showAllServicesWithFilter**](PublicApi.md#showallserviceswithfilter) | **GET** /services/filter | show all services (with filter)
[**showAllSizes**](PublicApi.md#showallsizes) | **GET** /sizes | show all sizes
[**showCartDetails**](PublicApi.md#showcartdetails) | **POST** /cart/show | show cart details
[**showHome**](PublicApi.md#showhome) | **GET** /home | Show home
[**showProductDetails**](PublicApi.md#showproductdetails) | **GET** /product/show | show product details
[**showProductReviews**](PublicApi.md#showproductreviews) | **GET** /product/reviews | product with its list of ratings
[**showPromocodeDetails**](PublicApi.md#showpromocodedetails) | **GET** /promocode/show | show promocode details
[**showServiceDetails**](PublicApi.md#showservicedetails) | **GET** /service/show | show service details
[**showServiceReviews**](PublicApi.md#showservicereviews) | **GET** /service/reviews | service with its list of ratings
[**tagsGet**](PublicApi.md#tagsget) | **GET** /tags | show all tags
[**updateCartItemQuantity**](PublicApi.md#updatecartitemquantity) | **POST** /cart/update | Update cart item quantity
[**uploadFilesPost**](PublicApi.md#uploadfilespost) | **POST** /upload/files | upload file(s)


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

final api_instance = PublicApi();
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
    print('Exception when calling PublicApi->addProductServiceToCartCartItem: $e\n');
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

# **cartCalculation**
> CartCalculation200Response cartCalculation(cartId, promocode, giftBoxId, giftCardId)

cart calculation

cart calculation

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final cartId = cartId_example; // String | 
final promocode = promocode_example; // String | 
final giftBoxId = giftBoxId_example; // String | 
final giftCardId = giftCardId_example; // String | 

try {
    final result = api_instance.cartCalculation(cartId, promocode, giftBoxId, giftCardId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->cartCalculation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartId** | **String**|  | [optional] 
 **promocode** | **String**|  | [optional] 
 **giftBoxId** | **String**|  | [optional] 
 **giftCardId** | **String**|  | [optional] 

### Return type

[**CartCalculation200Response**](CartCalculation200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **citiesGet**
> CitiesResponse citiesGet(lang)

show all cities

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final lang = ar; // String | 

try {
    final result = api_instance.citiesGet(lang);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->citiesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lang** | **String**|  | [optional] 

### Return type

[**CitiesResponse**](CitiesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientLogin**
> ClientAuthResponse clientLogin(phone, countryCode, sessionId)

client login

client login

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final phone = phone_example; // String | 
final countryCode = countryCode_example; // String | 
final sessionId = sessionId_example; // String | 

try {
    final result = api_instance.clientLogin(phone, countryCode, sessionId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->clientLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phone** | **String**|  | [optional] 
 **countryCode** | **String**|  | [optional] 
 **sessionId** | **String**|  | [optional] 

### Return type

[**ClientAuthResponse**](ClientAuthResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSignup**
> ClientAuthResponse clientSignup(cityId, email, image, name, phone, countryCode, sessionId)

client signup

client signup

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final cityId = cityId_example; // String | 
final email = email_example; // String | optional
final image = image_example; // String | optional
final name = name_example; // String | 
final phone = phone_example; // String | 
final countryCode = countryCode_example; // String | 
final sessionId = sessionId_example; // String | 

try {
    final result = api_instance.clientSignup(cityId, email, image, name, phone, countryCode, sessionId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->clientSignup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String**|  | [optional] 
 **email** | **String**| optional | [optional] 
 **image** | **String**| optional | [optional] 
 **name** | **String**|  | [optional] 
 **phone** | **String**|  | [optional] 
 **countryCode** | **String**|  | [optional] 
 **sessionId** | **String**|  | [optional] 

### Return type

[**ClientAuthResponse**](ClientAuthResponse.md)

### Authorization

No authorization required

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

final api_instance = PublicApi();
final cartItemId = cartItemId_example; // String | 

try {
    api_instance.deleteCartItem(cartItemId);
} catch (e) {
    print('Exception when calling PublicApi->deleteCartItem: $e\n');
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

# **filterTopProductsServices**
> FilterTopProductsServices200Response filterTopProductsServices(filterTopProductsServicesRequest)

Filter top products & services

Filter top products & services

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final filterTopProductsServicesRequest = FilterTopProductsServicesRequest(); // FilterTopProductsServicesRequest | 

try {
    final result = api_instance.filterTopProductsServices(filterTopProductsServicesRequest);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->filterTopProductsServices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterTopProductsServicesRequest** | [**FilterTopProductsServicesRequest**](FilterTopProductsServicesRequest.md)|  | [optional] 

### Return type

[**FilterTopProductsServices200Response**](FilterTopProductsServices200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterTopSellers**
> FilterTopSellers200Response filterTopSellers(filterTopSellersRequest)

Filter top sellers

Filter top sellers

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final filterTopSellersRequest = FilterTopSellersRequest(); // FilterTopSellersRequest | 

try {
    final result = api_instance.filterTopSellers(filterTopSellersRequest);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->filterTopSellers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterTopSellersRequest** | [**FilterTopSellersRequest**](FilterTopSellersRequest.md)|  | [optional] 

### Return type

[**FilterTopSellers200Response**](FilterTopSellers200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAppInfo**
> GetAppInfo200Response getAppInfo()

get app info

get app info

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.getAppInfo();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->getAppInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAppInfo200Response**](GetAppInfo200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

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

final api_instance = PublicApi();
final sessionId = sessionId_example; // String | 

try {
    api_instance.resetCartForClient(sessionId);
} catch (e) {
    print('Exception when calling PublicApi->resetCartForClient: $e\n');
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

# **sendPushNotification**
> SendPushNotification200Response sendPushNotification(token, deviceType)

send push notification

send push notification

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PublicApi();
final token = token_example; // String | 
final deviceType = deviceType_example; // String | 

try {
    final result = api_instance.sendPushNotification(token, deviceType);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->sendPushNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | [optional] 
 **deviceType** | **String**|  | [optional] 

### Return type

[**SendPushNotification200Response**](SendPushNotification200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAProviderDetails**
> ShowAProviderDetails200Response showAProviderDetails(providerId, type)

provider details

show provider details

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final providerId = 8.14; // num | 
final type = 8.14; // num | 

try {
    final result = api_instance.showAProviderDetails(providerId, type);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAProviderDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **num**|  | [optional] 
 **type** | **num**|  | [optional] 

### Return type

[**ShowAProviderDetails200Response**](ShowAProviderDetails200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllBanners**
> BannersResponse showAllBanners()

show all banners

show all banners

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllBanners();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllBanners: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BannersResponse**](BannersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllCategories**
> CategoriesResponse showAllCategories()

show all categories

show all categories

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllCategories();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllCategories: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CategoriesResponse**](CategoriesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllColors**
> ColorsResponse showAllColors()

show all colors

show all colors

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllColors();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllColors: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ColorsResponse**](ColorsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllGiftBoxes**
> ShowAllGiftBoxes200Response showAllGiftBoxes()

Show all gift boxes

Retrieve a list of all available gift boxes

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllGiftBoxes();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllGiftBoxes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowAllGiftBoxes200Response**](ShowAllGiftBoxes200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllGiftCards**
> ShowAllGiftCards200Response showAllGiftCards()

Show all gift cards

Retrieve a list of all available gift cards

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllGiftCards();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllGiftCards: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowAllGiftCards200Response**](ShowAllGiftCards200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllOccasions**
> OccasionsResponse showAllOccasions()

show all occasions

show all occasions

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllOccasions();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllOccasions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OccasionsResponse**](OccasionsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllProducts**
> ProductsListResponse showAllProducts(providerId)

show all products

show all products

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final providerId = 1; // String | 

try {
    final result = api_instance.showAllProducts(providerId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllProducts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **String**|  | [optional] 

### Return type

[**ProductsListResponse**](ProductsListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllServicesWithFilter**
> ServicesListResponse showAllServicesWithFilter(providerId)

show all services (with filter)

show all services (with filter)

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final providerId = 2; // String | optional

try {
    final result = api_instance.showAllServicesWithFilter(providerId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllServicesWithFilter: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **String**| optional | [optional] 

### Return type

[**ServicesListResponse**](ServicesListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAllSizes**
> SizesResponse showAllSizes()

show all sizes

show all sizes

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();

try {
    final result = api_instance.showAllSizes();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showAllSizes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SizesResponse**](SizesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

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

final api_instance = PublicApi();
final sessionId = sessionId_example; // String | 

try {
    final result = api_instance.showCartDetails(sessionId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showCartDetails: $e\n');
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

# **showHome**
> ShowHome200Response showHome()

Show home

Show home

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PublicApi();

try {
    final result = api_instance.showHome();
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showHome: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowHome200Response**](ShowHome200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showProductDetails**
> ProductDetailsResponse showProductDetails(productId)

show product details

show product details

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final productId = 4; // String | 

try {
    final result = api_instance.showProductDetails(productId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showProductDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**|  | [optional] 

### Return type

[**ProductDetailsResponse**](ProductDetailsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showProductReviews**
> ProductDetailsResponse showProductReviews(productId)

product with its list of ratings

product with its list of ratings

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final productId = 4; // String | 

try {
    final result = api_instance.showProductReviews(productId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showProductReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**|  | [optional] 

### Return type

[**ProductDetailsResponse**](ProductDetailsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showPromocodeDetails**
> ShowPromocodeDetails200Response showPromocodeDetails(promocodeId, code)

show promocode details

show promocode details

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final promocodeId = 4; // String | optional but choose either id or code
final code = XWESF34; // String | optional but choose either id or code

try {
    final result = api_instance.showPromocodeDetails(promocodeId, code);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showPromocodeDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **promocodeId** | **String**| optional but choose either id or code | [optional] 
 **code** | **String**| optional but choose either id or code | [optional] 

### Return type

[**ShowPromocodeDetails200Response**](ShowPromocodeDetails200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showServiceDetails**
> ServiceShowResponse showServiceDetails(serviceId)

show service details

show service details

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final serviceId = 9; // String | 

try {
    final result = api_instance.showServiceDetails(serviceId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showServiceDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | [optional] 

### Return type

[**ServiceShowResponse**](ServiceShowResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showServiceReviews**
> ServiceShowResponse showServiceReviews(serviceId)

service with its list of ratings

service with its list of ratings

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final serviceId = 9; // String | 

try {
    final result = api_instance.showServiceReviews(serviceId);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->showServiceReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | [optional] 

### Return type

[**ServiceShowResponse**](ServiceShowResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagsGet**
> TagsResponse tagsGet(lang)

show all tags

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final lang = ar; // String | 

try {
    final result = api_instance.tagsGet(lang);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->tagsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lang** | **String**|  | [optional] 

### Return type

[**TagsResponse**](TagsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
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

final api_instance = PublicApi();
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
    print('Exception when calling PublicApi->updateCartItemQuantity: $e\n');
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

# **uploadFilesPost**
> UploadFilesResponse uploadFilesPost(files)

upload file(s)

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final files = [/path/to/file.txt]; // List<MultipartFile> | 

try {
    final result = api_instance.uploadFilesPost(files);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->uploadFilesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **files** | [**List<MultipartFile>**](MultipartFile.md)|  | [optional] 

### Return type

[**UploadFilesResponse**](UploadFilesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

