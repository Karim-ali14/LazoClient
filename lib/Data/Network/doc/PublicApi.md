# lazo.api.PublicApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**citiesGet**](PublicApi.md#citiesget) | **GET** /cities | show all cities
[**clientLogin**](PublicApi.md#clientlogin) | **POST** /client/login | client login
[**clientSignup**](PublicApi.md#clientsignup) | **POST** /client/register | client signup
[**filterTopProductsServices**](PublicApi.md#filtertopproductsservices) | **POST** /top-products-services/filter | Filter top products & services
[**filterTopSellers**](PublicApi.md#filtertopsellers) | **POST** /top-sellers/filter | Filter top sellers
[**showAllBanners**](PublicApi.md#showallbanners) | **GET** /banners | show all banners
[**showAllCategories**](PublicApi.md#showallcategories) | **GET** /categories | show all categories
[**showAllColors**](PublicApi.md#showallcolors) | **GET** /colors | show all colors
[**showAllGiftBoxes**](PublicApi.md#showallgiftboxes) | **GET** /gift-boxes | Show all gift boxes
[**showAllGiftCards**](PublicApi.md#showallgiftcards) | **GET** /gift-cards | Show all gift cards
[**showAllOccasions**](PublicApi.md#showalloccasions) | **GET** /occasions | show all occasions
[**showAllProducts**](PublicApi.md#showallproducts) | **GET** /products/filter | show all products
[**showAllServicesWithFilter**](PublicApi.md#showallserviceswithfilter) | **GET** /services/filter | show all services (with filter)
[**showAllSizes**](PublicApi.md#showallsizes) | **GET** /sizes | show all sizes
[**showHome**](PublicApi.md#showhome) | **GET** /home | Show home
[**showProductDetails**](PublicApi.md#showproductdetails) | **GET** /product/show | show product details
[**showProductReviews**](PublicApi.md#showproductreviews) | **GET** /product/reviews | product with its list of ratings
[**showPromocodeDetails**](PublicApi.md#showpromocodedetails) | **GET** /promocode/show | show promocode details
[**showServiceDetails**](PublicApi.md#showservicedetails) | **GET** /service/show | show service details
[**showServiceReviews**](PublicApi.md#showservicereviews) | **GET** /service/reviews | service with its list of ratings
[**tagsGet**](PublicApi.md#tagsget) | **GET** /tags | show all tags
[**uploadFilesPost**](PublicApi.md#uploadfilespost) | **POST** /upload/files | upload file(s)


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
> ClientAuthResponse clientLogin(phone)

client login

client login

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final phone = phone_example; // String | 

try {
    final result = api_instance.clientLogin(phone);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->clientLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phone** | **String**|  | [optional] 

### Return type

[**ClientAuthResponse**](ClientAuthResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSignup**
> ClientAuthResponse clientSignup(cityId, email, image, name, phone)

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

try {
    final result = api_instance.clientSignup(cityId, email, image, name, phone);
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

### Return type

[**ClientAuthResponse**](ClientAuthResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

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
> FilterTopSellers200Response filterTopSellers(page, searchByName, categoriesIds, isPromoted, occasionsIds, ratings)

Filter top sellers

Filter top sellers

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicApi();
final page = 8.14; // num | 
final searchByName = searchByName_example; // String | 
final categoriesIds = []; // List<String> | 
final isPromoted = isPromoted_example; // String | 0-not_promoted, 1-promoted
final occasionsIds = []; // List<String> | 
final ratings = []; // List<String> | 

try {
    final result = api_instance.filterTopSellers(page, searchByName, categoriesIds, isPromoted, occasionsIds, ratings);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->filterTopSellers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | [optional] 
 **searchByName** | **String**|  | [optional] 
 **categoriesIds** | [**List<String>**](String.md)|  | [optional] 
 **isPromoted** | **String**| 0-not_promoted, 1-promoted | [optional] 
 **occasionsIds** | [**List<String>**](String.md)|  | [optional] 
 **ratings** | [**List<String>**](String.md)|  | [optional] 

### Return type

[**FilterTopSellers200Response**](FilterTopSellers200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
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

