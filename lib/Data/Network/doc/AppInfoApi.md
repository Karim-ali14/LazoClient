# lazo.api.AppInfoApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAppInfo**](AppInfoApi.md#getappinfo) | **GET** /app-info | get app info


# **getAppInfo**
> GetAppInfo200Response getAppInfo()

get app info

get app info

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = AppInfoApi();

try {
    final result = api_instance.getAppInfo();
    print(result);
} catch (e) {
    print('Exception when calling AppInfoApi->getAppInfo: $e\n');
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

