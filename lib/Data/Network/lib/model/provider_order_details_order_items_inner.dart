//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderOrderDetailsOrderItemsInner {
  /// Returns a new [ProviderOrderDetailsOrderItemsInner] instance.
  ProviderOrderDetailsOrderItemsInner({
    this.cardPrice,
    this.createdAt,
    this.id,
    this.listsTotalPrice,
    this.orderId,
    this.price,
    this.product,
    this.productSelectedListIds,
    this.productSelectedListItemsIds,
    this.serviceSelectedListIds,
    this.serviceSelectedListItemsIds,
    this.selectedProductsListItemsNames = const [],
    this.selectedServicesListItemsNames = const [],
    this.productId,
    this.providerId,
    this.quantity,
    this.service,
    this.serviceId,
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? cardPrice;

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
  num? orderId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? price;

  ProviderOrderDetailsOrderItemsInnerProduct? product;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? productSelectedListIds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? productSelectedListItemsIds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceSelectedListIds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceSelectedListItemsIds;

  List<String> selectedProductsListItemsNames;

  List<String> selectedServicesListItemsNames;

  num? productId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? providerId;

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
  ProviderOrderDetailsOrderItemsInnerService? service;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? serviceId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderOrderDetailsOrderItemsInner &&
     other.cardPrice == cardPrice &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.listsTotalPrice == listsTotalPrice &&
     other.orderId == orderId &&
     other.price == price &&
     other.product == product &&
     other.productSelectedListIds == productSelectedListIds &&
     other.productSelectedListItemsIds == productSelectedListItemsIds &&
     other.serviceSelectedListIds == serviceSelectedListIds &&
     other.serviceSelectedListItemsIds == serviceSelectedListItemsIds &&
     other.selectedProductsListItemsNames == selectedProductsListItemsNames &&
     other.selectedServicesListItemsNames == selectedServicesListItemsNames &&
     other.productId == productId &&
     other.providerId == providerId &&
     other.quantity == quantity &&
     other.service == service &&
     other.serviceId == serviceId &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cardPrice == null ? 0 : cardPrice!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (listsTotalPrice == null ? 0 : listsTotalPrice!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (product == null ? 0 : product!.hashCode) +
    (productSelectedListIds == null ? 0 : productSelectedListIds!.hashCode) +
    (productSelectedListItemsIds == null ? 0 : productSelectedListItemsIds!.hashCode) +
    (serviceSelectedListIds == null ? 0 : serviceSelectedListIds!.hashCode) +
    (serviceSelectedListItemsIds == null ? 0 : serviceSelectedListItemsIds!.hashCode) +
    (selectedProductsListItemsNames.hashCode) +
    (selectedServicesListItemsNames.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (service == null ? 0 : service!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ProviderOrderDetailsOrderItemsInner[cardPrice=$cardPrice, createdAt=$createdAt, id=$id, listsTotalPrice=$listsTotalPrice, orderId=$orderId, price=$price, product=$product, productSelectedListIds=$productSelectedListIds, productSelectedListItemsIds=$productSelectedListItemsIds, serviceSelectedListIds=$serviceSelectedListIds, serviceSelectedListItemsIds=$serviceSelectedListItemsIds, selectedProductsListItemsNames=$selectedProductsListItemsNames, selectedServicesListItemsNames=$selectedServicesListItemsNames, productId=$productId, providerId=$providerId, quantity=$quantity, service=$service, serviceId=$serviceId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cardPrice != null) {
      json[r'card_price'] = this.cardPrice;
    } else {
      json[r'card_price'] = null;
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
    if (this.orderId != null) {
      json[r'order_id'] = this.orderId;
    } else {
      json[r'order_id'] = null;
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
      json[r'selected_products_list_items_names'] = this.selectedProductsListItemsNames;
      json[r'selected_services_list_items_names'] = this.selectedServicesListItemsNames;
    if (this.productId != null) {
      json[r'product_id'] = this.productId;
    } else {
      json[r'product_id'] = null;
    }
    if (this.providerId != null) {
      json[r'provider_id'] = this.providerId;
    } else {
      json[r'provider_id'] = null;
    }
    if (this.quantity != null) {
      json[r'quantity'] = this.quantity;
    } else {
      json[r'quantity'] = null;
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

  /// Returns a new [ProviderOrderDetailsOrderItemsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderOrderDetailsOrderItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderOrderDetailsOrderItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderOrderDetailsOrderItemsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderOrderDetailsOrderItemsInner(
        cardPrice: json[r'card_price'] == null
            ? null
            : num.parse(json[r'card_price'].toString()),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        listsTotalPrice: json[r'lists_total_price'] == null
            ? null
            : num.parse(json[r'lists_total_price'].toString()),
        orderId: json[r'order_id'] == null
            ? null
            : num.parse(json[r'order_id'].toString()),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        product: ProviderOrderDetailsOrderItemsInnerProduct.fromJson(json[r'product']),
        productSelectedListIds: mapValueOfType<String>(json, r'product_selected_list_ids'),
        productSelectedListItemsIds: mapValueOfType<String>(json, r'product_selected_list_items_ids'),
        serviceSelectedListIds: mapValueOfType<String>(json, r'service_selected_list_ids'),
        serviceSelectedListItemsIds: mapValueOfType<String>(json, r'service_selected_list_items_ids'),
        selectedProductsListItemsNames: json[r'selected_products_list_items_names'] is List
            ? (json[r'selected_products_list_items_names'] as List).cast<String>()
            : const [],
        selectedServicesListItemsNames: json[r'selected_services_list_items_names'] is List
            ? (json[r'selected_services_list_items_names'] as List).cast<String>()
            : const [],
        productId: json[r'product_id'] == null
            ? null
            : num.parse(json[r'product_id'].toString()),
        providerId: json[r'provider_id'] == null
            ? null
            : num.parse(json[r'provider_id'].toString()),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        service: ProviderOrderDetailsOrderItemsInnerService.fromJson(json[r'service']),
        serviceId: json[r'service_id'] == null
            ? null
            : num.parse(json[r'service_id'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ProviderOrderDetailsOrderItemsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderOrderDetailsOrderItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderOrderDetailsOrderItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderOrderDetailsOrderItemsInner> mapFromJson(dynamic json) {
    final map = <String, ProviderOrderDetailsOrderItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderOrderDetailsOrderItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderOrderDetailsOrderItemsInner-objects as value to a dart map
  static Map<String, List<ProviderOrderDetailsOrderItemsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderOrderDetailsOrderItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderOrderDetailsOrderItemsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

