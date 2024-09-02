//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAppInfo200ResponseDataProviderAppInfo {
  /// Returns a new [GetAppInfo200ResponseDataProviderAppInfo] instance.
  GetAppInfo200ResponseDataProviderAppInfo({
    this.id,
    this.type,
    this.termsConditions,
    this.aboutApp,
    this.contactEmail,
    this.contactPhone,
    this.contactWhatsapp,
    this.createdAt,
    this.updatedAt,
    this.termsConditionsPath,
    this.aboutAppPath,
    this.privacyPolicy,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  String? termsConditions;

  String? aboutApp;

  String? contactEmail;

  String? contactPhone;

  String? contactWhatsapp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  String? termsConditionsPath;

  String? aboutAppPath;

  String? privacyPolicy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAppInfo200ResponseDataProviderAppInfo &&
     other.id == id &&
     other.type == type &&
     other.termsConditions == termsConditions &&
     other.aboutApp == aboutApp &&
     other.contactEmail == contactEmail &&
     other.contactPhone == contactPhone &&
     other.contactWhatsapp == contactWhatsapp &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt &&
     other.termsConditionsPath == termsConditionsPath &&
     other.aboutAppPath == aboutAppPath &&
     other.privacyPolicy == privacyPolicy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (termsConditions == null ? 0 : termsConditions!.hashCode) +
    (aboutApp == null ? 0 : aboutApp!.hashCode) +
    (contactEmail == null ? 0 : contactEmail!.hashCode) +
    (contactPhone == null ? 0 : contactPhone!.hashCode) +
    (contactWhatsapp == null ? 0 : contactWhatsapp!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (termsConditionsPath == null ? 0 : termsConditionsPath!.hashCode) +
    (aboutAppPath == null ? 0 : aboutAppPath!.hashCode) +
    (privacyPolicy == null ? 0 : privacyPolicy!.hashCode);

  @override
  String toString() => 'GetAppInfo200ResponseDataProviderAppInfo[id=$id, type=$type, termsConditions=$termsConditions, aboutApp=$aboutApp, contactEmail=$contactEmail, contactPhone=$contactPhone, contactWhatsapp=$contactWhatsapp, createdAt=$createdAt, updatedAt=$updatedAt, termsConditionsPath=$termsConditionsPath, aboutAppPath=$aboutAppPath, privacyPolicy=$privacyPolicy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.termsConditions != null) {
      json[r'terms_conditions'] = this.termsConditions;
    } else {
      json[r'terms_conditions'] = null;
    }
    if (this.aboutApp != null) {
      json[r'about_app'] = this.aboutApp;
    } else {
      json[r'about_app'] = null;
    }
    if (this.contactEmail != null) {
      json[r'contact_email'] = this.contactEmail;
    } else {
      json[r'contact_email'] = null;
    }
    if (this.contactPhone != null) {
      json[r'contact_phone'] = this.contactPhone;
    } else {
      json[r'contact_phone'] = null;
    }
    if (this.contactWhatsapp != null) {
      json[r'contact_whatsapp'] = this.contactWhatsapp;
    } else {
      json[r'contact_whatsapp'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.termsConditionsPath != null) {
      json[r'terms_conditions_path'] = this.termsConditionsPath;
    } else {
      json[r'terms_conditions_path'] = null;
    }
    if (this.aboutAppPath != null) {
      json[r'about_app_path'] = this.aboutAppPath;
    } else {
      json[r'about_app_path'] = null;
    }
    if (this.privacyPolicy != null) {
      json[r'privacy_policy'] = this.privacyPolicy;
    } else {
      json[r'privacy_policy'] = null;
    }
    return json;
  }

  /// Returns a new [GetAppInfo200ResponseDataProviderAppInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAppInfo200ResponseDataProviderAppInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetAppInfo200ResponseDataProviderAppInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetAppInfo200ResponseDataProviderAppInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetAppInfo200ResponseDataProviderAppInfo(
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        termsConditions: mapValueOfType<String>(json, r'terms_conditions'),
        aboutApp: mapValueOfType<String>(json, r'about_app'),
        contactEmail: mapValueOfType<String>(json, r'contact_email'),
        contactPhone: mapValueOfType<String>(json, r'contact_phone'),
        contactWhatsapp: mapValueOfType<String>(json, r'contact_whatsapp'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        termsConditionsPath: mapValueOfType<String>(json, r'terms_conditions_path'),
        aboutAppPath: mapValueOfType<String>(json, r'about_app_path'),
        privacyPolicy: mapValueOfType<String>(json, r'privacy_policy'),
      );
    }
    return null;
  }

  static List<GetAppInfo200ResponseDataProviderAppInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAppInfo200ResponseDataProviderAppInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAppInfo200ResponseDataProviderAppInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAppInfo200ResponseDataProviderAppInfo> mapFromJson(dynamic json) {
    final map = <String, GetAppInfo200ResponseDataProviderAppInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAppInfo200ResponseDataProviderAppInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAppInfo200ResponseDataProviderAppInfo-objects as value to a dart map
  static Map<String, List<GetAppInfo200ResponseDataProviderAppInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAppInfo200ResponseDataProviderAppInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAppInfo200ResponseDataProviderAppInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

