# lazo.api.TransactionsApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showtransactions**](TransactionsApi.md#showtransactions) | **GET** /provider/transactions | show transactions


# **showtransactions**
> Showtransactions200Response showtransactions(dateFrom, dateTo, page)

show transactions

show transactions

### Example
```dart
import 'package:lazo/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransactionsApi();
final dateFrom = dateFrom_example; // String | 
final dateTo = dateTo_example; // String | 
final page = page_example; // String | 

try {
    final result = api_instance.showtransactions(dateFrom, dateTo, page);
    print(result);
} catch (e) {
    print('Exception when calling TransactionsApi->showtransactions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dateFrom** | **String**|  | [optional] 
 **dateTo** | **String**|  | [optional] 
 **page** | **String**|  | [optional] 

### Return type

[**Showtransactions200Response**](Showtransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

