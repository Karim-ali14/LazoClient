//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner {
  /// Returns a new [ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner] instance.
  ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner({
    this.createdAt,
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.price,
    this.productListId,
    this.updatedAt,
  });

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
  num? id;

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
  String? nameAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? productListId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.name == name &&
     other.nameAr == nameAr &&
     other.nameEn == nameEn &&
     other.price == price &&
     other.productListId == productListId &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (productListId == null ? 0 : productListId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner[createdAt=$createdAt, id=$id, name=$name, nameAr=$nameAr, nameEn=$nameEn, price=$price, productListId=$productListId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.nameAr != null) {
      json[r'name_ar'] = this.nameAr;
    } else {
      json[r'name_ar'] = null;
    }
    if (this.nameEn != null) {
      json[r'name_en'] = this.nameEn;
    } else {
      json[r'name_en'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.productListId != null) {
      json[r'product_list_id'] = this.productListId;
    } else {
      json[r'product_list_id'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        name: mapValueOfType<String>(json, r'name'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        productListId: json[r'product_list_id'] == null
            ? null
            : num.parse(json[r'product_list_id'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner> mapFromJson(dynamic json) {
    final map = <String, ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner-objects as value to a dart map
  static Map<String, List<ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInnerItemsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

