# lazo.api.AddressApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientAddressDeleteDelete**](AddressApi.md#clientaddressdeletedelete) | **DELETE** /client/address/delete | delete address
[**createAddress**](AddressApi.md#createaddress) | **POST** /client/address/create | create address
[**updateAddress**](AddressApi.md#updateaddress) | **POST** /client/address/update | update address


# **clientAddressDeleteDelete**
> clientAddressDeleteDelete(addressId)

delete address

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final addressId = addressId_example; // String | 

try {
    api_instance.clientAddressDeleteDelete(addressId);
} catch (e) {
    print('Exception when calling AddressApi->clientAddressDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addressId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createAddress**
> CreateAddress200Response createAddress(recipientName, recipientPhone, recipientLandmark, recipientAddress, lat, lng, cityId)

create address

create address

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final recipientName = recipientName_example; // String | 
final recipientPhone = recipientPhone_example; // String | 
final recipientLandmark = recipientLandmark_example; // String | 
final recipientAddress = recipientAddress_example; // String | 
final lat = lat_example; // String | 
final lng = lng_example; // String | 
final cityId = cityId_example; // String | 

try {
    final result = api_instance.createAddress(recipientName, recipientPhone, recipientLandmark, recipientAddress, lat, lng, cityId);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->createAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recipientName** | **String**|  | [optional] 
 **recipientPhone** | **String**|  | [optional] 
 **recipientLandmark** | **String**|  | [optional] 
 **recipientAddress** | **String**|  | [optional] 
 **lat** | **String**|  | [optional] 
 **lng** | **String**|  | [optional] 
 **cityId** | **String**|  | [optional] 

### Return type

[**CreateAddress200Response**](CreateAddress200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAddress**
> UpdateAddress200Response updateAddress(addressId, recipientName, recipientPhone, recipientLandmark, recipientAddress, lat, lng, cityId)

update address

update address

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final addressId = addressId_example; // String | 
final recipientName = recipientName_example; // String | 
final recipientPhone = recipientPhone_example; // String | 
final recipientLandmark = recipientLandmark_example; // String | 
final recipientAddress = recipientAddress_example; // String | 
final lat = lat_example; // String | 
final lng = lng_example; // String | 
final cityId = cityId_example; // String | 

try {
    final result = api_instance.updateAddress(addressId, recipientName, recipientPhone, recipientLandmark, recipientAddress, lat, lng, cityId);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->updateAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addressId** | **String**|  | [optional] 
 **recipientName** | **String**|  | [optional] 
 **recipientPhone** | **String**|  | [optional] 
 **recipientLandmark** | **String**|  | [optional] 
 **recipientAddress** | **String**|  | [optional] 
 **lat** | **String**|  | [optional] 
 **lng** | **String**|  | [optional] 
 **cityId** | **String**|  | [optional] 

### Return type

[**UpdateAddress200Response**](UpdateAddress200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

