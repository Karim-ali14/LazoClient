# lazo.api.PublicAuthApi

## Load the API package
```dart
import 'package:lazo/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**codeConfirmPost**](PublicAuthApi.md#codeconfirmpost) | **POST** /code/confirm | confirm code
[**codeSendPost**](PublicAuthApi.md#codesendpost) | **POST** /code/send | send code
[**providerLoginPost**](PublicAuthApi.md#providerloginpost) | **POST** /provider/login | provider login
[**providerRegisterPost**](PublicAuthApi.md#providerregisterpost) | **POST** /provider/register | provider signup
[**resetCodeConfirmPost**](PublicAuthApi.md#resetcodeconfirmpost) | **POST** /reset-code/confirm | confirm reset code
[**resetCodeSendPost**](PublicAuthApi.md#resetcodesendpost) | **POST** /reset-code/send | send reset code
[**resetPasswordPost**](PublicAuthApi.md#resetpasswordpost) | **POST** /reset-password | reset password


# **codeConfirmPost**
> CodeConfirmResponse codeConfirmPost(emailOrPhone, confirmCode, accountType)

confirm code

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final confirmCode = confirmCode_example; // String | 
final accountType = accountType_example; // String | client or provider

try {
    final result = api_instance.codeConfirmPost(emailOrPhone, confirmCode, accountType);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->codeConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **confirmCode** | **String**|  | [optional] 
 **accountType** | **String**| client or provider | [optional] 

### Return type

[**CodeConfirmResponse**](CodeConfirmResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **codeSendPost**
> CodeSendResponse codeSendPost(emailOrPhone, accountType)

send code

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final accountType = accountType_example; // String | 

try {
    final result = api_instance.codeSendPost(emailOrPhone, accountType);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->codeSendPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **accountType** | **String**|  | [optional] 

### Return type

[**CodeSendResponse**](CodeSendResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerLoginPost**
> ProviderLoginResponse providerLoginPost(emailOrPhone, password)

provider login

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final password = password_example; // String | 

try {
    final result = api_instance.providerLoginPost(emailOrPhone, password);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->providerLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **password** | **String**|  | [optional] 

### Return type

[**ProviderLoginResponse**](ProviderLoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerRegisterPost**
> ProviderRegisterResponse providerRegisterPost(nameEn, nameAr, ownerName, email, phone, accountType, password, confirmPassword, cityId, tagsIdsLeftSquareBracket0RightSquareBracket, tagsIdsLeftSquareBracket1RightSquareBracket, hasOfflineStores, offlineStoresNumber, locationsLeftSquareBracket0RightSquareBracket, locationsLeftSquareBracket1RightSquareBracket, addressesLeftSquareBracket0RightSquareBracket, addressesLeftSquareBracket1RightSquareBracket, provideDelivery, businessType, image, instagramLink, snapchatLink, tiktokLink, xLink, startTime, endTime, workingDaysIndicesLeftSquareBracket0RightSquareBracket, workingDaysIndicesLeftSquareBracket1RightSquareBracket, workingDaysIndicesLeftSquareBracket2RightSquareBracket, selfEmploymentDocument, commercialRegisterImage, bankName, beneficiaryName, bankAccountNumber, iban, ibanImage)

provider signup

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final nameEn = nameEn_example; // String | 
final nameAr = nameAr_example; // String | 
final ownerName = ownerName_example; // String | 
final email = email_example; // String | 
final phone = 56; // int | 
final accountType = accountType_example; // String | service_provider or packaging_provider
final password = 56; // int | 
final confirmPassword = 56; // int | 
final cityId = 56; // int | 
final tagsIdsLeftSquareBracket0RightSquareBracket = 56; // int | 
final tagsIdsLeftSquareBracket1RightSquareBracket = 56; // int | 
final hasOfflineStores = 56; // int | take 0 or 1
final offlineStoresNumber = 56; // int | required incase of has_offline_stores=1
final locationsLeftSquareBracket0RightSquareBracket = locationsLeftSquareBracket0RightSquareBracket_example; // String | required incase of has_offline_stores=1
final locationsLeftSquareBracket1RightSquareBracket = locationsLeftSquareBracket1RightSquareBracket_example; // String | required incase of has_offline_stores=1
final addressesLeftSquareBracket0RightSquareBracket = addressesLeftSquareBracket0RightSquareBracket_example; // String | required incase of has_offline_stores=1
final addressesLeftSquareBracket1RightSquareBracket = addressesLeftSquareBracket1RightSquareBracket_example; // String | required incase of has_offline_stores=1
final provideDelivery = 56; // int | take 0 or 1
final businessType = businessType_example; // String | individual or cooperation
final image = image_example; // String | 
final instagramLink = instagramLink_example; // String | optional
final snapchatLink = snapchatLink_example; // String | optional
final tiktokLink = tiktokLink_example; // String | optional
final xLink = xLink_example; // String | optional
final startTime = startTime_example; // String | eg: 02:15 PM
final endTime = endTime_example; // String | eg: 04:00 PM
final workingDaysIndicesLeftSquareBracket0RightSquareBracket = 56; // int | take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
final workingDaysIndicesLeftSquareBracket1RightSquareBracket = 56; // int | take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
final workingDaysIndicesLeftSquareBracket2RightSquareBracket = 56; // int | take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
final selfEmploymentDocument = selfEmploymentDocument_example; // String | required when business type is individual
final commercialRegisterImage = commercialRegisterImage_example; // String | required when business type is cooperation
final bankName = bankName_example; // String | optional
final beneficiaryName = beneficiaryName_example; // String | optional
final bankAccountNumber = 56; // int | optional
final iban = 56; // int | 
final ibanImage = ibanImage_example; // String | optional

try {
    final result = api_instance.providerRegisterPost(nameEn, nameAr, ownerName, email, phone, accountType, password, confirmPassword, cityId, tagsIdsLeftSquareBracket0RightSquareBracket, tagsIdsLeftSquareBracket1RightSquareBracket, hasOfflineStores, offlineStoresNumber, locationsLeftSquareBracket0RightSquareBracket, locationsLeftSquareBracket1RightSquareBracket, addressesLeftSquareBracket0RightSquareBracket, addressesLeftSquareBracket1RightSquareBracket, provideDelivery, businessType, image, instagramLink, snapchatLink, tiktokLink, xLink, startTime, endTime, workingDaysIndicesLeftSquareBracket0RightSquareBracket, workingDaysIndicesLeftSquareBracket1RightSquareBracket, workingDaysIndicesLeftSquareBracket2RightSquareBracket, selfEmploymentDocument, commercialRegisterImage, bankName, beneficiaryName, bankAccountNumber, iban, ibanImage);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->providerRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nameEn** | **String**|  | [optional] 
 **nameAr** | **String**|  | [optional] 
 **ownerName** | **String**|  | [optional] 
 **email** | **String**|  | [optional] 
 **phone** | **int**|  | [optional] 
 **accountType** | **String**| service_provider or packaging_provider | [optional] 
 **password** | **int**|  | [optional] 
 **confirmPassword** | **int**|  | [optional] 
 **cityId** | **int**|  | [optional] 
 **tagsIdsLeftSquareBracket0RightSquareBracket** | **int**|  | [optional] 
 **tagsIdsLeftSquareBracket1RightSquareBracket** | **int**|  | [optional] 
 **hasOfflineStores** | **int**| take 0 or 1 | [optional] 
 **offlineStoresNumber** | **int**| required incase of has_offline_stores=1 | [optional] 
 **locationsLeftSquareBracket0RightSquareBracket** | **String**| required incase of has_offline_stores=1 | [optional] 
 **locationsLeftSquareBracket1RightSquareBracket** | **String**| required incase of has_offline_stores=1 | [optional] 
 **addressesLeftSquareBracket0RightSquareBracket** | **String**| required incase of has_offline_stores=1 | [optional] 
 **addressesLeftSquareBracket1RightSquareBracket** | **String**| required incase of has_offline_stores=1 | [optional] 
 **provideDelivery** | **int**| take 0 or 1 | [optional] 
 **businessType** | **String**| individual or cooperation | [optional] 
 **image** | **String**|  | [optional] 
 **instagramLink** | **String**| optional | [optional] 
 **snapchatLink** | **String**| optional | [optional] 
 **tiktokLink** | **String**| optional | [optional] 
 **xLink** | **String**| optional | [optional] 
 **startTime** | **String**| eg: 02:15 PM | [optional] 
 **endTime** | **String**| eg: 04:00 PM | [optional] 
 **workingDaysIndicesLeftSquareBracket0RightSquareBracket** | **int**| take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday | [optional] 
 **workingDaysIndicesLeftSquareBracket1RightSquareBracket** | **int**| take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday | [optional] 
 **workingDaysIndicesLeftSquareBracket2RightSquareBracket** | **int**| take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday | [optional] 
 **selfEmploymentDocument** | **String**| required when business type is individual | [optional] 
 **commercialRegisterImage** | **String**| required when business type is cooperation | [optional] 
 **bankName** | **String**| optional | [optional] 
 **beneficiaryName** | **String**| optional | [optional] 
 **bankAccountNumber** | **int**| optional | [optional] 
 **iban** | **int**|  | [optional] 
 **ibanImage** | **String**| optional | [optional] 

### Return type

[**ProviderRegisterResponse**](ProviderRegisterResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetCodeConfirmPost**
> ResetCodeConfirmResponse resetCodeConfirmPost(emailOrPhone, confirmCode, accountType)

confirm reset code

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final confirmCode = confirmCode_example; // String | 
final accountType = accountType_example; // String | client or provider

try {
    final result = api_instance.resetCodeConfirmPost(emailOrPhone, confirmCode, accountType);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->resetCodeConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **confirmCode** | **String**|  | [optional] 
 **accountType** | **String**| client or provider | [optional] 

### Return type

[**ResetCodeConfirmResponse**](ResetCodeConfirmResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetCodeSendPost**
> ResetCodeSendResponse resetCodeSendPost(emailOrPhone, accountType)

send reset code

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final accountType = accountType_example; // String | 

try {
    final result = api_instance.resetCodeSendPost(emailOrPhone, accountType);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->resetCodeSendPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **accountType** | **String**|  | [optional] 

### Return type

[**ResetCodeSendResponse**](ResetCodeSendResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPasswordPost**
> ResetPasswordResponse resetPasswordPost(emailOrPhone, newPassword, confirmNewPassword, accountType)

reset password

### Example
```dart
import 'package:lazo/api.dart';

final api_instance = PublicAuthApi();
final emailOrPhone = emailOrPhone_example; // String | 
final newPassword = newPassword_example; // String | 
final confirmNewPassword = confirmNewPassword_example; // String | 
final accountType = accountType_example; // String | 

try {
    final result = api_instance.resetPasswordPost(emailOrPhone, newPassword, confirmNewPassword, accountType);
    print(result);
} catch (e) {
    print('Exception when calling PublicAuthApi->resetPasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailOrPhone** | **String**|  | [optional] 
 **newPassword** | **String**|  | [optional] 
 **confirmNewPassword** | **String**|  | [optional] 
 **accountType** | **String**|  | [optional] 

### Return type

[**ResetPasswordResponse**](ResetPasswordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

