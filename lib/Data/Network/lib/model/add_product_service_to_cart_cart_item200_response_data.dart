//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddProductServiceToCartCartItem200ResponseData {
  /// Returns a new [AddProductServiceToCartCartItem200ResponseData] instance.
  AddProductServiceToCartCartItem200ResponseData({
    this.cartItems = const [],
    this.createdAt,
    this.id,
    this.productId,
    this.serviceId,
    this.categoriesIds = const [],
    this.total,
    this.type,
    this.updatedAt,
    this.userId,
    this.sessionId,
    this.shipmentType,
  });

  List<CartItemsInner> cartItems;

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

  int? productId;

  int? serviceId;

  List<String>? categoriesIds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? total;

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
  num? userId;

  String? sessionId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? shipmentType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddProductServiceToCartCartItem200ResponseData &&
     other.cartItems == cartItems &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.productId == productId &&
     other.serviceId == serviceId &&
     other.categoriesIds == categoriesIds &&
     other.total == total &&
     other.type == type &&
     other.updatedAt == updatedAt &&
     other.userId == userId &&
     other.sessionId == sessionId &&
     other.shipmentType == shipmentType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartItems.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (categoriesIds == null ? 0 : categoriesIds!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (sessionId == null ? 0 : sessionId!.hashCode) +
    (shipmentType == null ? 0 : shipmentType!.hashCode);

  @override
  String toString() => 'AddProductServiceToCartCartItem200ResponseData[cartItems=$cartItems, createdAt=$createdAt, id=$id, productId=$productId, serviceId=$serviceId, categoriesIds=$categoriesIds, total=$total, type=$type, updatedAt=$updatedAt, userId=$userId, sessionId=$sessionId, shipmentType=$shipmentType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'cart_items'] = this.cartItems;
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
    if (this.categoriesIds != null) {
      json[r'categories_ids'] = this.categoriesIds;
    } else {
      json[r'categories_ids'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
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
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.sessionId != null) {
      json[r'session_id'] = this.sessionId;
    } else {
      json[r'session_id'] = null;
    }
    if (this.shipmentType != null) {
      json[r'shipment_type'] = this.shipmentType;
    } else {
      json[r'shipment_type'] = null;
    }
    return json;
  }

  /// Returns a new [AddProductServiceToCartCartItem200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddProductServiceToCartCartItem200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddProductServiceToCartCartItem200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddProductServiceToCartCartItem200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddProductServiceToCartCartItem200ResponseData(
        cartItems: CartItemsInner.listFromJson(json[r'cart_items']),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        productId: mapValueOfType<int>(json, r'product_id'),
        serviceId: mapValueOfType<int>(json, r'service_id'),
        categoriesIds: json[r'categories_ids'] is List
            ? (json[r'categories_ids'] as List).cast<String>()
            : const [],
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        userId: json[r'user_id'] == null
            ? null
            : num.parse(json[r'user_id'].toString()),
        sessionId: mapValueOfType<String>(json, r'session_id'),
        shipmentType: mapValueOfType<String>(json, r'shipment_type'),
      );
    }
    return null;
  }

  static List<AddProductServiceToCartCartItem200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddProductServiceToCartCartItem200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddProductServiceToCartCartItem200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddProductServiceToCartCartItem200ResponseData> mapFromJson(dynamic json) {
    final map = <String, AddProductServiceToCartCartItem200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddProductServiceToCartCartItem200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddProductServiceToCartCartItem200ResponseData-objects as value to a dart map
  static Map<String, List<AddProductServiceToCartCartItem200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddProductServiceToCartCartItem200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddProductServiceToCartCartItem200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

