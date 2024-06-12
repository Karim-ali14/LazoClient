//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderRegisterRequest {
  /// Returns a new [ProviderRegisterRequest] instance.
  ProviderRegisterRequest({
    this.nameEn,
    this.nameAr,
    this.ownerName,
    this.email,
    this.phone,
    this.accountType,
    this.password,
    this.confirmPassword,
    this.cityId,
    this.tagsIds = const [],
    this.hasOfflineStores,
    this.offlineStoresNumber,
    this.locations = const [],
    this.provideDelivery,
    this.businessType,
    this.image,
    this.instagramLink,
    this.snapchatLink,
    this.tiktokLink,
    this.xLink,
    this.startTime,
    this.endTime,
    this.workingDaysIndices = const [],
    this.selfEmploymentDocument,
    this.commercialRegisterImage,
    this.bankName,
    this.beneficiaryName,
    this.bankAccountNumber,
    this.iban,
    this.ibanImage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ownerName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phone;

  ProviderRegisterRequestAccountTypeEnum? accountType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? confirmPassword;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  List<int> tagsIds;

  ProviderRegisterRequestHasOfflineStoresEnum? hasOfflineStores;

  /// required incase of has_offline_stores=1
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? offlineStoresNumber;

  List<String> locations;

  ProviderRegisterRequestProvideDeliveryEnum? provideDelivery;

  ProviderRegisterRequestBusinessTypeEnum? businessType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? instagramLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? snapchatLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tiktokLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? xLink;

  /// eg: 02:15 PM
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startTime;

  /// eg: 04:00 PM
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endTime;

  List<ProviderRegisterRequestWorkingDaysIndicesEnum> workingDaysIndices;

  /// required when business type is individual
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? selfEmploymentDocument;

  /// required when business type is cooperation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commercialRegisterImage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? bankName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? beneficiaryName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? bankAccountNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iban;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ibanImage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderRegisterRequest &&
     other.nameEn == nameEn &&
     other.nameAr == nameAr &&
     other.ownerName == ownerName &&
     other.email == email &&
     other.phone == phone &&
     other.accountType == accountType &&
     other.password == password &&
     other.confirmPassword == confirmPassword &&
     other.cityId == cityId &&
     other.tagsIds == tagsIds &&
     other.hasOfflineStores == hasOfflineStores &&
     other.offlineStoresNumber == offlineStoresNumber &&
     other.locations == locations &&
     other.provideDelivery == provideDelivery &&
     other.businessType == businessType &&
     other.image == image &&
     other.instagramLink == instagramLink &&
     other.snapchatLink == snapchatLink &&
     other.tiktokLink == tiktokLink &&
     other.xLink == xLink &&
     other.startTime == startTime &&
     other.endTime == endTime &&
     other.workingDaysIndices == workingDaysIndices &&
     other.selfEmploymentDocument == selfEmploymentDocument &&
     other.commercialRegisterImage == commercialRegisterImage &&
     other.bankName == bankName &&
     other.beneficiaryName == beneficiaryName &&
     other.bankAccountNumber == bankAccountNumber &&
     other.iban == iban &&
     other.ibanImage == ibanImage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (ownerName == null ? 0 : ownerName!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (confirmPassword == null ? 0 : confirmPassword!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (tagsIds.hashCode) +
    (hasOfflineStores == null ? 0 : hasOfflineStores!.hashCode) +
    (offlineStoresNumber == null ? 0 : offlineStoresNumber!.hashCode) +
    (locations.hashCode) +
    (provideDelivery == null ? 0 : provideDelivery!.hashCode) +
    (businessType == null ? 0 : businessType!.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (instagramLink == null ? 0 : instagramLink!.hashCode) +
    (snapchatLink == null ? 0 : snapchatLink!.hashCode) +
    (tiktokLink == null ? 0 : tiktokLink!.hashCode) +
    (xLink == null ? 0 : xLink!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (workingDaysIndices.hashCode) +
    (selfEmploymentDocument == null ? 0 : selfEmploymentDocument!.hashCode) +
    (commercialRegisterImage == null ? 0 : commercialRegisterImage!.hashCode) +
    (bankName == null ? 0 : bankName!.hashCode) +
    (beneficiaryName == null ? 0 : beneficiaryName!.hashCode) +
    (bankAccountNumber == null ? 0 : bankAccountNumber!.hashCode) +
    (iban == null ? 0 : iban!.hashCode) +
    (ibanImage == null ? 0 : ibanImage!.hashCode);

  @override
  String toString() => 'ProviderRegisterRequest[nameEn=$nameEn, nameAr=$nameAr, ownerName=$ownerName, email=$email, phone=$phone, accountType=$accountType, password=$password, confirmPassword=$confirmPassword, cityId=$cityId, tagsIds=$tagsIds, hasOfflineStores=$hasOfflineStores, offlineStoresNumber=$offlineStoresNumber, locations=$locations, provideDelivery=$provideDelivery, businessType=$businessType, image=$image, instagramLink=$instagramLink, snapchatLink=$snapchatLink, tiktokLink=$tiktokLink, xLink=$xLink, startTime=$startTime, endTime=$endTime, workingDaysIndices=$workingDaysIndices, selfEmploymentDocument=$selfEmploymentDocument, commercialRegisterImage=$commercialRegisterImage, bankName=$bankName, beneficiaryName=$beneficiaryName, bankAccountNumber=$bankAccountNumber, iban=$iban, ibanImage=$ibanImage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nameEn != null) {
      json[r'name_en'] = this.nameEn;
    } else {
      json[r'name_en'] = null;
    }
    if (this.nameAr != null) {
      json[r'name_ar'] = this.nameAr;
    } else {
      json[r'name_ar'] = null;
    }
    if (this.ownerName != null) {
      json[r'owner_name'] = this.ownerName;
    } else {
      json[r'owner_name'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.accountType != null) {
      json[r'account_type'] = this.accountType;
    } else {
      json[r'account_type'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.confirmPassword != null) {
      json[r'confirm_password'] = this.confirmPassword;
    } else {
      json[r'confirm_password'] = null;
    }
    if (this.cityId != null) {
      json[r'city_id'] = this.cityId;
    } else {
      json[r'city_id'] = null;
    }
      json[r'tags_ids'] = this.tagsIds;
    if (this.hasOfflineStores != null) {
      json[r'has_offline_stores'] = this.hasOfflineStores;
    } else {
      json[r'has_offline_stores'] = null;
    }
    if (this.offlineStoresNumber != null) {
      json[r'offline_stores_number'] = this.offlineStoresNumber;
    } else {
      json[r'offline_stores_number'] = null;
    }
      json[r'locations'] = this.locations;
    if (this.provideDelivery != null) {
      json[r'provide_delivery'] = this.provideDelivery;
    } else {
      json[r'provide_delivery'] = null;
    }
    if (this.businessType != null) {
      json[r'business_type'] = this.businessType;
    } else {
      json[r'business_type'] = null;
    }
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.instagramLink != null) {
      json[r'instagram_link'] = this.instagramLink;
    } else {
      json[r'instagram_link'] = null;
    }
    if (this.snapchatLink != null) {
      json[r'snapchat_link'] = this.snapchatLink;
    } else {
      json[r'snapchat_link'] = null;
    }
    if (this.tiktokLink != null) {
      json[r'tiktok_link'] = this.tiktokLink;
    } else {
      json[r'tiktok_link'] = null;
    }
    if (this.xLink != null) {
      json[r'x_link'] = this.xLink;
    } else {
      json[r'x_link'] = null;
    }
    if (this.startTime != null) {
      json[r'start_time'] = this.startTime;
    } else {
      json[r'start_time'] = null;
    }
    if (this.endTime != null) {
      json[r'end_time'] = this.endTime;
    } else {
      json[r'end_time'] = null;
    }
      json[r'working_days_indices'] = this.workingDaysIndices;
    if (this.selfEmploymentDocument != null) {
      json[r'self_employment_document'] = this.selfEmploymentDocument;
    } else {
      json[r'self_employment_document'] = null;
    }
    if (this.commercialRegisterImage != null) {
      json[r'commercial_register_image'] = this.commercialRegisterImage;
    } else {
      json[r'commercial_register_image'] = null;
    }
    if (this.bankName != null) {
      json[r'bank_name'] = this.bankName;
    } else {
      json[r'bank_name'] = null;
    }
    if (this.beneficiaryName != null) {
      json[r'beneficiary_name'] = this.beneficiaryName;
    } else {
      json[r'beneficiary_name'] = null;
    }
    if (this.bankAccountNumber != null) {
      json[r'bank_account_number'] = this.bankAccountNumber;
    } else {
      json[r'bank_account_number'] = null;
    }
    if (this.iban != null) {
      json[r'iban'] = this.iban;
    } else {
      json[r'iban'] = null;
    }
    if (this.ibanImage != null) {
      json[r'iban_image'] = this.ibanImage;
    } else {
      json[r'iban_image'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderRegisterRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderRegisterRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderRegisterRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderRegisterRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderRegisterRequest(
        nameEn: mapValueOfType<String>(json, r'name_en'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        ownerName: mapValueOfType<String>(json, r'owner_name'),
        email: mapValueOfType<String>(json, r'email'),
        phone: mapValueOfType<String>(json, r'phone'),
        accountType: ProviderRegisterRequestAccountTypeEnum.fromJson(json[r'account_type']),
        password: mapValueOfType<String>(json, r'password'),
        confirmPassword: mapValueOfType<String>(json, r'confirm_password'),
        cityId: mapValueOfType<int>(json, r'city_id'),
        tagsIds: json[r'tags_ids'] is List
            ? (json[r'tags_ids'] as List).cast<int>()
            : const [],
        hasOfflineStores: ProviderRegisterRequestHasOfflineStoresEnum.fromJson(json[r'has_offline_stores']),
        offlineStoresNumber: mapValueOfType<int>(json, r'offline_stores_number'),
        locations: json[r'locations'] is List
            ? (json[r'locations'] as List).cast<String>()
            : const [],
        provideDelivery: ProviderRegisterRequestProvideDeliveryEnum.fromJson(json[r'provide_delivery']),
        businessType: ProviderRegisterRequestBusinessTypeEnum.fromJson(json[r'business_type']),
        image: mapValueOfType<String>(json, r'image'),
        instagramLink: mapValueOfType<String>(json, r'instagram_link'),
        snapchatLink: mapValueOfType<String>(json, r'snapchat_link'),
        tiktokLink: mapValueOfType<String>(json, r'tiktok_link'),
        xLink: mapValueOfType<String>(json, r'x_link'),
        startTime: mapValueOfType<String>(json, r'start_time'),
        endTime: mapValueOfType<String>(json, r'end_time'),
        workingDaysIndices: ProviderRegisterRequestWorkingDaysIndicesEnum.listFromJson(json[r'working_days_indices']),
        selfEmploymentDocument: mapValueOfType<String>(json, r'self_employment_document'),
        commercialRegisterImage: mapValueOfType<String>(json, r'commercial_register_image'),
        bankName: mapValueOfType<String>(json, r'bank_name'),
        beneficiaryName: mapValueOfType<String>(json, r'beneficiary_name'),
        bankAccountNumber: mapValueOfType<String>(json, r'bank_account_number'),
        iban: mapValueOfType<String>(json, r'iban'),
        ibanImage: mapValueOfType<String>(json, r'iban_image'),
      );
    }
    return null;
  }

  static List<ProviderRegisterRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderRegisterRequest> mapFromJson(dynamic json) {
    final map = <String, ProviderRegisterRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderRegisterRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderRegisterRequest-objects as value to a dart map
  static Map<String, List<ProviderRegisterRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderRegisterRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderRegisterRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ProviderRegisterRequestAccountTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ProviderRegisterRequestAccountTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const serviceProvider = ProviderRegisterRequestAccountTypeEnum._(r'service_provider');
  static const packagingProvider = ProviderRegisterRequestAccountTypeEnum._(r'packaging_provider');

  /// List of all possible values in this [enum][ProviderRegisterRequestAccountTypeEnum].
  static const values = <ProviderRegisterRequestAccountTypeEnum>[
    serviceProvider,
    packagingProvider,
  ];

  static ProviderRegisterRequestAccountTypeEnum? fromJson(dynamic value) => ProviderRegisterRequestAccountTypeEnumTypeTransformer().decode(value);

  static List<ProviderRegisterRequestAccountTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequestAccountTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequestAccountTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProviderRegisterRequestAccountTypeEnum] to String,
/// and [decode] dynamic data back to [ProviderRegisterRequestAccountTypeEnum].
class ProviderRegisterRequestAccountTypeEnumTypeTransformer {
  factory ProviderRegisterRequestAccountTypeEnumTypeTransformer() => _instance ??= const ProviderRegisterRequestAccountTypeEnumTypeTransformer._();

  const ProviderRegisterRequestAccountTypeEnumTypeTransformer._();

  String encode(ProviderRegisterRequestAccountTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProviderRegisterRequestAccountTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProviderRegisterRequestAccountTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'service_provider': return ProviderRegisterRequestAccountTypeEnum.serviceProvider;
        case r'packaging_provider': return ProviderRegisterRequestAccountTypeEnum.packagingProvider;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProviderRegisterRequestAccountTypeEnumTypeTransformer] instance.
  static ProviderRegisterRequestAccountTypeEnumTypeTransformer? _instance;
}



class ProviderRegisterRequestHasOfflineStoresEnum {
  /// Instantiate a new enum with the provided [value].
  const ProviderRegisterRequestHasOfflineStoresEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = ProviderRegisterRequestHasOfflineStoresEnum._(0);
  static const number1 = ProviderRegisterRequestHasOfflineStoresEnum._(1);

  /// List of all possible values in this [enum][ProviderRegisterRequestHasOfflineStoresEnum].
  static const values = <ProviderRegisterRequestHasOfflineStoresEnum>[
    number0,
    number1,
  ];

  static ProviderRegisterRequestHasOfflineStoresEnum? fromJson(dynamic value) => ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer().decode(value);

  static List<ProviderRegisterRequestHasOfflineStoresEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequestHasOfflineStoresEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequestHasOfflineStoresEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProviderRegisterRequestHasOfflineStoresEnum] to int,
/// and [decode] dynamic data back to [ProviderRegisterRequestHasOfflineStoresEnum].
class ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer {
  factory ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer() => _instance ??= const ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer._();

  const ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer._();

  int encode(ProviderRegisterRequestHasOfflineStoresEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProviderRegisterRequestHasOfflineStoresEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProviderRegisterRequestHasOfflineStoresEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case 0: return ProviderRegisterRequestHasOfflineStoresEnum.number0;
        case 1: return ProviderRegisterRequestHasOfflineStoresEnum.number1;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer] instance.
  static ProviderRegisterRequestHasOfflineStoresEnumTypeTransformer? _instance;
}



class ProviderRegisterRequestProvideDeliveryEnum {
  /// Instantiate a new enum with the provided [value].
  const ProviderRegisterRequestProvideDeliveryEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = ProviderRegisterRequestProvideDeliveryEnum._(0);
  static const number1 = ProviderRegisterRequestProvideDeliveryEnum._(1);

  /// List of all possible values in this [enum][ProviderRegisterRequestProvideDeliveryEnum].
  static const values = <ProviderRegisterRequestProvideDeliveryEnum>[
    number0,
    number1,
  ];

  static ProviderRegisterRequestProvideDeliveryEnum? fromJson(dynamic value) => ProviderRegisterRequestProvideDeliveryEnumTypeTransformer().decode(value);

  static List<ProviderRegisterRequestProvideDeliveryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequestProvideDeliveryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequestProvideDeliveryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProviderRegisterRequestProvideDeliveryEnum] to int,
/// and [decode] dynamic data back to [ProviderRegisterRequestProvideDeliveryEnum].
class ProviderRegisterRequestProvideDeliveryEnumTypeTransformer {
  factory ProviderRegisterRequestProvideDeliveryEnumTypeTransformer() => _instance ??= const ProviderRegisterRequestProvideDeliveryEnumTypeTransformer._();

  const ProviderRegisterRequestProvideDeliveryEnumTypeTransformer._();

  int encode(ProviderRegisterRequestProvideDeliveryEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProviderRegisterRequestProvideDeliveryEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProviderRegisterRequestProvideDeliveryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case 0: return ProviderRegisterRequestProvideDeliveryEnum.number0;
        case 1: return ProviderRegisterRequestProvideDeliveryEnum.number1;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProviderRegisterRequestProvideDeliveryEnumTypeTransformer] instance.
  static ProviderRegisterRequestProvideDeliveryEnumTypeTransformer? _instance;
}



class ProviderRegisterRequestBusinessTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ProviderRegisterRequestBusinessTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const individual = ProviderRegisterRequestBusinessTypeEnum._(r'individual');
  static const cooperation = ProviderRegisterRequestBusinessTypeEnum._(r'cooperation');

  /// List of all possible values in this [enum][ProviderRegisterRequestBusinessTypeEnum].
  static const values = <ProviderRegisterRequestBusinessTypeEnum>[
    individual,
    cooperation,
  ];

  static ProviderRegisterRequestBusinessTypeEnum? fromJson(dynamic value) => ProviderRegisterRequestBusinessTypeEnumTypeTransformer().decode(value);

  static List<ProviderRegisterRequestBusinessTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequestBusinessTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequestBusinessTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProviderRegisterRequestBusinessTypeEnum] to String,
/// and [decode] dynamic data back to [ProviderRegisterRequestBusinessTypeEnum].
class ProviderRegisterRequestBusinessTypeEnumTypeTransformer {
  factory ProviderRegisterRequestBusinessTypeEnumTypeTransformer() => _instance ??= const ProviderRegisterRequestBusinessTypeEnumTypeTransformer._();

  const ProviderRegisterRequestBusinessTypeEnumTypeTransformer._();

  String encode(ProviderRegisterRequestBusinessTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProviderRegisterRequestBusinessTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProviderRegisterRequestBusinessTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'individual': return ProviderRegisterRequestBusinessTypeEnum.individual;
        case r'cooperation': return ProviderRegisterRequestBusinessTypeEnum.cooperation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProviderRegisterRequestBusinessTypeEnumTypeTransformer] instance.
  static ProviderRegisterRequestBusinessTypeEnumTypeTransformer? _instance;
}


/// take days of week as indices, 0 => Sunday, 1 => Monday, 2 => Tuesday, 3 => Wednesday, 4 => Thursday, 5 => Friday, 6 => Saturday 
class ProviderRegisterRequestWorkingDaysIndicesEnum {
  /// Instantiate a new enum with the provided [value].
  const ProviderRegisterRequestWorkingDaysIndicesEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = ProviderRegisterRequestWorkingDaysIndicesEnum._(0);
  static const number1 = ProviderRegisterRequestWorkingDaysIndicesEnum._(1);
  static const number2 = ProviderRegisterRequestWorkingDaysIndicesEnum._(2);
  static const number3 = ProviderRegisterRequestWorkingDaysIndicesEnum._(3);
  static const number4 = ProviderRegisterRequestWorkingDaysIndicesEnum._(4);
  static const number5 = ProviderRegisterRequestWorkingDaysIndicesEnum._(5);
  static const number6 = ProviderRegisterRequestWorkingDaysIndicesEnum._(6);

  /// List of all possible values in this [enum][ProviderRegisterRequestWorkingDaysIndicesEnum].
  static const values = <ProviderRegisterRequestWorkingDaysIndicesEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
    number5,
    number6,
  ];

  static ProviderRegisterRequestWorkingDaysIndicesEnum? fromJson(dynamic value) => ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer().decode(value);

  static List<ProviderRegisterRequestWorkingDaysIndicesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderRegisterRequestWorkingDaysIndicesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderRegisterRequestWorkingDaysIndicesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProviderRegisterRequestWorkingDaysIndicesEnum] to int,
/// and [decode] dynamic data back to [ProviderRegisterRequestWorkingDaysIndicesEnum].
class ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer {
  factory ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer() => _instance ??= const ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer._();

  const ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer._();

  int encode(ProviderRegisterRequestWorkingDaysIndicesEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProviderRegisterRequestWorkingDaysIndicesEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProviderRegisterRequestWorkingDaysIndicesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case 0: return ProviderRegisterRequestWorkingDaysIndicesEnum.number0;
        case 1: return ProviderRegisterRequestWorkingDaysIndicesEnum.number1;
        case 2: return ProviderRegisterRequestWorkingDaysIndicesEnum.number2;
        case 3: return ProviderRegisterRequestWorkingDaysIndicesEnum.number3;
        case 4: return ProviderRegisterRequestWorkingDaysIndicesEnum.number4;
        case 5: return ProviderRegisterRequestWorkingDaysIndicesEnum.number5;
        case 6: return ProviderRegisterRequestWorkingDaysIndicesEnum.number6;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer] instance.
  static ProviderRegisterRequestWorkingDaysIndicesEnumTypeTransformer? _instance;
}


