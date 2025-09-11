//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddressItem {
  /// Returns a new [AddressItem] instance.
  AddressItem({
    this.id,
    this.userId,
    this.recipientName,
    this.recipientPhone,
    this.recipientLandmark,
    this.recipientAddress,
    this.lat,
    this.lng,
    this.cityId,
    this.createdAt,
    this.updatedAt,
    this.city,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? recipientName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? recipientPhone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? recipientLandmark;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? recipientAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lng;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cityId;

  String? createdAt;

  String? updatedAt;

  AddressItemCity? city;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressItem &&
    other.id == id &&
    other.userId == userId &&
    other.recipientName == recipientName &&
    other.recipientPhone == recipientPhone &&
    other.recipientLandmark == recipientLandmark &&
    other.recipientAddress == recipientAddress &&
    other.lat == lat &&
    other.lng == lng &&
    other.cityId == cityId &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt &&
    other.city == city;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (recipientName == null ? 0 : recipientName!.hashCode) +
    (recipientPhone == null ? 0 : recipientPhone!.hashCode) +
    (recipientLandmark == null ? 0 : recipientLandmark!.hashCode) +
    (recipientAddress == null ? 0 : recipientAddress!.hashCode) +
    (lat == null ? 0 : lat!.hashCode) +
    (lng == null ? 0 : lng!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (city == null ? 0 : city!.hashCode);

  @override
  String toString() => 'AddressItem[id=$id, userId=$userId, recipientName=$recipientName, recipientPhone=$recipientPhone, recipientLandmark=$recipientLandmark, recipientAddress=$recipientAddress, lat=$lat, lng=$lng, cityId=$cityId, createdAt=$createdAt, updatedAt=$updatedAt, city=$city]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.recipientName != null) {
      json[r'recipient_name'] = this.recipientName;
    } else {
      json[r'recipient_name'] = null;
    }
    if (this.recipientPhone != null) {
      json[r'recipient_phone'] = this.recipientPhone;
    } else {
      json[r'recipient_phone'] = null;
    }
    if (this.recipientLandmark != null) {
      json[r'recipient_landmark'] = this.recipientLandmark;
    } else {
      json[r'recipient_landmark'] = null;
    }
    if (this.recipientAddress != null) {
      json[r'recipient_address'] = this.recipientAddress;
    } else {
      json[r'recipient_address'] = null;
    }
    if (this.lat != null) {
      json[r'lat'] = this.lat;
    } else {
      json[r'lat'] = null;
    }
    if (this.lng != null) {
      json[r'lng'] = this.lng;
    } else {
      json[r'lng'] = null;
    }
    if (this.cityId != null) {
      json[r'city_id'] = this.cityId;
    } else {
      json[r'city_id'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.city != null) {
      json[r'city'] = this.city;
    } else {
      json[r'city'] = null;
    }
    return json;
  }

  /// Returns a new [AddressItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddressItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddressItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddressItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddressItem(
        id: num.parse('${json[r'id']}'),
        userId: num.parse('${json[r'user_id']}'),
        recipientName: mapValueOfType<String>(json, r'recipient_name'),
        recipientPhone: mapValueOfType<String>(json, r'recipient_phone'),
        recipientLandmark: mapValueOfType<String>(json, r'recipient_landmark'),
        recipientAddress: mapValueOfType<String>(json, r'recipient_address'),
        lat: mapValueOfType<String>(json, r'lat'),
        lng: mapValueOfType<String>(json, r'lng'),
        cityId: mapValueOfType<String>(json, r'city_id'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        city: AddressItemCity.fromJson(json[r'city']),
      );
    }
    return null;
  }

  static List<AddressItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddressItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddressItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddressItem> mapFromJson(dynamic json) {
    final map = <String, AddressItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddressItem-objects as value to a dart map
  static Map<String, List<AddressItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddressItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddressItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

