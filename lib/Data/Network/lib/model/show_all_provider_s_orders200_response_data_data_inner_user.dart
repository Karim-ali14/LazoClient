//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowAllProviderSOrders200ResponseDataDataInnerUser {
  /// Returns a new [ShowAllProviderSOrders200ResponseDataDataInnerUser] instance.
  ShowAllProviderSOrders200ResponseDataDataInnerUser({
    this.balance,
    this.cityId,
    this.createdAt,
    this.deviceType,
    this.email,
    this.fcmToken,
    this.id,
    this.image,
    this.imagePath,
    this.lang,
    this.name,
    this.phone,
    this.status,
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? balance;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? cityId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  Object? deviceType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  Object? fcmToken;

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
  String? image;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imagePath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lang;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowAllProviderSOrders200ResponseDataDataInnerUser &&
     other.balance == balance &&
     other.cityId == cityId &&
     other.createdAt == createdAt &&
     other.deviceType == deviceType &&
     other.email == email &&
     other.fcmToken == fcmToken &&
     other.id == id &&
     other.image == image &&
     other.imagePath == imagePath &&
     other.lang == lang &&
     other.name == name &&
     other.phone == phone &&
     other.status == status &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (balance == null ? 0 : balance!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deviceType == null ? 0 : deviceType!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (fcmToken == null ? 0 : fcmToken!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (imagePath == null ? 0 : imagePath!.hashCode) +
    (lang == null ? 0 : lang!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ShowAllProviderSOrders200ResponseDataDataInnerUser[balance=$balance, cityId=$cityId, createdAt=$createdAt, deviceType=$deviceType, email=$email, fcmToken=$fcmToken, id=$id, image=$image, imagePath=$imagePath, lang=$lang, name=$name, phone=$phone, status=$status, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.balance != null) {
      json[r'balance'] = this.balance;
    } else {
      json[r'balance'] = null;
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
    if (this.deviceType != null) {
      json[r'device_type'] = this.deviceType;
    } else {
      json[r'device_type'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.fcmToken != null) {
      json[r'fcm_token'] = this.fcmToken;
    } else {
      json[r'fcm_token'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.imagePath != null) {
      json[r'imagePath'] = this.imagePath;
    } else {
      json[r'imagePath'] = null;
    }
    if (this.lang != null) {
      json[r'lang'] = this.lang;
    } else {
      json[r'lang'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ShowAllProviderSOrders200ResponseDataDataInnerUser] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowAllProviderSOrders200ResponseDataDataInnerUser? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowAllProviderSOrders200ResponseDataDataInnerUser[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowAllProviderSOrders200ResponseDataDataInnerUser[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowAllProviderSOrders200ResponseDataDataInnerUser(
        balance: mapValueOfType<String>(json, r'balance'),
        cityId: json[r'city_id'] == null
            ? null
            : num.parse(json[r'city_id'].toString()),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deviceType: mapValueOfType<Object>(json, r'device_type'),
        email: mapValueOfType<String>(json, r'email'),
        fcmToken: mapValueOfType<Object>(json, r'fcm_token'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        image: mapValueOfType<String>(json, r'image'),
        imagePath: mapValueOfType<String>(json, r'imagePath'),
        lang: mapValueOfType<String>(json, r'lang'),
        name: mapValueOfType<String>(json, r'name'),
        phone: mapValueOfType<String>(json, r'phone'),
        status: mapValueOfType<String>(json, r'status'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ShowAllProviderSOrders200ResponseDataDataInnerUser> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowAllProviderSOrders200ResponseDataDataInnerUser>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowAllProviderSOrders200ResponseDataDataInnerUser.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowAllProviderSOrders200ResponseDataDataInnerUser> mapFromJson(dynamic json) {
    final map = <String, ShowAllProviderSOrders200ResponseDataDataInnerUser>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowAllProviderSOrders200ResponseDataDataInnerUser.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowAllProviderSOrders200ResponseDataDataInnerUser-objects as value to a dart map
  static Map<String, List<ShowAllProviderSOrders200ResponseDataDataInnerUser>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowAllProviderSOrders200ResponseDataDataInnerUser>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowAllProviderSOrders200ResponseDataDataInnerUser.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

