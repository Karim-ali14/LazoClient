//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderLoginResponseData {
  /// Returns a new [ProviderLoginResponseData] instance.
  ProviderLoginResponseData({
    this.accessToken,
    this.tokenType,
    this.provider,
    this.isExist,
    this.isVerified,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderData? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isExist;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isVerified;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderLoginResponseData &&
     other.accessToken == accessToken &&
     other.tokenType == tokenType &&
     other.provider == provider &&
     other.isExist == isExist &&
     other.isVerified == isVerified;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken == null ? 0 : accessToken!.hashCode) +
    (tokenType == null ? 0 : tokenType!.hashCode) +
    (provider == null ? 0 : provider!.hashCode) +
    (isExist == null ? 0 : isExist!.hashCode) +
    (isVerified == null ? 0 : isVerified!.hashCode);

  @override
  String toString() => 'ProviderLoginResponseData[accessToken=$accessToken, tokenType=$tokenType, provider=$provider, isExist=$isExist, isVerified=$isVerified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessToken != null) {
      json[r'access_token'] = this.accessToken;
    } else {
      json[r'access_token'] = null;
    }
    if (this.tokenType != null) {
      json[r'token_type'] = this.tokenType;
    } else {
      json[r'token_type'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    if (this.isExist != null) {
      json[r'is_exist'] = this.isExist;
    } else {
      json[r'is_exist'] = null;
    }
    if (this.isVerified != null) {
      json[r'is_verified'] = this.isVerified;
    } else {
      json[r'is_verified'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderLoginResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderLoginResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderLoginResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderLoginResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderLoginResponseData(
        accessToken: mapValueOfType<String>(json, r'access_token'),
        tokenType: mapValueOfType<String>(json, r'token_type'),
        provider: ProviderData.fromJson(json[r'provider']),
        isExist: mapValueOfType<bool>(json, r'is_exist'),
        isVerified: mapValueOfType<bool>(json, r'is_verified'),
      );
    }
    return null;
  }

  static List<ProviderLoginResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderLoginResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderLoginResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderLoginResponseData> mapFromJson(dynamic json) {
    final map = <String, ProviderLoginResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderLoginResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderLoginResponseData-objects as value to a dart map
  static Map<String, List<ProviderLoginResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderLoginResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderLoginResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

