# lazo.api.FaqsApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showFaqs**](FaqsApi.md#showfaqs) | **GET** /faqs | show faqs


# **showFaqs**
> ShowFaqs200Response showFaqs()

show faqs

show faqs

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = FaqsApi();

try {
    final result = api_instance.showFaqs();
    print(result);
} catch (e) {
    print('Exception when calling FaqsApi->showFaqs: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowFaqs200Response**](ShowFaqs200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

