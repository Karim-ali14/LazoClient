//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Category {
  /// Returns a new [Category] instance.
  Category({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.servicesCount,
    this.productsCount,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
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
  String? nameEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameAr;

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
  num? servicesCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? productsCount;

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
  String? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Category &&
     other.id == id &&
     other.nameEn == nameEn &&
     other.nameAr == nameAr &&
     other.image == image &&
     other.servicesCount == servicesCount &&
     other.productsCount == productsCount &&
     other.imagePath == imagePath &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (servicesCount == null ? 0 : servicesCount!.hashCode) +
    (productsCount == null ? 0 : productsCount!.hashCode) +
    (imagePath == null ? 0 : imagePath!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'Category[id=$id, nameEn=$nameEn, nameAr=$nameAr, image=$image, servicesCount=$servicesCount, productsCount=$productsCount, imagePath=$imagePath, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.nameEn != null) {
      json[r'name_en'] = this.nameEn;
    } else {
      json[r'name_en'] = null;
    }
    if (this.nameAr != null) {
      json[r'name_ar'] = this.nameAr;
    } else {
      json[r'name_ar'] = null;
    }
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.servicesCount != null) {
      json[r'services_count'] = this.servicesCount;
    } else {
      json[r'services_count'] = null;
    }
    if (this.productsCount != null) {
      json[r'products_count'] = this.productsCount;
    } else {
      json[r'products_count'] = null;
    }
    if (this.imagePath != null) {
      json[r'imagePath'] = this.imagePath;
    } else {
      json[r'imagePath'] = null;
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
    return json;
  }

  /// Returns a new [Category] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Category? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Category[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Category[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Category(
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        image: mapValueOfType<String>(json, r'image'),
        servicesCount: json[r'services_count'] == null
            ? null
            : num.parse(json[r'services_count'].toString()),
        productsCount: json[r'products_count'] == null
            ? null
            : num.parse(json[r'products_count'].toString()),
        imagePath: mapValueOfType<String>(json, r'imagePath'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<Category> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Category>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Category.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Category> mapFromJson(dynamic json) {
    final map = <String, Category>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Category.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Category-objects as value to a dart map
  static Map<String, List<Category>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Category>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Category.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

