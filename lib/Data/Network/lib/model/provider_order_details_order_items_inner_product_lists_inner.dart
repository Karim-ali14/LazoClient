//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderOrderDetailsOrderItemsInnerProductListsInner {
  /// Returns a new [ProviderOrderDetailsOrderItemsInnerProductListsInner] instance.
  ProviderOrderDetailsOrderItemsInnerProductListsInner({
    this.createdAt,
    this.id,
    this.isMultiSelectable,
    this.items = const [],
    this.maxSelectableItemsNumber,
    this.name,
    this.nameAr,
    this.nameEn,
    this.productId,
    this.totalPrice,
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
  num? isMultiSelectable;

  List<ProviderOrderDetailsOrderItemsInnerProductListsInnerItemsInner> items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? maxSelectableItemsNumber;

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
  num? productId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderOrderDetailsOrderItemsInnerProductListsInner &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.isMultiSelectable == isMultiSelectable &&
     other.items == items &&
     other.maxSelectableItemsNumber == maxSelectableItemsNumber &&
     other.name == name &&
     other.nameAr == nameAr &&
     other.nameEn == nameEn &&
     other.productId == productId &&
     other.totalPrice == totalPrice &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isMultiSelectable == null ? 0 : isMultiSelectable!.hashCode) +
    (items.hashCode) +
    (maxSelectableItemsNumber == null ? 0 : maxSelectableItemsNumber!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (totalPrice == null ? 0 : totalPrice!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ProviderOrderDetailsOrderItemsInnerProductListsInner[createdAt=$createdAt, id=$id, isMultiSelectable=$isMultiSelectable, items=$items, maxSelectableItemsNumber=$maxSelectableItemsNumber, name=$name, nameAr=$nameAr, nameEn=$nameEn, productId=$productId, totalPrice=$totalPrice, updatedAt=$updatedAt]';

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
    if (this.isMultiSelectable != null) {
      json[r'is_multi_selectable'] = this.isMultiSelectable;
    } else {
      json[r'is_multi_selectable'] = null;
    }
      json[r'items'] = this.items;
    if (this.maxSelectableItemsNumber != null) {
      json[r'max_selectable_items_number'] = this.maxSelectableItemsNumber;
    } else {
      json[r'max_selectable_items_number'] = null;
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
    if (this.productId != null) {
      json[r'product_id'] = this.productId;
    } else {
      json[r'product_id'] = null;
    }
    if (this.totalPrice != null) {
      json[r'total_price'] = this.totalPrice;
    } else {
      json[r'total_price'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderOrderDetailsOrderItemsInnerProductListsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderOrderDetailsOrderItemsInnerProductListsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderOrderDetailsOrderItemsInnerProductListsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderOrderDetailsOrderItemsInnerProductListsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderOrderDetailsOrderItemsInnerProductListsInner(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        isMultiSelectable: json[r'is_multi_selectable'] == null
            ? null
            : num.parse(json[r'is_multi_selectable'].toString()),
        items: ProviderOrderDetailsOrderItemsInnerProductListsInnerItemsInner.listFromJson(json[r'items']),
        maxSelectableItemsNumber: json[r'max_selectable_items_number'] == null
            ? null
            : num.parse(json[r'max_selectable_items_number'].toString()),
        name: mapValueOfType<String>(json, r'name'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        productId: json[r'product_id'] == null
            ? null
            : num.parse(json[r'product_id'].toString()),
        totalPrice: json[r'total_price'] == null
            ? null
            : num.parse(json[r'total_price'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ProviderOrderDetailsOrderItemsInnerProductListsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderOrderDetailsOrderItemsInnerProductListsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderOrderDetailsOrderItemsInnerProductListsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderOrderDetailsOrderItemsInnerProductListsInner> mapFromJson(dynamic json) {
    final map = <String, ProviderOrderDetailsOrderItemsInnerProductListsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderOrderDetailsOrderItemsInnerProductListsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderOrderDetailsOrderItemsInnerProductListsInner-objects as value to a dart map
  static Map<String, List<ProviderOrderDetailsOrderItemsInnerProductListsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderOrderDetailsOrderItemsInnerProductListsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderOrderDetailsOrderItemsInnerProductListsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

