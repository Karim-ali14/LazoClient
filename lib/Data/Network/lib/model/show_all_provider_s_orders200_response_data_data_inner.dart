//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowAllProviderSOrders200ResponseDataDataInner {
  /// Returns a new [ShowAllProviderSOrders200ResponseDataDataInner] instance.
  ShowAllProviderSOrders200ResponseDataDataInner({
    this.cancellationReason,
    this.createdAt,
    this.deliveryDate,
    this.deliveryTime,
    this.cancelledAt,
    this.finishedAt,
    this.id,
    this.orderFamily,
    this.orderItems = const [],
    this.packagingProviderId,
    this.paymentMethod,
    this.promocode,
    this.promocodeDiscountType,
    this.promocodeDiscountValue,
    this.promocodeId,
    this.rating,
    this.ratingComment,
    this.receiverAddress,
    this.receiverPhoneNumber,
    this.referenceNumber,
    this.shippingFee,
    this.statusId,
    this.total,
    this.totalWithShippingFee,
    this.type,
    this.updatedAt,
    this.user,
    this.userId,
  });

  Object? cancellationReason;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  String? deliveryDate;

  String? deliveryTime;

  String? cancelledAt;

  String? finishedAt;

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
  String? orderFamily;

  List<ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInner> orderItems;

  Object? packagingProviderId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? paymentMethod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShowAllProviderSOrders200ResponseDataDataInnerPromocode? promocode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? promocodeDiscountType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? promocodeDiscountValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? promocodeId;

  Object? rating;

  Object? ratingComment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? receiverAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? receiverPhoneNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? referenceNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? shippingFee;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? statusId;

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
  num? totalWithShippingFee;

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
  ShowAllProviderSOrders200ResponseDataDataInnerUser? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowAllProviderSOrders200ResponseDataDataInner &&
     other.cancellationReason == cancellationReason &&
     other.createdAt == createdAt &&
     other.deliveryDate == deliveryDate &&
     other.deliveryTime == deliveryTime &&
     other.cancelledAt == cancelledAt &&
     other.finishedAt == finishedAt &&
     other.id == id &&
     other.orderFamily == orderFamily &&
     other.orderItems == orderItems &&
     other.packagingProviderId == packagingProviderId &&
     other.paymentMethod == paymentMethod &&
     other.promocode == promocode &&
     other.promocodeDiscountType == promocodeDiscountType &&
     other.promocodeDiscountValue == promocodeDiscountValue &&
     other.promocodeId == promocodeId &&
     other.rating == rating &&
     other.ratingComment == ratingComment &&
     other.receiverAddress == receiverAddress &&
     other.receiverPhoneNumber == receiverPhoneNumber &&
     other.referenceNumber == referenceNumber &&
     other.shippingFee == shippingFee &&
     other.statusId == statusId &&
     other.total == total &&
     other.totalWithShippingFee == totalWithShippingFee &&
     other.type == type &&
     other.updatedAt == updatedAt &&
     other.user == user &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cancellationReason == null ? 0 : cancellationReason!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deliveryDate == null ? 0 : deliveryDate!.hashCode) +
    (deliveryTime == null ? 0 : deliveryTime!.hashCode) +
    (cancelledAt == null ? 0 : cancelledAt!.hashCode) +
    (finishedAt == null ? 0 : finishedAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (orderFamily == null ? 0 : orderFamily!.hashCode) +
    (orderItems.hashCode) +
    (packagingProviderId == null ? 0 : packagingProviderId!.hashCode) +
    (paymentMethod == null ? 0 : paymentMethod!.hashCode) +
    (promocode == null ? 0 : promocode!.hashCode) +
    (promocodeDiscountType == null ? 0 : promocodeDiscountType!.hashCode) +
    (promocodeDiscountValue == null ? 0 : promocodeDiscountValue!.hashCode) +
    (promocodeId == null ? 0 : promocodeId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (ratingComment == null ? 0 : ratingComment!.hashCode) +
    (receiverAddress == null ? 0 : receiverAddress!.hashCode) +
    (receiverPhoneNumber == null ? 0 : receiverPhoneNumber!.hashCode) +
    (referenceNumber == null ? 0 : referenceNumber!.hashCode) +
    (shippingFee == null ? 0 : shippingFee!.hashCode) +
    (statusId == null ? 0 : statusId!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (totalWithShippingFee == null ? 0 : totalWithShippingFee!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'ShowAllProviderSOrders200ResponseDataDataInner[cancellationReason=$cancellationReason, createdAt=$createdAt, deliveryDate=$deliveryDate, deliveryTime=$deliveryTime, cancelledAt=$cancelledAt, finishedAt=$finishedAt, id=$id, orderFamily=$orderFamily, orderItems=$orderItems, packagingProviderId=$packagingProviderId, paymentMethod=$paymentMethod, promocode=$promocode, promocodeDiscountType=$promocodeDiscountType, promocodeDiscountValue=$promocodeDiscountValue, promocodeId=$promocodeId, rating=$rating, ratingComment=$ratingComment, receiverAddress=$receiverAddress, receiverPhoneNumber=$receiverPhoneNumber, referenceNumber=$referenceNumber, shippingFee=$shippingFee, statusId=$statusId, total=$total, totalWithShippingFee=$totalWithShippingFee, type=$type, updatedAt=$updatedAt, user=$user, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cancellationReason != null) {
      json[r'cancellation_reason'] = this.cancellationReason;
    } else {
      json[r'cancellation_reason'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.deliveryDate != null) {
      json[r'delivery_date'] = this.deliveryDate;
    } else {
      json[r'delivery_date'] = null;
    }
    if (this.deliveryTime != null) {
      json[r'delivery_time'] = this.deliveryTime;
    } else {
      json[r'delivery_time'] = null;
    }
    if (this.cancelledAt != null) {
      json[r'cancelled_at'] = this.cancelledAt;
    } else {
      json[r'cancelled_at'] = null;
    }
    if (this.finishedAt != null) {
      json[r'finished_at'] = this.finishedAt;
    } else {
      json[r'finished_at'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.orderFamily != null) {
      json[r'order_family'] = this.orderFamily;
    } else {
      json[r'order_family'] = null;
    }
      json[r'order_items'] = this.orderItems;
    if (this.packagingProviderId != null) {
      json[r'packaging_provider_id'] = this.packagingProviderId;
    } else {
      json[r'packaging_provider_id'] = null;
    }
    if (this.paymentMethod != null) {
      json[r'payment_method'] = this.paymentMethod;
    } else {
      json[r'payment_method'] = null;
    }
    if (this.promocode != null) {
      json[r'promocode'] = this.promocode;
    } else {
      json[r'promocode'] = null;
    }
    if (this.promocodeDiscountType != null) {
      json[r'promocode_discount_type'] = this.promocodeDiscountType;
    } else {
      json[r'promocode_discount_type'] = null;
    }
    if (this.promocodeDiscountValue != null) {
      json[r'promocode_discount_value'] = this.promocodeDiscountValue;
    } else {
      json[r'promocode_discount_value'] = null;
    }
    if (this.promocodeId != null) {
      json[r'promocode_id'] = this.promocodeId;
    } else {
      json[r'promocode_id'] = null;
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
    if (this.receiverAddress != null) {
      json[r'receiver_address'] = this.receiverAddress;
    } else {
      json[r'receiver_address'] = null;
    }
    if (this.receiverPhoneNumber != null) {
      json[r'receiver_phone_number'] = this.receiverPhoneNumber;
    } else {
      json[r'receiver_phone_number'] = null;
    }
    if (this.referenceNumber != null) {
      json[r'reference_number'] = this.referenceNumber;
    } else {
      json[r'reference_number'] = null;
    }
    if (this.shippingFee != null) {
      json[r'shipping_fee'] = this.shippingFee;
    } else {
      json[r'shipping_fee'] = null;
    }
    if (this.statusId != null) {
      json[r'status_id'] = this.statusId;
    } else {
      json[r'status_id'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    if (this.totalWithShippingFee != null) {
      json[r'total_with_shipping_fee'] = this.totalWithShippingFee;
    } else {
      json[r'total_with_shipping_fee'] = null;
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
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    return json;
  }

  /// Returns a new [ShowAllProviderSOrders200ResponseDataDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowAllProviderSOrders200ResponseDataDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowAllProviderSOrders200ResponseDataDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowAllProviderSOrders200ResponseDataDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowAllProviderSOrders200ResponseDataDataInner(
        cancellationReason: mapValueOfType<Object>(json, r'cancellation_reason'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deliveryDate: mapValueOfType<String>(json, r'delivery_date'),
        deliveryTime: mapValueOfType<String>(json, r'delivery_time'),
        cancelledAt: mapValueOfType<String>(json, r'cancelled_at'),
        finishedAt: mapValueOfType<String>(json, r'finished_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        orderFamily: mapValueOfType<String>(json, r'order_family'),
        orderItems: ShowAllProviderSOrders200ResponseDataDataInnerOrderItemsInner.listFromJson(json[r'order_items']),
        packagingProviderId: mapValueOfType<Object>(json, r'packaging_provider_id'),
        paymentMethod: mapValueOfType<String>(json, r'payment_method'),
        promocode: ShowAllProviderSOrders200ResponseDataDataInnerPromocode.fromJson(json[r'promocode']),
        promocodeDiscountType: mapValueOfType<String>(json, r'promocode_discount_type'),
        promocodeDiscountValue: json[r'promocode_discount_value'] == null
            ? null
            : num.parse(json[r'promocode_discount_value'].toString()),
        promocodeId: json[r'promocode_id'] == null
            ? null
            : num.parse(json[r'promocode_id'].toString()),
        rating: mapValueOfType<Object>(json, r'rating'),
        ratingComment: mapValueOfType<Object>(json, r'rating_comment'),
        receiverAddress: mapValueOfType<String>(json, r'receiver_address'),
        receiverPhoneNumber: mapValueOfType<String>(json, r'receiver_phone_number'),
        referenceNumber: mapValueOfType<String>(json, r'reference_number'),
        shippingFee: json[r'shipping_fee'] == null
            ? null
            : num.parse(json[r'shipping_fee'].toString()),
        statusId: json[r'status_id'] == null
            ? null
            : num.parse(json[r'status_id'].toString()),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        totalWithShippingFee: json[r'total_with_shipping_fee'] == null
            ? null
            : num.parse(json[r'total_with_shipping_fee'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        user: ShowAllProviderSOrders200ResponseDataDataInnerUser.fromJson(json[r'user']),
        userId: json[r'user_id'] == null
            ? null
            : num.parse(json[r'user_id'].toString()),
      );
    }
    return null;
  }

  static List<ShowAllProviderSOrders200ResponseDataDataInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowAllProviderSOrders200ResponseDataDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowAllProviderSOrders200ResponseDataDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowAllProviderSOrders200ResponseDataDataInner> mapFromJson(dynamic json) {
    final map = <String, ShowAllProviderSOrders200ResponseDataDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowAllProviderSOrders200ResponseDataDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowAllProviderSOrders200ResponseDataDataInner-objects as value to a dart map
  static Map<String, List<ShowAllProviderSOrders200ResponseDataDataInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowAllProviderSOrders200ResponseDataDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowAllProviderSOrders200ResponseDataDataInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

