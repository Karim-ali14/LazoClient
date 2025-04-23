//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateWishlistCollection200ResponseData {
  /// Returns a new [CreateWishlistCollection200ResponseData] instance.
  CreateWishlistCollection200ResponseData({
    this.id,
    this.userId,
    this.tagId,
    this.name,
    this.createdAt,
    this.updatedAt,
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
  num? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? tagId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  String? createdAt;

  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateWishlistCollection200ResponseData &&
    other.id == id &&
    other.userId == userId &&
    other.tagId == tagId &&
    other.name == name &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (tagId == null ? 0 : tagId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'CreateWishlistCollection200ResponseData[id=$id, userId=$userId, tagId=$tagId, name=$name, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.tagId != null) {
      json[r'tag_id'] = this.tagId;
    } else {
      json[r'tag_id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
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
    return json;
  }

  /// Returns a new [CreateWishlistCollection200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateWishlistCollection200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateWishlistCollection200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateWishlistCollection200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateWishlistCollection200ResponseData(
        id: num.tryParse('${json[r'id']}'),
        userId: num.tryParse('${json[r'user_id']}'),
        tagId: num.tryParse('${json[r'tag_id']}'),
        name: mapValueOfType<String>(json, r'name'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<CreateWishlistCollection200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWishlistCollection200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWishlistCollection200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateWishlistCollection200ResponseData> mapFromJson(dynamic json) {
    final map = <String, CreateWishlistCollection200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateWishlistCollection200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateWishlistCollection200ResponseData-objects as value to a dart map
  static Map<String, List<CreateWishlistCollection200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateWishlistCollection200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateWishlistCollection200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

