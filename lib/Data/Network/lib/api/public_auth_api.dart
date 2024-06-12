//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PublicAuthApi {
  PublicAuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// confirm code
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] confirmCode:
  ///
  /// * [String] accountType:
  ///   client or provider
  Future<Response> codeConfirmPostWithHttpInfo({ String? emailOrPhone, String? confirmCode, String? accountType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/code/confirm';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (confirmCode != null) {
      hasFields = true;
      mp.fields[r'confirm_code'] = parameterToString(confirmCode);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// confirm code
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] confirmCode:
  ///
  /// * [String] accountType:
  ///   client or provider
  Future<CodeConfirmResponse?> codeConfirmPost({ String? emailOrPhone, String? confirmCode, String? accountType, }) async {
    final response = await codeConfirmPostWithHttpInfo( emailOrPhone: emailOrPhone, confirmCode: confirmCode, accountType: accountType, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CodeConfirmResponse',) as CodeConfirmResponse;
    
    }
    return null;
  }

  /// send code
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] accountType:
  Future<Response> codeSendPostWithHttpInfo({ String? emailOrPhone, String? accountType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/code/send';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// send code
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] accountType:
  Future<CodeSendResponse?> codeSendPost({ String? emailOrPhone, String? accountType, }) async {
    final response = await codeSendPostWithHttpInfo( emailOrPhone: emailOrPhone, accountType: accountType, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CodeSendResponse',) as CodeSendResponse;
    
    }
    return null;
  }

  /// provider login
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] password:
  Future<Response> providerLoginPostWithHttpInfo({ String? emailOrPhone, String? password, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/login';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (password != null) {
      hasFields = true;
      mp.fields[r'password'] = parameterToString(password);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// provider login
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] password:
  Future<ProviderLoginResponse?> providerLoginPost({ String? emailOrPhone, String? password, }) async {
    final response = await providerLoginPostWithHttpInfo( emailOrPhone: emailOrPhone, password: password, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProviderLoginResponse',) as ProviderLoginResponse;
    
    }
    return null;
  }

  /// provider signup
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  ///
  /// * [String] ownerName:
  ///
  /// * [String] email:
  ///
  /// * [int] phone:
  ///
  /// * [String] accountType:
  ///   service_provider or packaging_provider
  ///
  /// * [int] password:
  ///
  /// * [int] confirmPassword:
  ///
  /// * [int] cityId:
  ///
  /// * [int] tagsIdsLeftSquareBracket0RightSquareBracket:
  ///
  /// * [int] tagsIdsLeftSquareBracket1RightSquareBracket:
  ///
  /// * [int] hasOfflineStores:
  ///   take 0 or 1
  ///
  /// * [int] offlineStoresNumber:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] locationsLeftSquareBracket0RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] locationsLeftSquareBracket1RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] addressesLeftSquareBracket0RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] addressesLeftSquareBracket1RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [int] provideDelivery:
  ///   take 0 or 1
  ///
  /// * [String] businessType:
  ///   individual or cooperation
  ///
  /// * [String] image:
  ///
  /// * [String] instagramLink:
  ///   optional
  ///
  /// * [String] snapchatLink:
  ///   optional
  ///
  /// * [String] tiktokLink:
  ///   optional
  ///
  /// * [String] xLink:
  ///   optional
  ///
  /// * [String] startTime:
  ///   eg: 02:15 PM
  ///
  /// * [String] endTime:
  ///   eg: 04:00 PM
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket0RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket1RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket2RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [String] selfEmploymentDocument:
  ///   required when business type is individual
  ///
  /// * [String] commercialRegisterImage:
  ///   required when business type is cooperation
  ///
  /// * [String] bankName:
  ///   optional
  ///
  /// * [String] beneficiaryName:
  ///   optional
  ///
  /// * [int] bankAccountNumber:
  ///   optional
  ///
  /// * [int] iban:
  ///
  /// * [String] ibanImage:
  ///   optional
  Future<Response> providerRegisterPostWithHttpInfo({ String? nameEn, String? nameAr, String? ownerName, String? email, int? phone, String? accountType, int? password, int? confirmPassword, int? cityId, int? tagsIdsLeftSquareBracket0RightSquareBracket, int? tagsIdsLeftSquareBracket1RightSquareBracket, int? hasOfflineStores, int? offlineStoresNumber, String? locationsLeftSquareBracket0RightSquareBracket, String? locationsLeftSquareBracket1RightSquareBracket, String? addressesLeftSquareBracket0RightSquareBracket, String? addressesLeftSquareBracket1RightSquareBracket, int? provideDelivery, String? businessType, String? image, String? instagramLink, String? snapchatLink, String? tiktokLink, String? xLink, String? startTime, String? endTime, int? workingDaysIndicesLeftSquareBracket0RightSquareBracket, int? workingDaysIndicesLeftSquareBracket1RightSquareBracket, int? workingDaysIndicesLeftSquareBracket2RightSquareBracket, String? selfEmploymentDocument, String? commercialRegisterImage, String? bankName, String? beneficiaryName, int? bankAccountNumber, int? iban, String? ibanImage, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/register';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (nameEn != null) {
      hasFields = true;
      mp.fields[r'name_en'] = parameterToString(nameEn);
    }
    if (nameAr != null) {
      hasFields = true;
      mp.fields[r'name_ar'] = parameterToString(nameAr);
    }
    if (ownerName != null) {
      hasFields = true;
      mp.fields[r'owner_name'] = parameterToString(ownerName);
    }
    if (email != null) {
      hasFields = true;
      mp.fields[r'email'] = parameterToString(email);
    }
    if (phone != null) {
      hasFields = true;
      mp.fields[r'phone'] = parameterToString(phone);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (password != null) {
      hasFields = true;
      mp.fields[r'password'] = parameterToString(password);
    }
    if (confirmPassword != null) {
      hasFields = true;
      mp.fields[r'confirm_password'] = parameterToString(confirmPassword);
    }
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
    }
    if (tagsIdsLeftSquareBracket0RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'tags_ids[0]'] = parameterToString(tagsIdsLeftSquareBracket0RightSquareBracket);
    }
    if (tagsIdsLeftSquareBracket1RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'tags_ids[1]'] = parameterToString(tagsIdsLeftSquareBracket1RightSquareBracket);
    }
    if (hasOfflineStores != null) {
      hasFields = true;
      mp.fields[r'has_offline_stores'] = parameterToString(hasOfflineStores);
    }
    if (offlineStoresNumber != null) {
      hasFields = true;
      mp.fields[r'offline_stores_number'] = parameterToString(offlineStoresNumber);
    }
    if (locationsLeftSquareBracket0RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'locations[0]'] = parameterToString(locationsLeftSquareBracket0RightSquareBracket);
    }
    if (locationsLeftSquareBracket1RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'locations[1]'] = parameterToString(locationsLeftSquareBracket1RightSquareBracket);
    }
    if (addressesLeftSquareBracket0RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'addresses[0]'] = parameterToString(addressesLeftSquareBracket0RightSquareBracket);
    }
    if (addressesLeftSquareBracket1RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'addresses[1]'] = parameterToString(addressesLeftSquareBracket1RightSquareBracket);
    }
    if (provideDelivery != null) {
      hasFields = true;
      mp.fields[r'provide_delivery'] = parameterToString(provideDelivery);
    }
    if (businessType != null) {
      hasFields = true;
      mp.fields[r'business_type'] = parameterToString(businessType);
    }
    if (image != null) {
      hasFields = true;
      mp.fields[r'image'] = parameterToString(image);
    }
    if (instagramLink != null) {
      hasFields = true;
      mp.fields[r'instagram_link'] = parameterToString(instagramLink);
    }
    if (snapchatLink != null) {
      hasFields = true;
      mp.fields[r'snapchat_link'] = parameterToString(snapchatLink);
    }
    if (tiktokLink != null) {
      hasFields = true;
      mp.fields[r'tiktok_link'] = parameterToString(tiktokLink);
    }
    if (xLink != null) {
      hasFields = true;
      mp.fields[r'x_link'] = parameterToString(xLink);
    }
    if (startTime != null) {
      hasFields = true;
      mp.fields[r'start_time'] = parameterToString(startTime);
    }
    if (endTime != null) {
      hasFields = true;
      mp.fields[r'end_time'] = parameterToString(endTime);
    }
    if (workingDaysIndicesLeftSquareBracket0RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'working_days_indices[0]'] = parameterToString(workingDaysIndicesLeftSquareBracket0RightSquareBracket);
    }
    if (workingDaysIndicesLeftSquareBracket1RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'working_days_indices[1]'] = parameterToString(workingDaysIndicesLeftSquareBracket1RightSquareBracket);
    }
    if (workingDaysIndicesLeftSquareBracket2RightSquareBracket != null) {
      hasFields = true;
      mp.fields[r'working_days_indices[2]'] = parameterToString(workingDaysIndicesLeftSquareBracket2RightSquareBracket);
    }
    if (selfEmploymentDocument != null) {
      hasFields = true;
      mp.fields[r'self_employment_document'] = parameterToString(selfEmploymentDocument);
    }
    if (commercialRegisterImage != null) {
      hasFields = true;
      mp.fields[r'commercial_register_image'] = parameterToString(commercialRegisterImage);
    }
    if (bankName != null) {
      hasFields = true;
      mp.fields[r'bank_name'] = parameterToString(bankName);
    }
    if (beneficiaryName != null) {
      hasFields = true;
      mp.fields[r'beneficiary_name'] = parameterToString(beneficiaryName);
    }
    if (bankAccountNumber != null) {
      hasFields = true;
      mp.fields[r'bank_account_number'] = parameterToString(bankAccountNumber);
    }
    if (iban != null) {
      hasFields = true;
      mp.fields[r'iban'] = parameterToString(iban);
    }
    if (ibanImage != null) {
      hasFields = true;
      mp.fields[r'iban_image'] = parameterToString(ibanImage);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// provider signup
  ///
  /// Parameters:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  ///
  /// * [String] ownerName:
  ///
  /// * [String] email:
  ///
  /// * [int] phone:
  ///
  /// * [String] accountType:
  ///   service_provider or packaging_provider
  ///
  /// * [int] password:
  ///
  /// * [int] confirmPassword:
  ///
  /// * [int] cityId:
  ///
  /// * [int] tagsIdsLeftSquareBracket0RightSquareBracket:
  ///
  /// * [int] tagsIdsLeftSquareBracket1RightSquareBracket:
  ///
  /// * [int] hasOfflineStores:
  ///   take 0 or 1
  ///
  /// * [int] offlineStoresNumber:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] locationsLeftSquareBracket0RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] locationsLeftSquareBracket1RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] addressesLeftSquareBracket0RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [String] addressesLeftSquareBracket1RightSquareBracket:
  ///   required incase of has_offline_stores=1
  ///
  /// * [int] provideDelivery:
  ///   take 0 or 1
  ///
  /// * [String] businessType:
  ///   individual or cooperation
  ///
  /// * [String] image:
  ///
  /// * [String] instagramLink:
  ///   optional
  ///
  /// * [String] snapchatLink:
  ///   optional
  ///
  /// * [String] tiktokLink:
  ///   optional
  ///
  /// * [String] xLink:
  ///   optional
  ///
  /// * [String] startTime:
  ///   eg: 02:15 PM
  ///
  /// * [String] endTime:
  ///   eg: 04:00 PM
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket0RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket1RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [int] workingDaysIndicesLeftSquareBracket2RightSquareBracket:
  ///   take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday
  ///
  /// * [String] selfEmploymentDocument:
  ///   required when business type is individual
  ///
  /// * [String] commercialRegisterImage:
  ///   required when business type is cooperation
  ///
  /// * [String] bankName:
  ///   optional
  ///
  /// * [String] beneficiaryName:
  ///   optional
  ///
  /// * [int] bankAccountNumber:
  ///   optional
  ///
  /// * [int] iban:
  ///
  /// * [String] ibanImage:
  ///   optional
  Future<ProviderRegisterResponse?> providerRegisterPost({ String? nameEn, String? nameAr, String? ownerName, String? email, int? phone, String? accountType, int? password, int? confirmPassword, int? cityId, int? tagsIdsLeftSquareBracket0RightSquareBracket, int? tagsIdsLeftSquareBracket1RightSquareBracket, int? hasOfflineStores, int? offlineStoresNumber, String? locationsLeftSquareBracket0RightSquareBracket, String? locationsLeftSquareBracket1RightSquareBracket, String? addressesLeftSquareBracket0RightSquareBracket, String? addressesLeftSquareBracket1RightSquareBracket, int? provideDelivery, String? businessType, String? image, String? instagramLink, String? snapchatLink, String? tiktokLink, String? xLink, String? startTime, String? endTime, int? workingDaysIndicesLeftSquareBracket0RightSquareBracket, int? workingDaysIndicesLeftSquareBracket1RightSquareBracket, int? workingDaysIndicesLeftSquareBracket2RightSquareBracket, String? selfEmploymentDocument, String? commercialRegisterImage, String? bankName, String? beneficiaryName, int? bankAccountNumber, int? iban, String? ibanImage, }) async {
    final response = await providerRegisterPostWithHttpInfo( nameEn: nameEn, nameAr: nameAr, ownerName: ownerName, email: email, phone: phone, accountType: accountType, password: password, confirmPassword: confirmPassword, cityId: cityId, tagsIdsLeftSquareBracket0RightSquareBracket: tagsIdsLeftSquareBracket0RightSquareBracket, tagsIdsLeftSquareBracket1RightSquareBracket: tagsIdsLeftSquareBracket1RightSquareBracket, hasOfflineStores: hasOfflineStores, offlineStoresNumber: offlineStoresNumber, locationsLeftSquareBracket0RightSquareBracket: locationsLeftSquareBracket0RightSquareBracket, locationsLeftSquareBracket1RightSquareBracket: locationsLeftSquareBracket1RightSquareBracket, addressesLeftSquareBracket0RightSquareBracket: addressesLeftSquareBracket0RightSquareBracket, addressesLeftSquareBracket1RightSquareBracket: addressesLeftSquareBracket1RightSquareBracket, provideDelivery: provideDelivery, businessType: businessType, image: image, instagramLink: instagramLink, snapchatLink: snapchatLink, tiktokLink: tiktokLink, xLink: xLink, startTime: startTime, endTime: endTime, workingDaysIndicesLeftSquareBracket0RightSquareBracket: workingDaysIndicesLeftSquareBracket0RightSquareBracket, workingDaysIndicesLeftSquareBracket1RightSquareBracket: workingDaysIndicesLeftSquareBracket1RightSquareBracket, workingDaysIndicesLeftSquareBracket2RightSquareBracket: workingDaysIndicesLeftSquareBracket2RightSquareBracket, selfEmploymentDocument: selfEmploymentDocument, commercialRegisterImage: commercialRegisterImage, bankName: bankName, beneficiaryName: beneficiaryName, bankAccountNumber: bankAccountNumber, iban: iban, ibanImage: ibanImage, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProviderRegisterResponse',) as ProviderRegisterResponse;
    
    }
    return null;
  }

  /// confirm reset code
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] confirmCode:
  ///
  /// * [String] accountType:
  ///   client or provider
  Future<Response> resetCodeConfirmPostWithHttpInfo({ String? emailOrPhone, String? confirmCode, String? accountType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/reset-code/confirm';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (confirmCode != null) {
      hasFields = true;
      mp.fields[r'confirm_code'] = parameterToString(confirmCode);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// confirm reset code
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] confirmCode:
  ///
  /// * [String] accountType:
  ///   client or provider
  Future<ResetCodeConfirmResponse?> resetCodeConfirmPost({ String? emailOrPhone, String? confirmCode, String? accountType, }) async {
    final response = await resetCodeConfirmPostWithHttpInfo( emailOrPhone: emailOrPhone, confirmCode: confirmCode, accountType: accountType, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResetCodeConfirmResponse',) as ResetCodeConfirmResponse;
    
    }
    return null;
  }

  /// send reset code
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] accountType:
  Future<Response> resetCodeSendPostWithHttpInfo({ String? emailOrPhone, String? accountType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/reset-code/send';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// send reset code
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] accountType:
  Future<ResetCodeSendResponse?> resetCodeSendPost({ String? emailOrPhone, String? accountType, }) async {
    final response = await resetCodeSendPostWithHttpInfo( emailOrPhone: emailOrPhone, accountType: accountType, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResetCodeSendResponse',) as ResetCodeSendResponse;
    
    }
    return null;
  }

  /// reset password
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] newPassword:
  ///
  /// * [String] confirmNewPassword:
  ///
  /// * [String] accountType:
  Future<Response> resetPasswordPostWithHttpInfo({ String? emailOrPhone, String? newPassword, String? confirmNewPassword, String? accountType, }) async {
    // ignore: prefer_const_declarations
    final path = r'/reset-password';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (emailOrPhone != null) {
      hasFields = true;
      mp.fields[r'email_or_phone'] = parameterToString(emailOrPhone);
    }
    if (newPassword != null) {
      hasFields = true;
      mp.fields[r'new_password'] = parameterToString(newPassword);
    }
    if (confirmNewPassword != null) {
      hasFields = true;
      mp.fields[r'confirm_new_password'] = parameterToString(confirmNewPassword);
    }
    if (accountType != null) {
      hasFields = true;
      mp.fields[r'account_type'] = parameterToString(accountType);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// reset password
  ///
  /// Parameters:
  ///
  /// * [String] emailOrPhone:
  ///
  /// * [String] newPassword:
  ///
  /// * [String] confirmNewPassword:
  ///
  /// * [String] accountType:
  Future<ResetPasswordResponse?> resetPasswordPost({ String? emailOrPhone, String? newPassword, String? confirmNewPassword, String? accountType, }) async {
    final response = await resetPasswordPostWithHttpInfo( emailOrPhone: emailOrPhone, newPassword: newPassword, confirmNewPassword: confirmNewPassword, accountType: accountType, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResetPasswordResponse',) as ResetPasswordResponse;
    
    }
    return null;
  }
}
