//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowAllServicesWithFilter200Response {
  /// Returns a new [ShowAllServicesWithFilter200Response] instance.
  ShowAllServicesWithFilter200Response({
    this.data,
    this.message,
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShowAllServicesWithFilter200ResponseData? data;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowAllServicesWithFilter200Response &&
     other.data == data &&
     other.message == message &&
     other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data == null ? 0 : data!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'ShowAllServicesWithFilter200Response[data=$data, message=$message, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [ShowAllServicesWithFilter200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowAllServicesWithFilter200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowAllServicesWithFilter200Response[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowAllServicesWithFilter200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowAllServicesWithFilter200Response(
        data: ShowAllServicesWithFilter200ResponseData.fromJson(json[r'data']),
        message: mapValueOfType<String>(json, r'message'),
        status: mapValueOfType<bool>(json, r'status'),
      );
    }
    return null;
  }

  static List<ShowAllServicesWithFilter200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowAllServicesWithFilter200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowAllServicesWithFilter200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowAllServicesWithFilter200Response> mapFromJson(dynamic json) {
    final map = <String, ShowAllServicesWithFilter200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowAllServicesWithFilter200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowAllServicesWithFilter200Response-objects as value to a dart map
  static Map<String, List<ShowAllServicesWithFilter200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowAllServicesWithFilter200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowAllServicesWithFilter200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

