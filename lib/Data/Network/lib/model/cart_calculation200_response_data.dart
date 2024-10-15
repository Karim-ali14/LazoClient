//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartCalculation200ResponseData {
  /// Returns a new [CartCalculation200ResponseData] instance.
  CartCalculation200ResponseData({
    this.totalBefore,
    this.discountTotal,
    this.shippingFee,
    this.totalAfter,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalBefore;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? discountTotal;

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
  num? totalAfter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartCalculation200ResponseData &&
     other.totalBefore == totalBefore &&
     other.discountTotal == discountTotal &&
     other.shippingFee == shippingFee &&
     other.totalAfter == totalAfter;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (totalBefore == null ? 0 : totalBefore!.hashCode) +
    (discountTotal == null ? 0 : discountTotal!.hashCode) +
    (shippingFee == null ? 0 : shippingFee!.hashCode) +
    (totalAfter == null ? 0 : totalAfter!.hashCode);

  @override
  String toString() => 'CartCalculation200ResponseData[totalBefore=$totalBefore, discountTotal=$discountTotal, shippingFee=$shippingFee, totalAfter=$totalAfter]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.totalBefore != null) {
      json[r'total_before'] = this.totalBefore;
    } else {
      json[r'total_before'] = null;
    }
    if (this.discountTotal != null) {
      json[r'discount_total'] = this.discountTotal;
    } else {
      json[r'discount_total'] = null;
    }
    if (this.shippingFee != null) {
      json[r'shipping_fee'] = this.shippingFee;
    } else {
      json[r'shipping_fee'] = null;
    }
    if (this.totalAfter != null) {
      json[r'total_after'] = this.totalAfter;
    } else {
      json[r'total_after'] = null;
    }
    return json;
  }

  /// Returns a new [CartCalculation200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartCalculation200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartCalculation200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartCalculation200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartCalculation200ResponseData(
        totalBefore: json[r'total_before'] == null
            ? null
            : num.parse(json[r'total_before'].toString()),
        discountTotal: json[r'discount_total'] == null
            ? null
            : num.parse(json[r'discount_total'].toString()),
        shippingFee: json[r'shipping_fee'] == null
            ? null
            : num.parse(json[r'shipping_fee'].toString()),
        totalAfter: json[r'total_after'] == null
            ? null
            : num.parse(json[r'total_after'].toString()),
      );
    }
    return null;
  }

  static List<CartCalculation200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartCalculation200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartCalculation200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartCalculation200ResponseData> mapFromJson(dynamic json) {
    final map = <String, CartCalculation200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartCalculation200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartCalculation200ResponseData-objects as value to a dart map
  static Map<String, List<CartCalculation200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartCalculation200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CartCalculation200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

