# lazo.api.AuthApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientLogin**](AuthApi.md#clientlogin) | **POST** /client/login | client login
[**clientSignup**](AuthApi.md#clientsignup) | **POST** /client/register | client signup


# **clientLogin**
> ClientLogin200Response clientLogin(phone)

client login

client login

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = AuthApi();
final phone = phone_example; // String | 

try {
    final result = api_instance.clientLogin(phone);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->clientLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phone** | **String**|  | [optional] 

### Return type

[**ClientLogin200Response**](ClientLogin200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSignup**
> ClientSignup200Response clientSignup(cityId, email, image, name, phone)

client signup

client signup

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = AuthApi();
final cityId = cityId_example; // String | 
final email = email_example; // String | optional
final image = image_example; // String | optional
final name = name_example; // String | 
final phone = phone_example; // String | 

try {
    final result = api_instance.clientSignup(cityId, email, image, name, phone);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->clientSignup: $e\n');
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

[**ClientSignup200Response**](ClientSignup200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

