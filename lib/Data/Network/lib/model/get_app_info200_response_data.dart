//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAppInfo200ResponseData {
  /// Returns a new [GetAppInfo200ResponseData] instance.
  GetAppInfo200ResponseData({
    this.providerAppInfo,
    this.clientAppInfo,
    this.faqs = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAppInfo200ResponseDataProviderAppInfo? providerAppInfo;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAppInfo200ResponseDataProviderAppInfo? clientAppInfo;

  List<GetAppInfo200ResponseDataFaqsInner> faqs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAppInfo200ResponseData &&
     other.providerAppInfo == providerAppInfo &&
     other.clientAppInfo == clientAppInfo &&
     other.faqs == faqs;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (providerAppInfo == null ? 0 : providerAppInfo!.hashCode) +
    (clientAppInfo == null ? 0 : clientAppInfo!.hashCode) +
    (faqs.hashCode);

  @override
  String toString() => 'GetAppInfo200ResponseData[providerAppInfo=$providerAppInfo, clientAppInfo=$clientAppInfo, faqs=$faqs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.providerAppInfo != null) {
      json[r'provider_app_info'] = this.providerAppInfo;
    } else {
      json[r'provider_app_info'] = null;
    }
    if (this.clientAppInfo != null) {
      json[r'client_app_info'] = this.clientAppInfo;
    } else {
      json[r'client_app_info'] = null;
    }
      json[r'faqs'] = this.faqs;
    return json;
  }

  /// Returns a new [GetAppInfo200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAppInfo200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetAppInfo200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetAppInfo200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetAppInfo200ResponseData(
        providerAppInfo: GetAppInfo200ResponseDataProviderAppInfo.fromJson(json[r'provider_app_info']),
        clientAppInfo: GetAppInfo200ResponseDataProviderAppInfo.fromJson(json[r'client_app_info']),
        faqs: GetAppInfo200ResponseDataFaqsInner.listFromJson(json[r'faqs']),
      );
    }
    return null;
  }

  static List<GetAppInfo200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAppInfo200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAppInfo200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAppInfo200ResponseData> mapFromJson(dynamic json) {
    final map = <String, GetAppInfo200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAppInfo200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAppInfo200ResponseData-objects as value to a dart map
  static Map<String, List<GetAppInfo200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAppInfo200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAppInfo200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

