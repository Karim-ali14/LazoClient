//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SendPushNotification200ResponseData {
  /// Returns a new [SendPushNotification200ResponseData] instance.
  SendPushNotification200ResponseData({
    this.name,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SendPushNotification200ResponseData &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'SendPushNotification200ResponseData[name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [SendPushNotification200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SendPushNotification200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SendPushNotification200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SendPushNotification200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SendPushNotification200ResponseData(
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<SendPushNotification200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SendPushNotification200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SendPushNotification200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SendPushNotification200ResponseData> mapFromJson(dynamic json) {
    final map = <String, SendPushNotification200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SendPushNotification200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SendPushNotification200ResponseData-objects as value to a dart map
  static Map<String, List<SendPushNotification200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SendPushNotification200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SendPushNotification200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

