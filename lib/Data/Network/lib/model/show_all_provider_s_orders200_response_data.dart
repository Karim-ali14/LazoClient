//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowAllProviderSOrders200ResponseData {
  /// Returns a new [ShowAllProviderSOrders200ResponseData] instance.
  ShowAllProviderSOrders200ResponseData({
    this.currentPage,
    this.data = const [],
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links = const [],
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? currentPage;

  List<ShowAllProviderSOrders200ResponseDataDataInner> data;

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
  num? from;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? lastPage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastPageUrl;

  List<ShowAllServicesWithFilter200ResponseDataLinksInner> links;

  Object? nextPageUrl;

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
  num? perPage;

  Object? prevPageUrl;

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
  num? total;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowAllProviderSOrders200ResponseData &&
     other.currentPage == currentPage &&
     other.data == data &&
     other.firstPageUrl == firstPageUrl &&
     other.from == from &&
     other.lastPage == lastPage &&
     other.lastPageUrl == lastPageUrl &&
     other.links == links &&
     other.nextPageUrl == nextPageUrl &&
     other.path == path &&
     other.perPage == perPage &&
     other.prevPageUrl == prevPageUrl &&
     other.to == to &&
     other.total == total;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (currentPage == null ? 0 : currentPage!.hashCode) +
    (data.hashCode) +
    (firstPageUrl == null ? 0 : firstPageUrl!.hashCode) +
    (from == null ? 0 : from!.hashCode) +
    (lastPage == null ? 0 : lastPage!.hashCode) +
    (lastPageUrl == null ? 0 : lastPageUrl!.hashCode) +
    (links.hashCode) +
    (nextPageUrl == null ? 0 : nextPageUrl!.hashCode) +
    (path == null ? 0 : path!.hashCode) +
    (perPage == null ? 0 : perPage!.hashCode) +
    (prevPageUrl == null ? 0 : prevPageUrl!.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (total == null ? 0 : total!.hashCode);

  @override
  String toString() => 'ShowAllProviderSOrders200ResponseData[currentPage=$currentPage, data=$data, firstPageUrl=$firstPageUrl, from=$from, lastPage=$lastPage, lastPageUrl=$lastPageUrl, links=$links, nextPageUrl=$nextPageUrl, path=$path, perPage=$perPage, prevPageUrl=$prevPageUrl, to=$to, total=$total]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.currentPage != null) {
      json[r'current_page'] = this.currentPage;
    } else {
      json[r'current_page'] = null;
    }
      json[r'data'] = this.data;
    if (this.firstPageUrl != null) {
      json[r'first_page_url'] = this.firstPageUrl;
    } else {
      json[r'first_page_url'] = null;
    }
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    if (this.lastPage != null) {
      json[r'last_page'] = this.lastPage;
    } else {
      json[r'last_page'] = null;
    }
    if (this.lastPageUrl != null) {
      json[r'last_page_url'] = this.lastPageUrl;
    } else {
      json[r'last_page_url'] = null;
    }
      json[r'links'] = this.links;
    if (this.nextPageUrl != null) {
      json[r'next_page_url'] = this.nextPageUrl;
    } else {
      json[r'next_page_url'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.perPage != null) {
      json[r'per_page'] = this.perPage;
    } else {
      json[r'per_page'] = null;
    }
    if (this.prevPageUrl != null) {
      json[r'prev_page_url'] = this.prevPageUrl;
    } else {
      json[r'prev_page_url'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    return json;
  }

  /// Returns a new [ShowAllProviderSOrders200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowAllProviderSOrders200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowAllProviderSOrders200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowAllProviderSOrders200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowAllProviderSOrders200ResponseData(
        currentPage: json[r'current_page'] == null
            ? null
            : num.parse(json[r'current_page'].toString()),
        data: ShowAllProviderSOrders200ResponseDataDataInner.listFromJson(json[r'data']),
        firstPageUrl: mapValueOfType<String>(json, r'first_page_url'),
        from: json[r'from'] == null
            ? null
            : num.parse(json[r'from'].toString()),
        lastPage: json[r'last_page'] == null
            ? null
            : num.parse(json[r'last_page'].toString()),
        lastPageUrl: mapValueOfType<String>(json, r'last_page_url'),
        links: ShowAllServicesWithFilter200ResponseDataLinksInner.listFromJson(json[r'links']),
        nextPageUrl: mapValueOfType<Object>(json, r'next_page_url'),
        path: mapValueOfType<String>(json, r'path'),
        perPage: json[r'per_page'] == null
            ? null
            : num.parse(json[r'per_page'].toString()),
        prevPageUrl: mapValueOfType<Object>(json, r'prev_page_url'),
        to: json[r'to'] == null
            ? null
            : num.parse(json[r'to'].toString()),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
      );
    }
    return null;
  }

  static List<ShowAllProviderSOrders200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowAllProviderSOrders200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowAllProviderSOrders200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowAllProviderSOrders200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ShowAllProviderSOrders200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowAllProviderSOrders200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowAllProviderSOrders200ResponseData-objects as value to a dart map
  static Map<String, List<ShowAllProviderSOrders200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowAllProviderSOrders200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowAllProviderSOrders200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

