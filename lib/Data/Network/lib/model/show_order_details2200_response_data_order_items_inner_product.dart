//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShowOrderDetails2200ResponseDataOrderItemsInnerProduct {
  /// Returns a new [ShowOrderDetails2200ResponseDataOrderItemsInnerProduct] instance.
  ShowOrderDetails2200ResponseDataOrderItemsInnerProduct({
    this.hasStock,
    this.amount,
    this.expectedProcessingTime,
    this.colors = const [],
    this.sizes = const [],
    this.coverImagePath,
    this.coverImage,
    this.createdAt,
    this.description,
    this.descriptionAr,
    this.descriptionEn,
    this.id,
    this.isVisible,
    this.lists = const [],
    this.name,
    this.nameAr,
    this.nameEn,
    this.price,
    this.priceAfterDiscount,
    this.providerId,
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? hasStock;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expectedProcessingTime;

  List<Color> colors;

  List<Size> sizes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? coverImagePath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? coverImage;

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
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionEn;

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
  num? isVisible;

  List<ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInner> lists;

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
  String? nameAr;

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
  num? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? priceAfterDiscount;

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
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShowOrderDetails2200ResponseDataOrderItemsInnerProduct &&
     other.hasStock == hasStock &&
     other.amount == amount &&
     other.expectedProcessingTime == expectedProcessingTime &&
     other.colors == colors &&
     other.sizes == sizes &&
     other.coverImagePath == coverImagePath &&
     other.coverImage == coverImage &&
     other.createdAt == createdAt &&
     other.description == description &&
     other.descriptionAr == descriptionAr &&
     other.descriptionEn == descriptionEn &&
     other.id == id &&
     other.isVisible == isVisible &&
     other.lists == lists &&
     other.name == name &&
     other.nameAr == nameAr &&
     other.nameEn == nameEn &&
     other.price == price &&
     other.priceAfterDiscount == priceAfterDiscount &&
     other.providerId == providerId &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hasStock == null ? 0 : hasStock!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (expectedProcessingTime == null ? 0 : expectedProcessingTime!.hashCode) +
    (colors.hashCode) +
    (sizes.hashCode) +
    (coverImagePath == null ? 0 : coverImagePath!.hashCode) +
    (coverImage == null ? 0 : coverImage!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (descriptionAr == null ? 0 : descriptionAr!.hashCode) +
    (descriptionEn == null ? 0 : descriptionEn!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isVisible == null ? 0 : isVisible!.hashCode) +
    (lists.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (priceAfterDiscount == null ? 0 : priceAfterDiscount!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ShowOrderDetails2200ResponseDataOrderItemsInnerProduct[hasStock=$hasStock, amount=$amount, expectedProcessingTime=$expectedProcessingTime, colors=$colors, sizes=$sizes, coverImagePath=$coverImagePath, coverImage=$coverImage, createdAt=$createdAt, description=$description, descriptionAr=$descriptionAr, descriptionEn=$descriptionEn, id=$id, isVisible=$isVisible, lists=$lists, name=$name, nameAr=$nameAr, nameEn=$nameEn, price=$price, priceAfterDiscount=$priceAfterDiscount, providerId=$providerId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hasStock != null) {
      json[r'has_stock'] = this.hasStock;
    } else {
      json[r'has_stock'] = null;
    }
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.expectedProcessingTime != null) {
      json[r'expected_processing_time'] = this.expectedProcessingTime;
    } else {
      json[r'expected_processing_time'] = null;
    }
      json[r'colors'] = this.colors;
      json[r'sizes'] = this.sizes;
    if (this.coverImagePath != null) {
      json[r'coverImagePath'] = this.coverImagePath;
    } else {
      json[r'coverImagePath'] = null;
    }
    if (this.coverImage != null) {
      json[r'cover_image'] = this.coverImage;
    } else {
      json[r'cover_image'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.descriptionAr != null) {
      json[r'description_ar'] = this.descriptionAr;
    } else {
      json[r'description_ar'] = null;
    }
    if (this.descriptionEn != null) {
      json[r'description_en'] = this.descriptionEn;
    } else {
      json[r'description_en'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isVisible != null) {
      json[r'is_visible'] = this.isVisible;
    } else {
      json[r'is_visible'] = null;
    }
      json[r'lists'] = this.lists;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.nameAr != null) {
      json[r'name_ar'] = this.nameAr;
    } else {
      json[r'name_ar'] = null;
    }
    if (this.nameEn != null) {
      json[r'name_en'] = this.nameEn;
    } else {
      json[r'name_en'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.priceAfterDiscount != null) {
      json[r'price_after_discount'] = this.priceAfterDiscount;
    } else {
      json[r'price_after_discount'] = null;
    }
    if (this.providerId != null) {
      json[r'provider_id'] = this.providerId;
    } else {
      json[r'provider_id'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ShowOrderDetails2200ResponseDataOrderItemsInnerProduct] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShowOrderDetails2200ResponseDataOrderItemsInnerProduct? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShowOrderDetails2200ResponseDataOrderItemsInnerProduct[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShowOrderDetails2200ResponseDataOrderItemsInnerProduct[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShowOrderDetails2200ResponseDataOrderItemsInnerProduct(
        hasStock: json[r'has_stock'] == null
            ? null
            : num.parse(json[r'has_stock'].toString()),
        amount: json[r'amount'] == null
            ? null
            : num.parse(json[r'amount'].toString()),
        expectedProcessingTime: mapValueOfType<String>(json, r'expected_processing_time'),
        colors: Color.listFromJson(json[r'colors']),
        sizes: Size.listFromJson(json[r'sizes']),
        coverImagePath: mapValueOfType<String>(json, r'coverImagePath'),
        coverImage: mapValueOfType<String>(json, r'cover_image'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        description: mapValueOfType<String>(json, r'description'),
        descriptionAr: mapValueOfType<String>(json, r'description_ar'),
        descriptionEn: mapValueOfType<String>(json, r'description_en'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        isVisible: json[r'is_visible'] == null
            ? null
            : num.parse(json[r'is_visible'].toString()),
        lists: ShowOrderDetails2200ResponseDataOrderItemsInnerProductListsInner.listFromJson(json[r'lists']),
        name: mapValueOfType<String>(json, r'name'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        priceAfterDiscount: json[r'price_after_discount'] == null
            ? null
            : num.parse(json[r'price_after_discount'].toString()),
        providerId: json[r'provider_id'] == null
            ? null
            : num.parse(json[r'provider_id'].toString()),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ShowOrderDetails2200ResponseDataOrderItemsInnerProduct> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShowOrderDetails2200ResponseDataOrderItemsInnerProduct>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShowOrderDetails2200ResponseDataOrderItemsInnerProduct.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShowOrderDetails2200ResponseDataOrderItemsInnerProduct> mapFromJson(dynamic json) {
    final map = <String, ShowOrderDetails2200ResponseDataOrderItemsInnerProduct>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShowOrderDetails2200ResponseDataOrderItemsInnerProduct.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShowOrderDetails2200ResponseDataOrderItemsInnerProduct-objects as value to a dart map
  static Map<String, List<ShowOrderDetails2200ResponseDataOrderItemsInnerProduct>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShowOrderDetails2200ResponseDataOrderItemsInnerProduct>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShowOrderDetails2200ResponseDataOrderItemsInnerProduct.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

