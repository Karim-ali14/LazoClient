//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartItemsInner {
  /// Returns a new [CartItemsInner] instance.
  CartItemsInner({
    this.cardPrice,
    this.cartId,
    this.createdAt,
    this.id,
    this.listsTotalPrice,
    this.price,
    this.product,
    this.productId,
    this.quantity,
    this.type,
    this.cartItemTotalBeforeDiscount,
    this.cartItemTotalAfterDiscount,
    this.productSelectedListIds,
    this.productSelectedListItemsIds,
    this.serviceSelectedListIds,
    this.serviceSelectedListItemsIds,
    this.productSelectedListItemsNames,
    this.serviceSelectedListItemsNames,
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
  num? cartItemTotalBeforeDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? cartItemTotalAfterDiscount;

  String? productSelectedListIds;

  String? productSelectedListItemsIds;

  String? serviceSelectedListIds;

  String? serviceSelectedListItemsIds;

  String? productSelectedListItemsNames;

  String? serviceSelectedListItemsNames;

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
  bool operator ==(Object other) => identical(this, other) || other is CartItemsInner &&
     other.cardPrice == cardPrice &&
     other.cartId == cartId &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.listsTotalPrice == listsTotalPrice &&
     other.price == price &&
     other.product == product &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.type == type &&
     other.cartItemTotalBeforeDiscount == cartItemTotalBeforeDiscount &&
     other.cartItemTotalAfterDiscount == cartItemTotalAfterDiscount &&
     other.productSelectedListIds == productSelectedListIds &&
     other.productSelectedListItemsIds == productSelectedListItemsIds &&
     other.serviceSelectedListIds == serviceSelectedListIds &&
     other.serviceSelectedListItemsIds == serviceSelectedListItemsIds &&
     other.productSelectedListItemsNames == productSelectedListItemsNames &&
     other.serviceSelectedListItemsNames == serviceSelectedListItemsNames &&
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
    (product == null ? 0 : product!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (cartItemTotalBeforeDiscount == null ? 0 : cartItemTotalBeforeDiscount!.hashCode) +
    (cartItemTotalAfterDiscount == null ? 0 : cartItemTotalAfterDiscount!.hashCode) +
    (productSelectedListIds == null ? 0 : productSelectedListIds!.hashCode) +
    (productSelectedListItemsIds == null ? 0 : productSelectedListItemsIds!.hashCode) +
    (serviceSelectedListIds == null ? 0 : serviceSelectedListIds!.hashCode) +
    (serviceSelectedListItemsIds == null ? 0 : serviceSelectedListItemsIds!.hashCode) +
    (productSelectedListItemsNames == null ? 0 : productSelectedListItemsNames!.hashCode) +
    (serviceSelectedListItemsNames == null ? 0 : serviceSelectedListItemsNames!.hashCode) +
    (service == null ? 0 : service!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'CartItemsInner[cardPrice=$cardPrice, cartId=$cartId, createdAt=$createdAt, id=$id, listsTotalPrice=$listsTotalPrice, price=$price, product=$product, productId=$productId, quantity=$quantity, type=$type, cartItemTotalBeforeDiscount=$cartItemTotalBeforeDiscount, cartItemTotalAfterDiscount=$cartItemTotalAfterDiscount, productSelectedListIds=$productSelectedListIds, productSelectedListItemsIds=$productSelectedListItemsIds, serviceSelectedListIds=$serviceSelectedListIds, serviceSelectedListItemsIds=$serviceSelectedListItemsIds, productSelectedListItemsNames=$productSelectedListItemsNames, serviceSelectedListItemsNames=$serviceSelectedListItemsNames, service=$service, serviceId=$serviceId, updatedAt=$updatedAt]';

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
    if (this.productSelectedListIds != null) {
      json[r'product_selected_list_ids'] = this.productSelectedListIds;
    } else {
      json[r'product_selected_list_ids'] = null;
    }
    if (this.productSelectedListItemsIds != null) {
      json[r'product_selected_list_items_ids'] = this.productSelectedListItemsIds;
    } else {
      json[r'product_selected_list_items_ids'] = null;
    }
    if (this.serviceSelectedListIds != null) {
      json[r'service_selected_list_ids'] = this.serviceSelectedListIds;
    } else {
      json[r'service_selected_list_ids'] = null;
    }
    if (this.serviceSelectedListItemsIds != null) {
      json[r'service_selected_list_items_ids'] = this.serviceSelectedListItemsIds;
    } else {
      json[r'service_selected_list_items_ids'] = null;
    }
    if (this.productSelectedListItemsNames != null) {
      json[r'product_selected_list_items_names'] = this.productSelectedListItemsNames;
    } else {
      json[r'product_selected_list_items_names'] = null;
    }
    if (this.serviceSelectedListItemsNames != null) {
      json[r'service_selected_list_items_names'] = this.serviceSelectedListItemsNames;
    } else {
      json[r'service_selected_list_items_names'] = null;
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

  /// Returns a new [CartItemsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartItemsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartItemsInner(
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
        product: ProductDetails.fromJson(json[r'product']),
        productId: json[r'product_id'] == null
            ? null
            : num.parse(json[r'product_id'].toString()),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        cartItemTotalBeforeDiscount: json[r'cart_item_total_before_discount'] == null
            ? null
            : num.parse(json[r'cart_item_total_before_discount'].toString()),
        cartItemTotalAfterDiscount: json[r'cart_item_total_after_discount'] == null
            ? null
            : num.parse(json[r'cart_item_total_after_discount'].toString()),
        productSelectedListIds: mapValueOfType<String>(json, r'product_selected_list_ids'),
        productSelectedListItemsIds: mapValueOfType<String>(json, r'product_selected_list_items_ids'),
        serviceSelectedListIds: mapValueOfType<String>(json, r'service_selected_list_ids'),
        serviceSelectedListItemsIds: mapValueOfType<String>(json, r'service_selected_list_items_ids'),
        productSelectedListItemsNames: mapValueOfType<String>(json, r'product_selected_list_items_names'),
        serviceSelectedListItemsNames: mapValueOfType<String>(json, r'service_selected_list_items_names'),
        service: ServiceShowData.fromJson(json[r'service']),
        serviceId: json[r'service_id'] == null
            ? null
            : num.parse(json[r'service_id'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<CartItemsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartItemsInner> mapFromJson(dynamic json) {
    final map = <String, CartItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartItemsInner-objects as value to a dart map
  static Map<String, List<CartItemsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CartItemsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

