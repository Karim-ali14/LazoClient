//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishlistItem {
  /// Returns a new [WishlistItem] instance.
  WishlistItem({
    this.id,
    this.collectionId,
    this.productId,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
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
  String? collectionId;

  String? productId;

  String? serviceId;

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
  String? imagePath;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WishlistItem &&
    other.id == id &&
    other.collectionId == collectionId &&
    other.productId == productId &&
    other.serviceId == serviceId &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt &&
    other.imagePath == imagePath;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (collectionId == null ? 0 : collectionId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (imagePath == null ? 0 : imagePath!.hashCode);

  @override
  String toString() => 'WishlistItem[id=$id, collectionId=$collectionId, productId=$productId, serviceId=$serviceId, createdAt=$createdAt, updatedAt=$updatedAt, imagePath=$imagePath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.collectionId != null) {
      json[r'collection_id'] = this.collectionId;
    } else {
      json[r'collection_id'] = null;
    }
    if (this.productId != null) {
      json[r'product_id'] = this.productId;
    } else {
      json[r'product_id'] = null;
    }
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
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
    if (this.imagePath != null) {
      json[r'imagePath'] = this.imagePath;
    } else {
      json[r'imagePath'] = null;
    }
    return json;
  }

  /// Returns a new [WishlistItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishlistItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishlistItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishlistItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishlistItem(
        id: mapValueOfType<int>(json, r'id'),
        collectionId: mapValueOfType<String>(json, r'collection_id'),
        productId: mapValueOfType<String>(json, r'product_id'),
        serviceId: mapValueOfType<String>(json, r'service_id'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        imagePath: mapValueOfType<String>(json, r'imagePath'),
      );
    }
    return null;
  }

  static List<WishlistItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishlistItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishlistItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishlistItem> mapFromJson(dynamic json) {
    final map = <String, WishlistItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishlistItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishlistItem-objects as value to a dart map
  static Map<String, List<WishlistItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishlistItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WishlistItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

