//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderItemsInner {
  /// Returns a new [OrderItemsInner] instance.
  OrderItemsInner({
    this.cardPrice,
    this.isOutsideDelivery,
    this.deliveryPrice,
    this.cardType,
    this.orderId,
    this.cityId,
    this.createdAt,
    this.id,
    this.listsTotalPrice,
    this.price,
    this.product,
    this.productId,
    this.quantity,
    this.type,
    this.totalPriceBeforeDiscount,
    this.totalPriceAfterDiscount,
    this.productSelectedListIds,
    this.productSelectedListItemsIds,
    this.serviceSelectedListIds,
    this.serviceSelectedListItemsIds,
    this.selectedProductsListItemsNames = const [],
    this.selectedServicesListItemsNames = const [],
    this.service,
    this.serviceId,
    this.updatedAt,
    this.statusId,
    this.rating,
    this.ratingComment,
    this.ratingDate,
    this.isChecked,
  });

  num? cardPrice;

  int? isOutsideDelivery;

  num? deliveryPrice;

  String? cardType;

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
  String? cityId;

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
  num? totalPriceBeforeDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalPriceAfterDiscount;

  String? productSelectedListIds;

  String? productSelectedListItemsIds;

  String? serviceSelectedListIds;

  String? serviceSelectedListItemsIds;

  List<String>? selectedProductsListItemsNames;

  List<String>? selectedServicesListItemsNames;

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

  String? statusId;

  String? rating;

  String? ratingComment;

  String? ratingDate;

  String? isChecked;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderItemsInner &&
    other.cardPrice == cardPrice &&
    other.isOutsideDelivery == isOutsideDelivery &&
    other.deliveryPrice == deliveryPrice &&
    other.cardType == cardType &&
    other.orderId == orderId &&
    other.cityId == cityId &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.listsTotalPrice == listsTotalPrice &&
    other.price == price &&
    other.product == product &&
    other.productId == productId &&
    other.quantity == quantity &&
    other.type == type &&
    other.totalPriceBeforeDiscount == totalPriceBeforeDiscount &&
    other.totalPriceAfterDiscount == totalPriceAfterDiscount &&
    other.productSelectedListIds == productSelectedListIds &&
    other.productSelectedListItemsIds == productSelectedListItemsIds &&
    other.serviceSelectedListIds == serviceSelectedListIds &&
    other.serviceSelectedListItemsIds == serviceSelectedListItemsIds &&
    _deepEquality.equals(other.selectedProductsListItemsNames, selectedProductsListItemsNames) &&
    _deepEquality.equals(other.selectedServicesListItemsNames, selectedServicesListItemsNames) &&
    other.service == service &&
    other.serviceId == serviceId &&
    other.updatedAt == updatedAt &&
    other.statusId == statusId &&
    other.rating == rating &&
    other.ratingComment == ratingComment &&
    other.ratingDate == ratingDate &&
    other.isChecked == isChecked;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cardPrice == null ? 0 : cardPrice!.hashCode) +
    (isOutsideDelivery == null ? 0 : isOutsideDelivery!.hashCode) +
    (deliveryPrice == null ? 0 : deliveryPrice!.hashCode) +
    (cardType == null ? 0 : cardType!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (listsTotalPrice == null ? 0 : listsTotalPrice!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (product == null ? 0 : product!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (totalPriceBeforeDiscount == null ? 0 : totalPriceBeforeDiscount!.hashCode) +
    (totalPriceAfterDiscount == null ? 0 : totalPriceAfterDiscount!.hashCode) +
    (productSelectedListIds == null ? 0 : productSelectedListIds!.hashCode) +
    (productSelectedListItemsIds == null ? 0 : productSelectedListItemsIds!.hashCode) +
    (serviceSelectedListIds == null ? 0 : serviceSelectedListIds!.hashCode) +
    (serviceSelectedListItemsIds == null ? 0 : serviceSelectedListItemsIds!.hashCode) +
    (selectedProductsListItemsNames == null ? 0 : selectedProductsListItemsNames!.hashCode) +
    (selectedServicesListItemsNames == null ? 0 : selectedServicesListItemsNames!.hashCode) +
    (service == null ? 0 : service!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (statusId == null ? 0 : statusId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (ratingComment == null ? 0 : ratingComment!.hashCode) +
    (ratingDate == null ? 0 : ratingDate!.hashCode) +
    (isChecked == null ? 0 : isChecked!.hashCode);

  @override
  String toString() => 'OrderItemsInner[cardPrice=$cardPrice, isOutsideDelivery=$isOutsideDelivery, deliveryPrice=$deliveryPrice, cardType=$cardType, orderId=$orderId, cityId=$cityId, createdAt=$createdAt, id=$id, listsTotalPrice=$listsTotalPrice, price=$price, product=$product, productId=$productId, quantity=$quantity, type=$type, totalPriceBeforeDiscount=$totalPriceBeforeDiscount, totalPriceAfterDiscount=$totalPriceAfterDiscount, productSelectedListIds=$productSelectedListIds, productSelectedListItemsIds=$productSelectedListItemsIds, serviceSelectedListIds=$serviceSelectedListIds, serviceSelectedListItemsIds=$serviceSelectedListItemsIds, selectedProductsListItemsNames=$selectedProductsListItemsNames, selectedServicesListItemsNames=$selectedServicesListItemsNames, service=$service, serviceId=$serviceId, updatedAt=$updatedAt, statusId=$statusId, rating=$rating, ratingComment=$ratingComment, ratingDate=$ratingDate, isChecked=$isChecked]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cardPrice != null) {
      json[r'card_price'] = this.cardPrice;
    } else {
      json[r'card_price'] = null;
    }
    if (this.isOutsideDelivery != null) {
      json[r'is_outside_delivery'] = this.isOutsideDelivery;
    } else {
      json[r'is_outside_delivery'] = null;
    }
    if (this.deliveryPrice != null) {
      json[r'delivery_price'] = this.deliveryPrice;
    } else {
      json[r'delivery_price'] = null;
    }
    if (this.cardType != null) {
      json[r'card_type'] = this.cardType;
    } else {
      json[r'card_type'] = null;
    }
    if (this.orderId != null) {
      json[r'order_id'] = this.orderId;
    } else {
      json[r'order_id'] = null;
    }
    if (this.cityId != null) {
      json[r'city_id'] = this.cityId;
    } else {
      json[r'city_id'] = null;
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
    if (this.totalPriceBeforeDiscount != null) {
      json[r'total_price_before_discount'] = this.totalPriceBeforeDiscount;
    } else {
      json[r'total_price_before_discount'] = null;
    }
    if (this.totalPriceAfterDiscount != null) {
      json[r'total_price_after_discount'] = this.totalPriceAfterDiscount;
    } else {
      json[r'total_price_after_discount'] = null;
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
    if (this.selectedProductsListItemsNames != null) {
      json[r'selected_products_list_items_names'] = this.selectedProductsListItemsNames;
    } else {
      json[r'selected_products_list_items_names'] = null;
    }
    if (this.selectedServicesListItemsNames != null) {
      json[r'selected_services_list_items_names'] = this.selectedServicesListItemsNames;
    } else {
      json[r'selected_services_list_items_names'] = null;
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
    if (this.statusId != null) {
      json[r'status_id'] = this.statusId;
    } else {
      json[r'status_id'] = null;
    }
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
      json[r'rating'] = null;
    }
    if (this.ratingComment != null) {
      json[r'rating_comment'] = this.ratingComment;
    } else {
      json[r'rating_comment'] = null;
    }
    if (this.ratingDate != null) {
      json[r'rating_date'] = this.ratingDate;
    } else {
      json[r'rating_date'] = null;
    }
    if (this.isChecked != null) {
      json[r'is_checked'] = this.isChecked;
    } else {
      json[r'is_checked'] = null;
    }
    return json;
  }

  /// Returns a new [OrderItemsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderItemsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderItemsInner(
        cardPrice: json[r'card_price'] == null
            ? null
            : num.tryParse('${json[r'card_price']}'),
        isOutsideDelivery: mapValueOfType<int>(json, r'is_outside_delivery'),
        deliveryPrice: json[r'delivery_price'] == null
            ? null
            : num.tryParse('${json[r'delivery_price']}'),
        cardType: mapValueOfType<String>(json, r'card_type'),
        orderId: num.tryParse('${json[r'order_id']}'),
        cityId: mapValueOfType<String>(json, r'city_id'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: num.tryParse('${json[r'id']}'),
        listsTotalPrice: num.tryParse('${json[r'lists_total_price']}'),
        price: num.tryParse('${json[r'price']}'),
        product: ProductDetails.fromJson(json[r'product']),
        productId: json[r'product_id'] == null
            ? null
            : num.tryParse('${json[r'product_id']}'),
        quantity: num.tryParse('${json[r'quantity']}'),
        type: mapValueOfType<String>(json, r'type'),
        totalPriceBeforeDiscount: num.tryParse('${json[r'total_price_before_discount']}'),
        totalPriceAfterDiscount: num.tryParse('${json[r'total_price_after_discount']}'),
        productSelectedListIds: mapValueOfType<String>(json, r'product_selected_list_ids'),
        productSelectedListItemsIds: mapValueOfType<String>(json, r'product_selected_list_items_ids'),
        serviceSelectedListIds: mapValueOfType<String>(json, r'service_selected_list_ids'),
        serviceSelectedListItemsIds: mapValueOfType<String>(json, r'service_selected_list_items_ids'),
        selectedProductsListItemsNames: json[r'selected_products_list_items_names'] is Iterable
            ? (json[r'selected_products_list_items_names'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        selectedServicesListItemsNames: json[r'selected_services_list_items_names'] is Iterable
            ? (json[r'selected_services_list_items_names'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        service: ServiceShowData.fromJson(json[r'service']),
        serviceId: json[r'service_id'] == null
            ? null
            : num.tryParse('${json[r'service_id']}'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        statusId: mapValueOfType<String>(json, r'status_id'),
        rating: mapValueOfType<String>(json, r'rating'),
        ratingComment: mapValueOfType<String>(json, r'rating_comment'),
        ratingDate: mapValueOfType<String>(json, r'rating_date'),
        isChecked: mapValueOfType<String>(json, r'is_checked'),
      );
    }
    return null;
  }

  static List<OrderItemsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderItemsInner> mapFromJson(dynamic json) {
    final map = <String, OrderItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderItemsInner-objects as value to a dart map
  static Map<String, List<OrderItemsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrderItemsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

