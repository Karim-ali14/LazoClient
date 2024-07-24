//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterTopProductsServicesRequest {
  /// Returns a new [FilterTopProductsServicesRequest] instance.
  FilterTopProductsServicesRequest({
    this.page,
    this.limit,
    this.searchByName,
    this.categoriesIds = const [],
    this.occasionsIds = const [],
    this.priceFrom,
    this.priceTo,
    this.ratings = const [],
    this.type,
  });

  num? page;

  num? limit;

  String? searchByName;

  List<int>? categoriesIds;

  List<num>? occasionsIds;

  String? priceFrom;

  String? priceTo;

  List<FilterTopProductsServicesRequestRatingsEnum>? ratings;

  /// products or services
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterTopProductsServicesRequest &&
     other.page == page &&
     other.limit == limit &&
     other.searchByName == searchByName &&
     other.categoriesIds == categoriesIds &&
     other.occasionsIds == occasionsIds &&
     other.priceFrom == priceFrom &&
     other.priceTo == priceTo &&
     other.ratings == ratings &&
     other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (page == null ? 0 : page!.hashCode) +
    (limit == null ? 0 : limit!.hashCode) +
    (searchByName == null ? 0 : searchByName!.hashCode) +
    (categoriesIds == null ? 0 : categoriesIds!.hashCode) +
    (occasionsIds == null ? 0 : occasionsIds!.hashCode) +
    (priceFrom == null ? 0 : priceFrom!.hashCode) +
    (priceTo == null ? 0 : priceTo!.hashCode) +
    (ratings == null ? 0 : ratings!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'FilterTopProductsServicesRequest[page=$page, limit=$limit, searchByName=$searchByName, categoriesIds=$categoriesIds, occasionsIds=$occasionsIds, priceFrom=$priceFrom, priceTo=$priceTo, ratings=$ratings, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.page != null) {
      json[r'page'] = this.page;
    } else {
      json[r'page'] = null;
    }
    if (this.limit != null) {
      json[r'limit'] = this.limit;
    } else {
      json[r'limit'] = null;
    }
    if (this.searchByName != null) {
      json[r'search_by_name'] = this.searchByName;
    } else {
      json[r'search_by_name'] = null;
    }
    if (this.categoriesIds != null) {
      json[r'categories_ids'] = this.categoriesIds;
    } else {
      json[r'categories_ids'] = null;
    }
    if (this.occasionsIds != null) {
      json[r'occasions_ids'] = this.occasionsIds;
    } else {
      json[r'occasions_ids'] = null;
    }
    if (this.priceFrom != null) {
      json[r'price_from'] = this.priceFrom;
    } else {
      json[r'price_from'] = null;
    }
    if (this.priceTo != null) {
      json[r'price_to'] = this.priceTo;
    } else {
      json[r'price_to'] = null;
    }
    if (this.ratings != null) {
      json[r'ratings'] = this.ratings;
    } else {
      json[r'ratings'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [FilterTopProductsServicesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterTopProductsServicesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FilterTopProductsServicesRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FilterTopProductsServicesRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilterTopProductsServicesRequest(
        page: json[r'page'] == null
            ? null
            : num.parse(json[r'page'].toString()),
        limit: json[r'limit'] == null
            ? null
            : num.parse(json[r'limit'].toString()),
        searchByName: mapValueOfType<String>(json, r'search_by_name'),
        categoriesIds: json[r'categories_ids'] is List
            ? (json[r'categories_ids'] as List).cast<int>()
            : const [],
        occasionsIds: json[r'occasions_ids'] is List
            ? (json[r'occasions_ids'] as List).cast<num>()
            : const [],
        priceFrom: mapValueOfType<String>(json, r'price_from'),
        priceTo: mapValueOfType<String>(json, r'price_to'),
        ratings: FilterTopProductsServicesRequestRatingsEnum.listFromJson(json[r'ratings']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<FilterTopProductsServicesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterTopProductsServicesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterTopProductsServicesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterTopProductsServicesRequest> mapFromJson(dynamic json) {
    final map = <String, FilterTopProductsServicesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterTopProductsServicesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterTopProductsServicesRequest-objects as value to a dart map
  static Map<String, List<FilterTopProductsServicesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterTopProductsServicesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterTopProductsServicesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class FilterTopProductsServicesRequestRatingsEnum {
  /// Instantiate a new enum with the provided [value].
  const FilterTopProductsServicesRequestRatingsEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const n1 = FilterTopProductsServicesRequestRatingsEnum._(r'1');
  static const n1period5 = FilterTopProductsServicesRequestRatingsEnum._(r'1.5');
  static const n2 = FilterTopProductsServicesRequestRatingsEnum._(r'2');
  static const n2period5 = FilterTopProductsServicesRequestRatingsEnum._(r'2.5');
  static const n3 = FilterTopProductsServicesRequestRatingsEnum._(r'3');
  static const n3period5 = FilterTopProductsServicesRequestRatingsEnum._(r'3.5');
  static const n4 = FilterTopProductsServicesRequestRatingsEnum._(r'4');
  static const n4period5 = FilterTopProductsServicesRequestRatingsEnum._(r'4.5');
  static const n5 = FilterTopProductsServicesRequestRatingsEnum._(r'5');

  /// List of all possible values in this [enum][FilterTopProductsServicesRequestRatingsEnum].
  static const values = <FilterTopProductsServicesRequestRatingsEnum>[
    n1,
    n1period5,
    n2,
    n2period5,
    n3,
    n3period5,
    n4,
    n4period5,
    n5,
  ];

  static FilterTopProductsServicesRequestRatingsEnum? fromJson(dynamic value) => FilterTopProductsServicesRequestRatingsEnumTypeTransformer().decode(value);

  static List<FilterTopProductsServicesRequestRatingsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterTopProductsServicesRequestRatingsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterTopProductsServicesRequestRatingsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FilterTopProductsServicesRequestRatingsEnum] to String,
/// and [decode] dynamic data back to [FilterTopProductsServicesRequestRatingsEnum].
class FilterTopProductsServicesRequestRatingsEnumTypeTransformer {
  factory FilterTopProductsServicesRequestRatingsEnumTypeTransformer() => _instance ??= const FilterTopProductsServicesRequestRatingsEnumTypeTransformer._();

  const FilterTopProductsServicesRequestRatingsEnumTypeTransformer._();

  String encode(FilterTopProductsServicesRequestRatingsEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a FilterTopProductsServicesRequestRatingsEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FilterTopProductsServicesRequestRatingsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'1': return FilterTopProductsServicesRequestRatingsEnum.n1;
        case r'1.5': return FilterTopProductsServicesRequestRatingsEnum.n1period5;
        case r'2': return FilterTopProductsServicesRequestRatingsEnum.n2;
        case r'2.5': return FilterTopProductsServicesRequestRatingsEnum.n2period5;
        case r'3': return FilterTopProductsServicesRequestRatingsEnum.n3;
        case r'3.5': return FilterTopProductsServicesRequestRatingsEnum.n3period5;
        case r'4': return FilterTopProductsServicesRequestRatingsEnum.n4;
        case r'4.5': return FilterTopProductsServicesRequestRatingsEnum.n4period5;
        case r'5': return FilterTopProductsServicesRequestRatingsEnum.n5;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [FilterTopProductsServicesRequestRatingsEnumTypeTransformer] instance.
  static FilterTopProductsServicesRequestRatingsEnumTypeTransformer? _instance;
}


