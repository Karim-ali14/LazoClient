# lazo.model.ProviderRegisterRequest

## Load the model package
```dart
import 'package:lazo/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nameEn** | **String** |  | [optional] 
**nameAr** | **String** |  | [optional] 
**ownerName** | **String** |  | [optional] 
**email** | **String** |  | [optional] 
**phone** | **String** |  | [optional] 
**accountType** | **String** |  | [optional] 
**password** | **String** |  | [optional] 
**confirmPassword** | **String** |  | [optional] 
**cityId** | **int** |  | [optional] 
**tagsIds** | **List<int>** |  | [optional] [default to const []]
**hasOfflineStores** | **int** |  | [optional] 
**offlineStoresNumber** | **int** | required incase of has_offline_stores=1 | [optional] 
**locations** | **List<String>** |  | [optional] [default to const []]
**provideDelivery** | **int** |  | [optional] 
**businessType** | **String** |  | [optional] 
**image** | **String** |  | [optional] 
**instagramLink** | **String** |  | [optional] 
**snapchatLink** | **String** |  | [optional] 
**tiktokLink** | **String** |  | [optional] 
**xLink** | **String** |  | [optional] 
**startTime** | **String** | eg: 02:15 PM | [optional] 
**endTime** | **String** | eg: 04:00 PM | [optional] 
**workingDaysIndices** | **List<int>** |  | [optional] [default to const []]
**selfEmploymentDocument** | **String** | required when business type is individual | [optional] 
**commercialRegisterImage** | **String** | required when business type is cooperation | [optional] 
**bankName** | **String** |  | [optional] 
**beneficiaryName** | **String** |  | [optional] 
**bankAccountNumber** | **String** |  | [optional] 
**iban** | **String** |  | [optional] 
**ibanImage** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


