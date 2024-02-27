# athletix.api.CitiesApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCitiesList**](CitiesApi.md#getcitieslist) | **GET** /city/all | Get list of cities


# **getCitiesList**
> String getCitiesList()

Get list of cities

Returns list of cities

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = CitiesApi();

try {
    final result = api_instance.getCitiesList();
    print(result);
} catch (e) {
    print('Exception when calling CitiesApi->getCitiesList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

