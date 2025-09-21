//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderProductRatingsInner {
  /// Returns a new [ProviderProductRatingsInner] instance.
  ProviderProductRatingsInner({
    this.orderItemId,
    this.rating,
    this.ratingComment,
    this.date,
    this.userName,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? orderItemId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? rating;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ratingComment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? date;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderProductRatingsInner &&
    other.orderItemId == orderItemId &&
    other.rating == rating &&
    other.ratingComment == ratingComment &&
    other.date == date &&
    other.userName == userName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderItemId == null ? 0 : orderItemId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (ratingComment == null ? 0 : ratingComment!.hashCode) +
    (date == null ? 0 : date!.hashCode) +
    (userName == null ? 0 : userName!.hashCode);

  @override
  String toString() => 'ProviderProductRatingsInner[orderItemId=$orderItemId, rating=$rating, ratingComment=$ratingComment, date=$date, userName=$userName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.orderItemId != null) {
      json[r'order_item_id'] = this.orderItemId;
    } else {
      json[r'order_item_id'] = null;
    }
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
      json[r'rating'] = null;
    }
    if (this.ratingComment != null) {
      json[r'rating_comment'] = this.ratingComment;
    } else {
      json[r'rating_comment'] = null;
    }
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
    if (this.userName != null) {
      json[r'user_name'] = this.userName;
    } else {
      json[r'user_name'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderProductRatingsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderProductRatingsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderProductRatingsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderProductRatingsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderProductRatingsInner(
        orderItemId: mapValueOfType<String>(json, r'order_item_id'),
        rating: num.tryParse('${json[r'rating']}'),
        ratingComment: mapValueOfType<String>(json, r'rating_comment'),
        date: mapValueOfType<String>(json, r'date'),
        userName: mapValueOfType<String>(json, r'user_name'),
      );
    }
    return null;
  }

  static List<ProviderProductRatingsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderProductRatingsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderProductRatingsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderProductRatingsInner> mapFromJson(dynamic json) {
    final map = <String, ProviderProductRatingsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderProductRatingsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderProductRatingsInner-objects as value to a dart map
  static Map<String, List<ProviderProductRatingsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderProductRatingsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderProductRatingsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

