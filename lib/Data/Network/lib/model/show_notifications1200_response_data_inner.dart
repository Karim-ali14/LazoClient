//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowNotifications1200ResponseDataInner {
  /// Returns a new [ShowNotifications1200ResponseDataInner] instance.
  ShowNotifications1200ResponseDataInner({
    this.createdAt,
    this.id,
    this.image,
    this.imagePath,
    this.isRead,
    this.type,
    this.orderId,
    this.notification,
    this.notificationAr,
    this.notificationEn,
    this.provider,
    this.providerId,
    this.title,
    this.titleAr,
    this.titleEn,
    this.updatedAt,
    this.user,
    this.userId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

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
  num? isRead;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? orderId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notification;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notificationAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notificationEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShowNotifications1200ResponseDataInnerProvider? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? providerId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? titleAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? titleEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  ShowNotifications1200ResponseDataInnerUser? user;

  Object? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowNotifications1200ResponseDataInner &&
     other.createdAt == createdAt &&
     other.id == id &&
     other.image == image &&
     other.imagePath == imagePath &&
     other.isRead == isRead &&
     other.type == type &&
     other.orderId == orderId &&
     other.notification == notification &&
     other.notificationAr == notificationAr &&
     other.notificationEn == notificationEn &&
     other.provider == provider &&
     other.providerId == providerId &&
     other.title == title &&
     other.titleAr == titleAr &&
     other.titleEn == titleEn &&
     other.updatedAt == updatedAt &&
     other.user == user &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (imagePath == null ? 0 : imagePath!.hashCode) +
    (isRead == null ? 0 : isRead!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (notification == null ? 0 : notification!.hashCode) +
    (notificationAr == null ? 0 : notificationAr!.hashCode) +
    (notificationEn == null ? 0 : notificationEn!.hashCode) +
    (provider == null ? 0 : provider!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (titleAr == null ? 0 : titleAr!.hashCode) +
    (titleEn == null ? 0 : titleEn!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'ShowNotifications1200ResponseDataInner[createdAt=$createdAt, id=$id, image=$image, imagePath=$imagePath, isRead=$isRead, type=$type, orderId=$orderId, notification=$notification, notificationAr=$notificationAr, notificationEn=$notificationEn, provider=$provider, providerId=$providerId, title=$title, titleAr=$titleAr, titleEn=$titleEn, updatedAt=$updatedAt, user=$user, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
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
    if (this.isRead != null) {
      json[r'is_read'] = this.isRead;
    } else {
      json[r'is_read'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.orderId != null) {
      json[r'order_id'] = this.orderId;
    } else {
      json[r'order_id'] = null;
    }
    if (this.notification != null) {
      json[r'notification'] = this.notification;
    } else {
      json[r'notification'] = null;
    }
    if (this.notificationAr != null) {
      json[r'notification_ar'] = this.notificationAr;
    } else {
      json[r'notification_ar'] = null;
    }
    if (this.notificationEn != null) {
      json[r'notification_en'] = this.notificationEn;
    } else {
      json[r'notification_en'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    if (this.providerId != null) {
      json[r'provider_id'] = this.providerId;
    } else {
      json[r'provider_id'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.titleAr != null) {
      json[r'title_ar'] = this.titleAr;
    } else {
      json[r'title_ar'] = null;
    }
    if (this.titleEn != null) {
      json[r'title_en'] = this.titleEn;
    } else {
      json[r'title_en'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    return json;
  }

  /// Returns a new [ShowNotifications1200ResponseDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowNotifications1200ResponseDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowNotifications1200ResponseDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowNotifications1200ResponseDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowNotifications1200ResponseDataInner(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        image: mapValueOfType<String>(json, r'image'),
        imagePath: mapValueOfType<String>(json, r'imagePath'),
        isRead: json[r'is_read'] == null
            ? null
            : num.parse(json[r'is_read'].toString()),
        type: mapValueOfType<String>(json, r'type'),
        orderId: json[r'order_id'] == null
            ? null
            : num.parse(json[r'order_id'].toString()),
        notification: mapValueOfType<String>(json, r'notification'),
        notificationAr: mapValueOfType<String>(json, r'notification_ar'),
        notificationEn: mapValueOfType<String>(json, r'notification_en'),
        provider: ShowNotifications1200ResponseDataInnerProvider.fromJson(json[r'provider']),
        providerId: json[r'provider_id'] == null
            ? null
            : num.parse(json[r'provider_id'].toString()),
        title: mapValueOfType<String>(json, r'title'),
        titleAr: mapValueOfType<String>(json, r'title_ar'),
        titleEn: mapValueOfType<String>(json, r'title_en'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        user: ShowNotifications1200ResponseDataInnerUser.fromJson(json[r'user']),
        userId: mapValueOfType<Object>(json, r'user_id'),
      );
    }
    return null;
  }

  static List<ShowNotifications1200ResponseDataInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowNotifications1200ResponseDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowNotifications1200ResponseDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowNotifications1200ResponseDataInner> mapFromJson(dynamic json) {
    final map = <String, ShowNotifications1200ResponseDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowNotifications1200ResponseDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowNotifications1200ResponseDataInner-objects as value to a dart map
  static Map<String, List<ShowNotifications1200ResponseDataInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowNotifications1200ResponseDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowNotifications1200ResponseDataInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

