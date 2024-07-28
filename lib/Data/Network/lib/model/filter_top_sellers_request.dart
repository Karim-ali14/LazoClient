//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterTopSellersRequest {
  /// Returns a new [FilterTopSellersRequest] instance.
  FilterTopSellersRequest({
    this.page,
    this.searchByName,
    this.categoriesIds = const [],
    this.isPromoted,
    this.occasionsIds = const [],
    this.ratings = const [],
  });

  num? page;

  String? searchByName;

  List<String>? categoriesIds;

  /// 0-not_promoted, 1-promoted
  num? isPromoted;

  List<String>? occasionsIds;

  List<String>? ratings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterTopSellersRequest &&
     other.page == page &&
     other.searchByName == searchByName &&
     other.categoriesIds == categoriesIds &&
     other.isPromoted == isPromoted &&
     other.occasionsIds == occasionsIds &&
     other.ratings == ratings;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (page == null ? 0 : page!.hashCode) +
    (searchByName == null ? 0 : searchByName!.hashCode) +
    (categoriesIds == null ? 0 : categoriesIds!.hashCode) +
    (isPromoted == null ? 0 : isPromoted!.hashCode) +
    (occasionsIds == null ? 0 : occasionsIds!.hashCode) +
    (ratings == null ? 0 : ratings!.hashCode);

  @override
  String toString() => 'FilterTopSellersRequest[page=$page, searchByName=$searchByName, categoriesIds=$categoriesIds, isPromoted=$isPromoted, occasionsIds=$occasionsIds, ratings=$ratings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.page != null) {
      json[r'page'] = this.page;
    } else {
      json[r'page'] = null;
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
    if (this.isPromoted != null) {
      json[r'is_promoted'] = this.isPromoted;
    } else {
      json[r'is_promoted'] = null;
    }
    if (this.occasionsIds != null) {
      json[r'occasions_ids'] = this.occasionsIds;
    } else {
      json[r'occasions_ids'] = null;
    }
    if (this.ratings != null) {
      json[r'ratings'] = this.ratings;
    } else {
      json[r'ratings'] = null;
    }
    return json;
  }

  /// Returns a new [FilterTopSellersRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterTopSellersRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FilterTopSellersRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FilterTopSellersRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilterTopSellersRequest(
        page: json[r'page'] == null
            ? null
            : num.parse(json[r'page'].toString()),
        searchByName: mapValueOfType<String>(json, r'search_by_name'),
        categoriesIds: json[r'categories_ids'] is List
            ? (json[r'categories_ids'] as List).cast<String>()
            : const [],
        isPromoted: json[r'is_promoted'] == null
            ? null
            : num.parse(json[r'is_promoted'].toString()),
        occasionsIds: json[r'occasions_ids'] is List
            ? (json[r'occasions_ids'] as List).cast<String>()
            : const [],
        ratings: json[r'ratings'] is List
            ? (json[r'ratings'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<FilterTopSellersRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterTopSellersRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterTopSellersRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterTopSellersRequest> mapFromJson(dynamic json) {
    final map = <String, FilterTopSellersRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterTopSellersRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterTopSellersRequest-objects as value to a dart map
  static Map<String, List<FilterTopSellersRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterTopSellersRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterTopSellersRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

