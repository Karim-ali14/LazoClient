//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterTopSellers200ResponseDataLinksInner {
  /// Returns a new [FilterTopSellers200ResponseDataLinksInner] instance.
  FilterTopSellers200ResponseDataLinksInner({
    this.url,
    this.label,
    this.active,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? active;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterTopSellers200ResponseDataLinksInner &&
     other.url == url &&
     other.label == label &&
     other.active == active;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url == null ? 0 : url!.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (active == null ? 0 : active!.hashCode);

  @override
  String toString() => 'FilterTopSellers200ResponseDataLinksInner[url=$url, label=$label, active=$active]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    return json;
  }

  /// Returns a new [FilterTopSellers200ResponseDataLinksInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterTopSellers200ResponseDataLinksInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FilterTopSellers200ResponseDataLinksInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FilterTopSellers200ResponseDataLinksInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilterTopSellers200ResponseDataLinksInner(
        url: mapValueOfType<String>(json, r'url'),
        label: mapValueOfType<String>(json, r'label'),
        active: mapValueOfType<bool>(json, r'active'),
      );
    }
    return null;
  }

  static List<FilterTopSellers200ResponseDataLinksInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterTopSellers200ResponseDataLinksInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterTopSellers200ResponseDataLinksInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterTopSellers200ResponseDataLinksInner> mapFromJson(dynamic json) {
    final map = <String, FilterTopSellers200ResponseDataLinksInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterTopSellers200ResponseDataLinksInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterTopSellers200ResponseDataLinksInner-objects as value to a dart map
  static Map<String, List<FilterTopSellers200ResponseDataLinksInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterTopSellers200ResponseDataLinksInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterTopSellers200ResponseDataLinksInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

