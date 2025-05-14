//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateCartItemQuantity200ResponseData {
  /// Returns a new [UpdateCartItemQuantity200ResponseData] instance.
  UpdateCartItemQuantity200ResponseData({
    this.cartItems,
    this.createdAt,
    this.id,
    this.total,
    this.type,
    this.updatedAt,
    this.userId,
    this.sessionId,
    this.shipmentType,
    this.expectedProcessingTime,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderData? cartItems;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expectedProcessingTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateCartItemQuantity200ResponseData &&
    other.cartItems == cartItems &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.total == total &&
    other.type == type &&
    other.updatedAt == updatedAt &&
    other.userId == userId &&
    other.sessionId == sessionId &&
    other.shipmentType == shipmentType &&
    other.expectedProcessingTime == expectedProcessingTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartItems == null ? 0 : cartItems!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (sessionId == null ? 0 : sessionId!.hashCode) +
    (shipmentType == null ? 0 : shipmentType!.hashCode) +
    (expectedProcessingTime == null ? 0 : expectedProcessingTime!.hashCode);

  @override
  String toString() => 'UpdateCartItemQuantity200ResponseData[cartItems=$cartItems, createdAt=$createdAt, id=$id, total=$total, type=$type, updatedAt=$updatedAt, userId=$userId, sessionId=$sessionId, shipmentType=$shipmentType, expectedProcessingTime=$expectedProcessingTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cartItems != null) {
      json[r'cart_items'] = this.cartItems;
    } else {
      json[r'cart_items'] = null;
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
    if (this.expectedProcessingTime != null) {
      json[r'expected_processing_time'] = this.expectedProcessingTime;
    } else {
      json[r'expected_processing_time'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateCartItemQuantity200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateCartItemQuantity200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateCartItemQuantity200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateCartItemQuantity200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateCartItemQuantity200ResponseData(
        cartItems: ProviderData.fromJson(json[r'cart_items']),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: num.tryParse('${json[r'id']}'),
        total: num.tryParse('${json[r'total']}'),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        userId: num.tryParse('${json[r'user_id']}'),
        sessionId: mapValueOfType<String>(json, r'session_id'),
        shipmentType: mapValueOfType<String>(json, r'shipment_type'),
        expectedProcessingTime: mapValueOfType<String>(json, r'expected_processing_time'),
      );
    }
    return null;
  }

  static List<UpdateCartItemQuantity200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateCartItemQuantity200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateCartItemQuantity200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateCartItemQuantity200ResponseData> mapFromJson(dynamic json) {
    final map = <String, UpdateCartItemQuantity200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateCartItemQuantity200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateCartItemQuantity200ResponseData-objects as value to a dart map
  static Map<String, List<UpdateCartItemQuantity200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateCartItemQuantity200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateCartItemQuantity200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

