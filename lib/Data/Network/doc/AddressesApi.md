# lazo.api.AddressesApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showAddresses**](AddressesApi.md#showaddresses) | **GET** /client/addresses | Show user's addresses
[**showAreas**](AddressesApi.md#showareas) | **GET** /areas | list of areas


# **showAddresses**
> ShowAddresses200Response showAddresses()

Show user's addresses

Show addresses

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressesApi();

try {
    final result = api_instance.showAddresses();
    print(result);
} catch (e) {
    print('Exception when calling AddressesApi->showAddresses: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowAddresses200Response**](ShowAddresses200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showAreas**
> ShowAreas200Response showAreas()

list of areas

Show areas

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressesApi();

try {
    final result = api_instance.showAreas();
    print(result);
} catch (e) {
    print('Exception when calling AddressesApi->showAreas: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowAreas200Response**](ShowAreas200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

