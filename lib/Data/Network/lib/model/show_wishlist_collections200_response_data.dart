//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowWishlistCollections200ResponseData {
  /// Returns a new [ShowWishlistCollections200ResponseData] instance.
  ShowWishlistCollections200ResponseData({
    this.id,
    this.userId,
    this.name,
    this.tagId,
    this.createdAt,
    this.updatedAt,
    this.itemsCount,
    this.items = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tagId;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? itemsCount;

  List<WishlistItem> items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowWishlistCollections200ResponseData &&
    other.id == id &&
    other.userId == userId &&
    other.name == name &&
    other.tagId == tagId &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt &&
    other.itemsCount == itemsCount &&
    _deepEquality.equals(other.items, items);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (tagId == null ? 0 : tagId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (itemsCount == null ? 0 : itemsCount!.hashCode) +
    (items.hashCode);

  @override
  String toString() => 'ShowWishlistCollections200ResponseData[id=$id, userId=$userId, name=$name, tagId=$tagId, createdAt=$createdAt, updatedAt=$updatedAt, itemsCount=$itemsCount, items=$items]';

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
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.tagId != null) {
      json[r'tag_id'] = this.tagId;
    } else {
      json[r'tag_id'] = null;
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
    if (this.itemsCount != null) {
      json[r'items_count'] = this.itemsCount;
    } else {
      json[r'items_count'] = null;
    }
      json[r'items'] = this.items;
    return json;
  }

  /// Returns a new [ShowWishlistCollections200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowWishlistCollections200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowWishlistCollections200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowWishlistCollections200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowWishlistCollections200ResponseData(
        id: mapValueOfType<int>(json, r'id'),
        userId: mapValueOfType<String>(json, r'user_id'),
        name: mapValueOfType<String>(json, r'name'),
        tagId: mapValueOfType<String>(json, r'tag_id'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        itemsCount: mapValueOfType<int>(json, r'items_count'),
        items: WishlistItem.listFromJson(json[r'items']),
      );
    }
    return null;
  }

  static List<ShowWishlistCollections200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowWishlistCollections200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowWishlistCollections200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowWishlistCollections200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ShowWishlistCollections200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowWishlistCollections200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowWishlistCollections200ResponseData-objects as value to a dart map
  static Map<String, List<ShowWishlistCollections200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowWishlistCollections200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowWishlistCollections200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

