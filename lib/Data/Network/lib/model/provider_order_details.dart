//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderOrderDetails {
  /// Returns a new [ProviderOrderDetails] instance.
  ProviderOrderDetails({
    this.cancellationReason,
    this.cancelledBy,
    this.createdAt,
    this.deliveryDate,
    this.deliveryTime,
    this.finishedAt,
    this.cancelledAt,
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
    this.latLng,
    this.receiverPhoneNumber,
    this.receiverAddressDetails,
    this.receiverName,
    this.referenceNumber,
    this.shippingFee,
    this.statusId,
    this.rejectedProvidersIds,
    this.rejectedOrderItems,
    this.totalBeforeDiscount,
    this.discount,
    this.total,
    this.totalWithShippingFee,
    this.type,
    this.updatedAt,
    this.user,
    this.userId,
    this.giftBox,
    this.giftCard,
  });

  String? cancellationReason;

  String? cancelledBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  String? deliveryDate;

  String? deliveryTime;

  String? finishedAt;

  String? cancelledAt;

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

  List<ProviderOrderDetailsOrderItemsInner> orderItems;

  num? packagingProviderId;

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
  ProviderOrderDetailsPromocode? promocode;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? rating;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ratingComment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? receiverAddress;

  String? latLng;

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
  String? receiverAddressDetails;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? receiverName;

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
  String? rejectedProvidersIds;

  String? rejectedOrderItems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalBeforeDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? discount;

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
  ProviderOrderDetailsUser? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? userId;

  ProviderOrderDetailsGiftBox? giftBox;

  ProviderOrderDetailsGiftBox? giftCard;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderOrderDetails &&
     other.cancellationReason == cancellationReason &&
     other.cancelledBy == cancelledBy &&
     other.createdAt == createdAt &&
     other.deliveryDate == deliveryDate &&
     other.deliveryTime == deliveryTime &&
     other.finishedAt == finishedAt &&
     other.cancelledAt == cancelledAt &&
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
     other.latLng == latLng &&
     other.receiverPhoneNumber == receiverPhoneNumber &&
     other.receiverAddressDetails == receiverAddressDetails &&
     other.receiverName == receiverName &&
     other.referenceNumber == referenceNumber &&
     other.shippingFee == shippingFee &&
     other.statusId == statusId &&
     other.rejectedProvidersIds == rejectedProvidersIds &&
     other.rejectedOrderItems == rejectedOrderItems &&
     other.totalBeforeDiscount == totalBeforeDiscount &&
     other.discount == discount &&
     other.total == total &&
     other.totalWithShippingFee == totalWithShippingFee &&
     other.type == type &&
     other.updatedAt == updatedAt &&
     other.user == user &&
     other.userId == userId &&
     other.giftBox == giftBox &&
     other.giftCard == giftCard;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cancellationReason == null ? 0 : cancellationReason!.hashCode) +
    (cancelledBy == null ? 0 : cancelledBy!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deliveryDate == null ? 0 : deliveryDate!.hashCode) +
    (deliveryTime == null ? 0 : deliveryTime!.hashCode) +
    (finishedAt == null ? 0 : finishedAt!.hashCode) +
    (cancelledAt == null ? 0 : cancelledAt!.hashCode) +
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
    (latLng == null ? 0 : latLng!.hashCode) +
    (receiverPhoneNumber == null ? 0 : receiverPhoneNumber!.hashCode) +
    (receiverAddressDetails == null ? 0 : receiverAddressDetails!.hashCode) +
    (receiverName == null ? 0 : receiverName!.hashCode) +
    (referenceNumber == null ? 0 : referenceNumber!.hashCode) +
    (shippingFee == null ? 0 : shippingFee!.hashCode) +
    (statusId == null ? 0 : statusId!.hashCode) +
    (rejectedProvidersIds == null ? 0 : rejectedProvidersIds!.hashCode) +
    (rejectedOrderItems == null ? 0 : rejectedOrderItems!.hashCode) +
    (totalBeforeDiscount == null ? 0 : totalBeforeDiscount!.hashCode) +
    (discount == null ? 0 : discount!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (totalWithShippingFee == null ? 0 : totalWithShippingFee!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (giftBox == null ? 0 : giftBox!.hashCode) +
    (giftCard == null ? 0 : giftCard!.hashCode);

  @override
  String toString() => 'ProviderOrderDetails[cancellationReason=$cancellationReason, cancelledBy=$cancelledBy, createdAt=$createdAt, deliveryDate=$deliveryDate, deliveryTime=$deliveryTime, finishedAt=$finishedAt, cancelledAt=$cancelledAt, id=$id, orderFamily=$orderFamily, orderItems=$orderItems, packagingProviderId=$packagingProviderId, paymentMethod=$paymentMethod, promocode=$promocode, promocodeDiscountType=$promocodeDiscountType, promocodeDiscountValue=$promocodeDiscountValue, promocodeId=$promocodeId, rating=$rating, ratingComment=$ratingComment, receiverAddress=$receiverAddress, latLng=$latLng, receiverPhoneNumber=$receiverPhoneNumber, receiverAddressDetails=$receiverAddressDetails, receiverName=$receiverName, referenceNumber=$referenceNumber, shippingFee=$shippingFee, statusId=$statusId, rejectedProvidersIds=$rejectedProvidersIds, rejectedOrderItems=$rejectedOrderItems, totalBeforeDiscount=$totalBeforeDiscount, discount=$discount, total=$total, totalWithShippingFee=$totalWithShippingFee, type=$type, updatedAt=$updatedAt, user=$user, userId=$userId, giftBox=$giftBox, giftCard=$giftCard]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cancellationReason != null) {
      json[r'cancellation_reason'] = this.cancellationReason;
    } else {
      json[r'cancellation_reason'] = null;
    }
    if (this.cancelledBy != null) {
      json[r'cancelled_by'] = this.cancelledBy;
    } else {
      json[r'cancelled_by'] = null;
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
    if (this.finishedAt != null) {
      json[r'finished_at'] = this.finishedAt;
    } else {
      json[r'finished_at'] = null;
    }
    if (this.cancelledAt != null) {
      json[r'cancelled_at'] = this.cancelledAt;
    } else {
      json[r'cancelled_at'] = null;
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
    if (this.latLng != null) {
      json[r'lat_lng'] = this.latLng;
    } else {
      json[r'lat_lng'] = null;
    }
    if (this.receiverPhoneNumber != null) {
      json[r'receiver_phone_number'] = this.receiverPhoneNumber;
    } else {
      json[r'receiver_phone_number'] = null;
    }
    if (this.receiverAddressDetails != null) {
      json[r'receiver_address_details'] = this.receiverAddressDetails;
    } else {
      json[r'receiver_address_details'] = null;
    }
    if (this.receiverName != null) {
      json[r'receiver_name'] = this.receiverName;
    } else {
      json[r'receiver_name'] = null;
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
    if (this.rejectedProvidersIds != null) {
      json[r'rejected_providers_ids'] = this.rejectedProvidersIds;
    } else {
      json[r'rejected_providers_ids'] = null;
    }
    if (this.rejectedOrderItems != null) {
      json[r'rejected_order_items'] = this.rejectedOrderItems;
    } else {
      json[r'rejected_order_items'] = null;
    }
    if (this.totalBeforeDiscount != null) {
      json[r'total_before_discount'] = this.totalBeforeDiscount;
    } else {
      json[r'total_before_discount'] = null;
    }
    if (this.discount != null) {
      json[r'discount'] = this.discount;
    } else {
      json[r'discount'] = null;
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
    if (this.giftBox != null) {
      json[r'gift_box'] = this.giftBox;
    } else {
      json[r'gift_box'] = null;
    }
    if (this.giftCard != null) {
      json[r'gift_card'] = this.giftCard;
    } else {
      json[r'gift_card'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderOrderDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderOrderDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderOrderDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderOrderDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderOrderDetails(
        cancellationReason: mapValueOfType<String>(json, r'cancellation_reason'),
        cancelledBy: mapValueOfType<String>(json, r'cancelled_by'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deliveryDate: mapValueOfType<String>(json, r'delivery_date'),
        deliveryTime: mapValueOfType<String>(json, r'delivery_time'),
        finishedAt: mapValueOfType<String>(json, r'finished_at'),
        cancelledAt: mapValueOfType<String>(json, r'cancelled_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        orderFamily: mapValueOfType<String>(json, r'order_family'),
        orderItems: ProviderOrderDetailsOrderItemsInner.listFromJson(json[r'order_items']),
        packagingProviderId: json[r'packaging_provider_id'] == null
            ? null
            : num.parse(json[r'packaging_provider_id'].toString()),
        paymentMethod: mapValueOfType<String>(json, r'payment_method'),
        promocode: ProviderOrderDetailsPromocode.fromJson(json[r'promocode']),
        promocodeDiscountType: mapValueOfType<String>(json, r'promocode_discount_type'),
        promocodeDiscountValue: json[r'promocode_discount_value'] == null
            ? null
            : num.parse(json[r'promocode_discount_value'].toString()),
        promocodeId: json[r'promocode_id'] == null
            ? null
            : num.parse(json[r'promocode_id'].toString()),
        rating: json[r'rating'] == null
            ? null
            : num.parse(json[r'rating'].toString()),
        ratingComment: mapValueOfType<String>(json, r'rating_comment'),
        receiverAddress: mapValueOfType<String>(json, r'receiver_address'),
        latLng: mapValueOfType<String>(json, r'lat_lng'),
        receiverPhoneNumber: mapValueOfType<String>(json, r'receiver_phone_number'),
        receiverAddressDetails: mapValueOfType<String>(json, r'receiver_address_details'),
        receiverName: mapValueOfType<String>(json, r'receiver_name'),
        referenceNumber: mapValueOfType<String>(json, r'reference_number'),
        shippingFee: json[r'shipping_fee'] == null
            ? null
            : num.parse(json[r'shipping_fee'].toString()),
        statusId: json[r'status_id'] == null
            ? null
            : num.parse(json[r'status_id'].toString()),
        rejectedProvidersIds: mapValueOfType<String>(json, r'rejected_providers_ids'),
        rejectedOrderItems: mapValueOfType<String>(json, r'rejected_order_items'),
        totalBeforeDiscount: json[r'total_before_discount'] == null
            ? null
            : num.parse(json[r'total_before_discount'].toString()),
        discount: json[r'discount'] == null
            ? null
            : num.parse(json[r'discount'].toString()),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        totalWithShippingFee: json[r'total_with_shipping_fee'] == null
            ? null
            : num.parse(json[r'total_with_shipping_fee'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        user: ProviderOrderDetailsUser.fromJson(json[r'user']),
        userId: json[r'user_id'] == null
            ? null
            : num.parse(json[r'user_id'].toString()),
        giftBox: ProviderOrderDetailsGiftBox.fromJson(json[r'gift_box']),
        giftCard: ProviderOrderDetailsGiftBox.fromJson(json[r'gift_card']),
      );
    }
    return null;
  }

  static List<ProviderOrderDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderOrderDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderOrderDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderOrderDetails> mapFromJson(dynamic json) {
    final map = <String, ProviderOrderDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderOrderDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderOrderDetails-objects as value to a dart map
  static Map<String, List<ProviderOrderDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderOrderDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderOrderDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

