//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowWishlistItemsWithSearchByName200ResponseData {
  /// Returns a new [ShowWishlistItemsWithSearchByName200ResponseData] instance.
  ShowWishlistItemsWithSearchByName200ResponseData({
    this.products = const [],
    this.services = const [],
  });

  List<ProductDetails> products;

  List<ServiceShowData> services;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowWishlistItemsWithSearchByName200ResponseData &&
     other.products == products &&
     other.services == services;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (products.hashCode) +
    (services.hashCode);

  @override
  String toString() => 'ShowWishlistItemsWithSearchByName200ResponseData[products=$products, services=$services]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'products'] = this.products;
      json[r'services'] = this.services;
    return json;
  }

  /// Returns a new [ShowWishlistItemsWithSearchByName200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowWishlistItemsWithSearchByName200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowWishlistItemsWithSearchByName200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowWishlistItemsWithSearchByName200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowWishlistItemsWithSearchByName200ResponseData(
        products: ProductDetails.listFromJson(json[r'products']),
        services: ServiceShowData.listFromJson(json[r'services']),
      );
    }
    return null;
  }

  static List<ShowWishlistItemsWithSearchByName200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowWishlistItemsWithSearchByName200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowWishlistItemsWithSearchByName200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowWishlistItemsWithSearchByName200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ShowWishlistItemsWithSearchByName200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowWishlistItemsWithSearchByName200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowWishlistItemsWithSearchByName200ResponseData-objects as value to a dart map
  static Map<String, List<ShowWishlistItemsWithSearchByName200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowWishlistItemsWithSearchByName200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowWishlistItemsWithSearchByName200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

