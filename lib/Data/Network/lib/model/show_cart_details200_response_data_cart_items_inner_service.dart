//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowCartDetails200ResponseDataCartItemsInnerService {
  /// Returns a new [ShowCartDetails200ResponseDataCartItemsInnerService] instance.
  ShowCartDetails200ResponseDataCartItemsInnerService({
    this.data,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ServiceShowData? data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowCartDetails200ResponseDataCartItemsInnerService &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data == null ? 0 : data!.hashCode);

  @override
  String toString() => 'ShowCartDetails200ResponseDataCartItemsInnerService[data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    return json;
  }

  /// Returns a new [ShowCartDetails200ResponseDataCartItemsInnerService] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowCartDetails200ResponseDataCartItemsInnerService? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowCartDetails200ResponseDataCartItemsInnerService[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowCartDetails200ResponseDataCartItemsInnerService[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowCartDetails200ResponseDataCartItemsInnerService(
        data: ServiceShowData.fromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<ShowCartDetails200ResponseDataCartItemsInnerService> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowCartDetails200ResponseDataCartItemsInnerService>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowCartDetails200ResponseDataCartItemsInnerService.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowCartDetails200ResponseDataCartItemsInnerService> mapFromJson(dynamic json) {
    final map = <String, ShowCartDetails200ResponseDataCartItemsInnerService>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowCartDetails200ResponseDataCartItemsInnerService.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowCartDetails200ResponseDataCartItemsInnerService-objects as value to a dart map
  static Map<String, List<ShowCartDetails200ResponseDataCartItemsInnerService>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowCartDetails200ResponseDataCartItemsInnerService>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowCartDetails200ResponseDataCartItemsInnerService.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

