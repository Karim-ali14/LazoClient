//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ToggleProductServiceInWishlist200ResponseData {
  /// Returns a new [ToggleProductServiceInWishlist200ResponseData] instance.
  ToggleProductServiceInWishlist200ResponseData({
    this.id,
    this.userId,
    this.serviceId,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.inWishlist,
    this.categoriesIds = const [],
  });

  num? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? userId;

  num? serviceId;

  num? productId;

  String? createdAt;

  String? updatedAt;

  bool? inWishlist;

  List<String>? categoriesIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ToggleProductServiceInWishlist200ResponseData &&
     other.id == id &&
     other.userId == userId &&
     other.serviceId == serviceId &&
     other.productId == productId &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt &&
     other.inWishlist == inWishlist &&
     other.categoriesIds == categoriesIds;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (inWishlist == null ? 0 : inWishlist!.hashCode) +
    (categoriesIds == null ? 0 : categoriesIds!.hashCode);

  @override
  String toString() => 'ToggleProductServiceInWishlist200ResponseData[id=$id, userId=$userId, serviceId=$serviceId, productId=$productId, createdAt=$createdAt, updatedAt=$updatedAt, inWishlist=$inWishlist, categoriesIds=$categoriesIds]';

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
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
    }
    if (this.productId != null) {
      json[r'product_id'] = this.productId;
    } else {
      json[r'product_id'] = null;
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
    if (this.inWishlist != null) {
      json[r'in_wishlist'] = this.inWishlist;
    } else {
      json[r'in_wishlist'] = null;
    }
    if (this.categoriesIds != null) {
      json[r'categories_ids'] = this.categoriesIds;
    } else {
      json[r'categories_ids'] = null;
    }
    return json;
  }

  /// Returns a new [ToggleProductServiceInWishlist200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ToggleProductServiceInWishlist200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ToggleProductServiceInWishlist200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ToggleProductServiceInWishlist200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ToggleProductServiceInWishlist200ResponseData(
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        userId: json[r'user_id'] == null
            ? null
            : num.parse(json[r'user_id'].toString()),
        serviceId: json[r'service_id'] == null
            ? null
            : num.parse(json[r'service_id'].toString()),
        productId: json[r'product_id'] == null
            ? null
            : num.parse(json[r'product_id'].toString()),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        inWishlist: mapValueOfType<bool>(json, r'in_wishlist'),
        categoriesIds: json[r'categories_ids'] is List
            ? (json[r'categories_ids'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<ToggleProductServiceInWishlist200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ToggleProductServiceInWishlist200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ToggleProductServiceInWishlist200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ToggleProductServiceInWishlist200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ToggleProductServiceInWishlist200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ToggleProductServiceInWishlist200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ToggleProductServiceInWishlist200ResponseData-objects as value to a dart map
  static Map<String, List<ToggleProductServiceInWishlist200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ToggleProductServiceInWishlist200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ToggleProductServiceInWishlist200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

