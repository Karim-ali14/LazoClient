# athletix.api.DefaultApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**call00a7fc2a7d55091042505f1e124d12e2**](DefaultApi.md#call00a7fc2a7d55091042505f1e124d12e2) | **POST** /city/add | Add City


# **call00a7fc2a7d55091042505f1e124d12e2**
> String call00a7fc2a7d55091042505f1e124d12e2(nameEn, nameAr)

Add City

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = DefaultApi();
final nameEn = nameEn_example; // String | Add a new city English name
final nameAr = nameAr_example; // String | Add a new city Arabic name

try {
    final result = api_instance.call00a7fc2a7d55091042505f1e124d12e2(nameEn, nameAr);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->call00a7fc2a7d55091042505f1e124d12e2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nameEn** | **String**| Add a new city English name | 
 **nameAr** | **String**| Add a new city Arabic name | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

