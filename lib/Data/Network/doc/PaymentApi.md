# lazo.api.PaymentApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**paymentVerifyGet**](PaymentApi.md#paymentverifyget) | **GET** /payment/verify | verify payment


# **paymentVerifyGet**
> PaymentVerifyResponse paymentVerifyGet(resourcePath, paymentBrand)

verify payment

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PaymentApi();
final resourcePath = resourcePath_example; // String | 
final paymentBrand = paymentBrand_example; // String | 

try {
    final result = api_instance.paymentVerifyGet(resourcePath, paymentBrand);
    print(result);
} catch (e) {
    print('Exception when calling PaymentApi->paymentVerifyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourcePath** | **String**|  | 
 **paymentBrand** | **String**|  | 

### Return type

[**PaymentVerifyResponse**](PaymentVerifyResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

