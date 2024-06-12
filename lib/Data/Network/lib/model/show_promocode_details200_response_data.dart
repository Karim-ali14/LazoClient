//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowPromocodeDetails200ResponseData {
  /// Returns a new [ShowPromocodeDetails200ResponseData] instance.
  ShowPromocodeDetails200ResponseData({
    this.allowedUsageNumber,
    this.code,
    this.createdAt,
    this.expirationDate,
    this.id,
    this.type,
    this.updatedAt,
    this.value,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? allowedUsageNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

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
  String? expirationDate;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowPromocodeDetails200ResponseData &&
     other.allowedUsageNumber == allowedUsageNumber &&
     other.code == code &&
     other.createdAt == createdAt &&
     other.expirationDate == expirationDate &&
     other.id == id &&
     other.type == type &&
     other.updatedAt == updatedAt &&
     other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (allowedUsageNumber == null ? 0 : allowedUsageNumber!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (expirationDate == null ? 0 : expirationDate!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'ShowPromocodeDetails200ResponseData[allowedUsageNumber=$allowedUsageNumber, code=$code, createdAt=$createdAt, expirationDate=$expirationDate, id=$id, type=$type, updatedAt=$updatedAt, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowedUsageNumber != null) {
      json[r'allowed_usage_number'] = this.allowedUsageNumber;
    } else {
      json[r'allowed_usage_number'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.expirationDate != null) {
      json[r'expiration_date'] = this.expirationDate;
    } else {
      json[r'expiration_date'] = null;
    }
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
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [ShowPromocodeDetails200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowPromocodeDetails200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowPromocodeDetails200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowPromocodeDetails200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowPromocodeDetails200ResponseData(
        allowedUsageNumber: mapValueOfType<String>(json, r'allowed_usage_number'),
        code: mapValueOfType<String>(json, r'code'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        expirationDate: mapValueOfType<String>(json, r'expiration_date'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        value: json[r'value'] == null
            ? null
            : num.parse(json[r'value'].toString()),
      );
    }
    return null;
  }

  static List<ShowPromocodeDetails200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowPromocodeDetails200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowPromocodeDetails200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowPromocodeDetails200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ShowPromocodeDetails200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowPromocodeDetails200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowPromocodeDetails200ResponseData-objects as value to a dart map
  static Map<String, List<ShowPromocodeDetails200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowPromocodeDetails200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowPromocodeDetails200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

