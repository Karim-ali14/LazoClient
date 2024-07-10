//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowHome200ResponseData {
  /// Returns a new [ShowHome200ResponseData] instance.
  ShowHome200ResponseData({
    this.banners = const [],
    this.categories = const [],
    this.occasions = const [],
    this.topRatedProducts = const [],
    this.topRatedProviders = const [],
    this.topRatedServices = const [],
  });

  List<Banner> banners;

  List<ShowHome200ResponseDataCategoriesInner> categories;

  List<ShowHome200ResponseDataOccasionsInner> occasions;

  List<ProviderProduct> topRatedProducts;

  List<ProviderData> topRatedProviders;

  List<ServiceShowData> topRatedServices;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowHome200ResponseData &&
     other.banners == banners &&
     other.categories == categories &&
     other.occasions == occasions &&
     other.topRatedProducts == topRatedProducts &&
     other.topRatedProviders == topRatedProviders &&
     other.topRatedServices == topRatedServices;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (banners.hashCode) +
    (categories.hashCode) +
    (occasions.hashCode) +
    (topRatedProducts.hashCode) +
    (topRatedProviders.hashCode) +
    (topRatedServices.hashCode);

  @override
  String toString() => 'ShowHome200ResponseData[banners=$banners, categories=$categories, occasions=$occasions, topRatedProducts=$topRatedProducts, topRatedProviders=$topRatedProviders, topRatedServices=$topRatedServices]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'banners'] = this.banners;
      json[r'categories'] = this.categories;
      json[r'occasions'] = this.occasions;
      json[r'top_rated_products'] = this.topRatedProducts;
      json[r'top_rated_providers'] = this.topRatedProviders;
      json[r'top_rated_services'] = this.topRatedServices;
    return json;
  }

  /// Returns a new [ShowHome200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowHome200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowHome200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowHome200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowHome200ResponseData(
        banners: Banner.listFromJson(json[r'banners']),
        categories: ShowHome200ResponseDataCategoriesInner.listFromJson(json[r'categories']),
        occasions: ShowHome200ResponseDataOccasionsInner.listFromJson(json[r'occasions']),
        topRatedProducts: ProviderProduct.listFromJson(json[r'top_rated_products']),
        topRatedProviders: ProviderData.listFromJson(json[r'top_rated_providers']),
        topRatedServices: ServiceShowData.listFromJson(json[r'top_rated_services']),
      );
    }
    return null;
  }

  static List<ShowHome200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowHome200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowHome200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowHome200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ShowHome200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowHome200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowHome200ResponseData-objects as value to a dart map
  static Map<String, List<ShowHome200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowHome200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowHome200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

