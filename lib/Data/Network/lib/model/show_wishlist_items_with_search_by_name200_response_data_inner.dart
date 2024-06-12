//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowWishlistItemsWithSearchByName200ResponseDataInner {
  /// Returns a new [ShowWishlistItemsWithSearchByName200ResponseDataInner] instance.
  ShowWishlistItemsWithSearchByName200ResponseDataInner({
    this.items = const [],
    this.type,
  });

  List<ShowWishlistItemsWithSearchByName200ResponseDataInnerItemsInner> items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowWishlistItemsWithSearchByName200ResponseDataInner &&
     other.items == items &&
     other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (items.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ShowWishlistItemsWithSearchByName200ResponseDataInner[items=$items, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'items'] = this.items;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ShowWishlistItemsWithSearchByName200ResponseDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowWishlistItemsWithSearchByName200ResponseDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowWishlistItemsWithSearchByName200ResponseDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowWishlistItemsWithSearchByName200ResponseDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowWishlistItemsWithSearchByName200ResponseDataInner(
        items: ShowWishlistItemsWithSearchByName200ResponseDataInnerItemsInner.listFromJson(json[r'items']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<ShowWishlistItemsWithSearchByName200ResponseDataInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowWishlistItemsWithSearchByName200ResponseDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowWishlistItemsWithSearchByName200ResponseDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowWishlistItemsWithSearchByName200ResponseDataInner> mapFromJson(dynamic json) {
    final map = <String, ShowWishlistItemsWithSearchByName200ResponseDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowWishlistItemsWithSearchByName200ResponseDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowWishlistItemsWithSearchByName200ResponseDataInner-objects as value to a dart map
  static Map<String, List<ShowWishlistItemsWithSearchByName200ResponseDataInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowWishlistItemsWithSearchByName200ResponseDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowWishlistItemsWithSearchByName200ResponseDataInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

