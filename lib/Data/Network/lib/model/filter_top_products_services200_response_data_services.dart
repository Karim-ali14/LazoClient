//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterTopProductsServices200ResponseDataServices {
  /// Returns a new [FilterTopProductsServices200ResponseDataServices] instance.
  FilterTopProductsServices200ResponseDataServices({
    this.currentPage,
    this.firstPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.lastPageUrl,
    this.from,
    this.to,
    this.path,
    this.total,
    this.links = const [],
    this.data = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? currentPage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? firstPageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? prevPageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastPageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? from;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? to;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? total;

  List<FilterTopProductsServices200ResponseDataProductsLinksInner> links;

  List<ServiceShowData> data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterTopProductsServices200ResponseDataServices &&
     other.currentPage == currentPage &&
     other.firstPageUrl == firstPageUrl &&
     other.nextPageUrl == nextPageUrl &&
     other.prevPageUrl == prevPageUrl &&
     other.lastPageUrl == lastPageUrl &&
     other.from == from &&
     other.to == to &&
     other.path == path &&
     other.total == total &&
     other.links == links &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (currentPage == null ? 0 : currentPage!.hashCode) +
    (firstPageUrl == null ? 0 : firstPageUrl!.hashCode) +
    (nextPageUrl == null ? 0 : nextPageUrl!.hashCode) +
    (prevPageUrl == null ? 0 : prevPageUrl!.hashCode) +
    (lastPageUrl == null ? 0 : lastPageUrl!.hashCode) +
    (from == null ? 0 : from!.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (path == null ? 0 : path!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (links.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'FilterTopProductsServices200ResponseDataServices[currentPage=$currentPage, firstPageUrl=$firstPageUrl, nextPageUrl=$nextPageUrl, prevPageUrl=$prevPageUrl, lastPageUrl=$lastPageUrl, from=$from, to=$to, path=$path, total=$total, links=$links, data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.currentPage != null) {
      json[r'current_page'] = this.currentPage;
    } else {
      json[r'current_page'] = null;
    }
    if (this.firstPageUrl != null) {
      json[r'first_page_url'] = this.firstPageUrl;
    } else {
      json[r'first_page_url'] = null;
    }
    if (this.nextPageUrl != null) {
      json[r'next_page_url'] = this.nextPageUrl;
    } else {
      json[r'next_page_url'] = null;
    }
    if (this.prevPageUrl != null) {
      json[r'prev_page_url'] = this.prevPageUrl;
    } else {
      json[r'prev_page_url'] = null;
    }
    if (this.lastPageUrl != null) {
      json[r'last_page_url'] = this.lastPageUrl;
    } else {
      json[r'last_page_url'] = null;
    }
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
      json[r'links'] = this.links;
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [FilterTopProductsServices200ResponseDataServices] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterTopProductsServices200ResponseDataServices? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FilterTopProductsServices200ResponseDataServices[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FilterTopProductsServices200ResponseDataServices[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilterTopProductsServices200ResponseDataServices(
        currentPage: json[r'current_page'] == null
            ? null
            : num.parse(json[r'current_page'].toString()),
        firstPageUrl: mapValueOfType<String>(json, r'first_page_url'),
        nextPageUrl: mapValueOfType<String>(json, r'next_page_url'),
        prevPageUrl: mapValueOfType<String>(json, r'prev_page_url'),
        lastPageUrl: mapValueOfType<String>(json, r'last_page_url'),
        from: json[r'from'] == null
            ? null
            : num.parse(json[r'from'].toString()),
        to: json[r'to'] == null
            ? null
            : num.parse(json[r'to'].toString()),
        path: mapValueOfType<String>(json, r'path'),
        total: mapValueOfType<String>(json, r'total'),
        links: FilterTopProductsServices200ResponseDataProductsLinksInner.listFromJson(json[r'links']),
        data: ServiceShowData.listFromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<FilterTopProductsServices200ResponseDataServices> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterTopProductsServices200ResponseDataServices>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterTopProductsServices200ResponseDataServices.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterTopProductsServices200ResponseDataServices> mapFromJson(dynamic json) {
    final map = <String, FilterTopProductsServices200ResponseDataServices>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterTopProductsServices200ResponseDataServices.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterTopProductsServices200ResponseDataServices-objects as value to a dart map
  static Map<String, List<FilterTopProductsServices200ResponseDataServices>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterTopProductsServices200ResponseDataServices>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterTopProductsServices200ResponseDataServices.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

