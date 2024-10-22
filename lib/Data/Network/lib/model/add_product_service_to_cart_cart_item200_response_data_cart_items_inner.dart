//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddProductServiceToCartCartItem200ResponseDataCartItemsInner {
  /// Returns a new [AddProductServiceToCartCartItem200ResponseDataCartItemsInner] instance.
  AddProductServiceToCartCartItem200ResponseDataCartItemsInner({
    this.cardPrice,
    this.cartId,
    this.createdAt,
    this.id,
    this.listsTotalPrice,
    this.price,
    this.cartItemTotalBeforeDiscount,
    this.cartItemTotalAfterDiscount,
    this.product,
    this.productId,
    this.quantity,
    this.type,
    this.service,
    this.serviceId,
    this.updatedAt,
  });

  num? cardPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? cartId;

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
  num? listsTotalPrice;

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
  num? cartItemTotalBeforeDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? cartItemTotalAfterDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProductDetails? product;

  num? productId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? quantity;

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
  ServiceShowData? service;

  num? serviceId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddProductServiceToCartCartItem200ResponseDataCartItemsInner &&
     other.cardPrice == cardPrice &&
     other.cartId == cartId &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.listsTotalPrice == listsTotalPrice &&
     other.price == price &&
     other.cartItemTotalBeforeDiscount == cartItemTotalBeforeDiscount &&
     other.cartItemTotalAfterDiscount == cartItemTotalAfterDiscount &&
     other.product == product &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.type == type &&
     other.service == service &&
     other.serviceId == serviceId &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cardPrice == null ? 0 : cardPrice!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (listsTotalPrice == null ? 0 : listsTotalPrice!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (cartItemTotalBeforeDiscount == null ? 0 : cartItemTotalBeforeDiscount!.hashCode) +
    (cartItemTotalAfterDiscount == null ? 0 : cartItemTotalAfterDiscount!.hashCode) +
    (product == null ? 0 : product!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (service == null ? 0 : service!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'AddProductServiceToCartCartItem200ResponseDataCartItemsInner[cardPrice=$cardPrice, cartId=$cartId, createdAt=$createdAt, id=$id, listsTotalPrice=$listsTotalPrice, price=$price, cartItemTotalBeforeDiscount=$cartItemTotalBeforeDiscount, cartItemTotalAfterDiscount=$cartItemTotalAfterDiscount, product=$product, productId=$productId, quantity=$quantity, type=$type, service=$service, serviceId=$serviceId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cardPrice != null) {
      json[r'card_price'] = this.cardPrice;
    } else {
      json[r'card_price'] = null;
    }
    if (this.cartId != null) {
      json[r'cart_id'] = this.cartId;
    } else {
      json[r'cart_id'] = null;
    }
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
    if (this.listsTotalPrice != null) {
      json[r'lists_total_price'] = this.listsTotalPrice;
    } else {
      json[r'lists_total_price'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.cartItemTotalBeforeDiscount != null) {
      json[r'cart_item_total_before_discount'] = this.cartItemTotalBeforeDiscount;
    } else {
      json[r'cart_item_total_before_discount'] = null;
    }
    if (this.cartItemTotalAfterDiscount != null) {
      json[r'cart_item_total_after_discount'] = this.cartItemTotalAfterDiscount;
    } else {
      json[r'cart_item_total_after_discount'] = null;
    }
    if (this.product != null) {
      json[r'product'] = this.product;
    } else {
      json[r'product'] = null;
    }
    if (this.productId != null) {
      json[r'product_id'] = this.productId;
    } else {
      json[r'product_id'] = null;
    }
    if (this.quantity != null) {
      json[r'quantity'] = this.quantity;
    } else {
      json[r'quantity'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.service != null) {
      json[r'service'] = this.service;
    } else {
      json[r'service'] = null;
    }
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [AddProductServiceToCartCartItem200ResponseDataCartItemsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddProductServiceToCartCartItem200ResponseDataCartItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddProductServiceToCartCartItem200ResponseDataCartItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddProductServiceToCartCartItem200ResponseDataCartItemsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddProductServiceToCartCartItem200ResponseDataCartItemsInner(
        cardPrice: json[r'card_price'] == null
            ? null
            : num.parse(json[r'card_price'].toString()),
        cartId: json[r'cart_id'] == null
            ? null
            : num.parse(json[r'cart_id'].toString()),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        listsTotalPrice: json[r'lists_total_price'] == null
            ? null
            : num.parse(json[r'lists_total_price'].toString()),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        cartItemTotalBeforeDiscount: json[r'cart_item_total_before_discount'] == null
            ? null
            : num.parse(json[r'cart_item_total_before_discount'].toString()),
        cartItemTotalAfterDiscount: json[r'cart_item_total_after_discount'] == null
            ? null
            : num.parse(json[r'cart_item_total_after_discount'].toString()),
        product: ProductDetails.fromJson(json[r'product']),
        productId: json[r'product_id'] == null
            ? null
            : num.parse(json[r'product_id'].toString()),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        service: ServiceShowData.fromJson(json[r'service']),
        serviceId: json[r'service_id'] == null
            ? null
            : num.parse(json[r'service_id'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<AddProductServiceToCartCartItem200ResponseDataCartItemsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddProductServiceToCartCartItem200ResponseDataCartItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddProductServiceToCartCartItem200ResponseDataCartItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddProductServiceToCartCartItem200ResponseDataCartItemsInner> mapFromJson(dynamic json) {
    final map = <String, AddProductServiceToCartCartItem200ResponseDataCartItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddProductServiceToCartCartItem200ResponseDataCartItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddProductServiceToCartCartItem200ResponseDataCartItemsInner-objects as value to a dart map
  static Map<String, List<AddProductServiceToCartCartItem200ResponseDataCartItemsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddProductServiceToCartCartItem200ResponseDataCartItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddProductServiceToCartCartItem200ResponseDataCartItemsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

