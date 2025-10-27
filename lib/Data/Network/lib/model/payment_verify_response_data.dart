//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaymentVerifyResponseData {
  /// Returns a new [PaymentVerifyResponseData] instance.
  PaymentVerifyResponseData({
    this.status,
    this.message,
    this.orderId,
    this.type,
    this.serviceId,
    this.shipmentType,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

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
  String? type;

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
  String? shipmentType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaymentVerifyResponseData &&
    other.status == status &&
    other.message == message &&
    other.orderId == orderId &&
    other.type == type &&
    other.serviceId == serviceId &&
    other.shipmentType == shipmentType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status == null ? 0 : status!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (shipmentType == null ? 0 : shipmentType!.hashCode);

  @override
  String toString() => 'PaymentVerifyResponseData[status=$status, message=$message, orderId=$orderId, type=$type, serviceId=$serviceId, shipmentType=$shipmentType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.orderId != null) {
      json[r'order_id'] = this.orderId;
    } else {
      json[r'order_id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
    }
    if (this.shipmentType != null) {
      json[r'shipment_type'] = this.shipmentType;
    } else {
      json[r'shipment_type'] = null;
    }
    return json;
  }

  /// Returns a new [PaymentVerifyResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaymentVerifyResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaymentVerifyResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaymentVerifyResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaymentVerifyResponseData(
        status: mapValueOfType<String>(json, r'status'),
        message: mapValueOfType<String>(json, r'message'),
        orderId: num.tryParse('${json[r'order_id']}'),
        type: mapValueOfType<String>(json, r'type'),
        serviceId: num.tryParse('${json[r'service_id']}'),
        shipmentType: mapValueOfType<String>(json, r'shipment_type'),
      );
    }
    return null;
  }

  static List<PaymentVerifyResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentVerifyResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentVerifyResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaymentVerifyResponseData> mapFromJson(dynamic json) {
    final map = <String, PaymentVerifyResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentVerifyResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaymentVerifyResponseData-objects as value to a dart map
  static Map<String, List<PaymentVerifyResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaymentVerifyResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PaymentVerifyResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

