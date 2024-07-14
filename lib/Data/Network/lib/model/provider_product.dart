//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderProduct {
  /// Returns a new [ProviderProduct] instance.
  ProviderProduct({
    this.amount,
    this.categories = const [],
    this.categoryMenu = const [],
    this.colors = const [],
    this.createdAt,
    this.description,
    this.descriptionAr,
    this.descriptionEn,
    this.expectedProcessingTime,
    this.isVisible,
    this.id,
    this.images = const [],
    this.lists = const [],
    this.name,
    this.nameAr,
    this.nameEn,
    this.occasions = const [],
    this.price,
    this.priceAfterDiscount,
    this.providerId,
    this.sizes = const [],
    this.type,
    this.updatedAt,
    this.inCart,
    this.inWishlist,
    this.overallRating,
    this.ratingsCount,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? amount;

  List<Category>? categories;

  List<CategoryMenu>? categoryMenu;

  List<Color>? colors;

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
  String? expectedProcessingTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? isVisible;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? id;

  List<ImageItem>? images;

  List<ProductListItem>? lists;

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

  List<Occasion>? occasions;

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

  List<Size>? sizes;

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
  String? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? inCart;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? inWishlist;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? overallRating;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? ratingsCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderProduct &&
     other.amount == amount &&
     other.categories == categories &&
     other.categoryMenu == categoryMenu &&
     other.colors == colors &&
     other.createdAt == createdAt &&
     other.description == description &&
     other.descriptionAr == descriptionAr &&
     other.descriptionEn == descriptionEn &&
     other.expectedProcessingTime == expectedProcessingTime &&
     other.isVisible == isVisible &&
     other.id == id &&
     other.images == images &&
     other.lists == lists &&
     other.name == name &&
     other.nameAr == nameAr &&
     other.nameEn == nameEn &&
     other.occasions == occasions &&
     other.price == price &&
     other.priceAfterDiscount == priceAfterDiscount &&
     other.providerId == providerId &&
     other.sizes == sizes &&
     other.type == type &&
     other.updatedAt == updatedAt &&
     other.inCart == inCart &&
     other.inWishlist == inWishlist &&
     other.overallRating == overallRating &&
     other.ratingsCount == ratingsCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (categories == null ? 0 : categories!.hashCode) +
    (categoryMenu == null ? 0 : categoryMenu!.hashCode) +
    (colors == null ? 0 : colors!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (descriptionAr == null ? 0 : descriptionAr!.hashCode) +
    (descriptionEn == null ? 0 : descriptionEn!.hashCode) +
    (expectedProcessingTime == null ? 0 : expectedProcessingTime!.hashCode) +
    (isVisible == null ? 0 : isVisible!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (images == null ? 0 : images!.hashCode) +
    (lists == null ? 0 : lists!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (occasions == null ? 0 : occasions!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (priceAfterDiscount == null ? 0 : priceAfterDiscount!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (sizes == null ? 0 : sizes!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (inCart == null ? 0 : inCart!.hashCode) +
    (inWishlist == null ? 0 : inWishlist!.hashCode) +
    (overallRating == null ? 0 : overallRating!.hashCode) +
    (ratingsCount == null ? 0 : ratingsCount!.hashCode);

  @override
  String toString() => 'ProviderProduct[amount=$amount, categories=$categories, categoryMenu=$categoryMenu, colors=$colors, createdAt=$createdAt, description=$description, descriptionAr=$descriptionAr, descriptionEn=$descriptionEn, expectedProcessingTime=$expectedProcessingTime, isVisible=$isVisible, id=$id, images=$images, lists=$lists, name=$name, nameAr=$nameAr, nameEn=$nameEn, occasions=$occasions, price=$price, priceAfterDiscount=$priceAfterDiscount, providerId=$providerId, sizes=$sizes, type=$type, updatedAt=$updatedAt, inCart=$inCart, inWishlist=$inWishlist, overallRating=$overallRating, ratingsCount=$ratingsCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.categories != null) {
      json[r'categories'] = this.categories;
    } else {
      json[r'categories'] = null;
    }
    if (this.categoryMenu != null) {
      json[r'category_menu'] = this.categoryMenu;
    } else {
      json[r'category_menu'] = null;
    }
    if (this.colors != null) {
      json[r'colors'] = this.colors;
    } else {
      json[r'colors'] = null;
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
    if (this.expectedProcessingTime != null) {
      json[r'expected_processing_time'] = this.expectedProcessingTime;
    } else {
      json[r'expected_processing_time'] = null;
    }
    if (this.isVisible != null) {
      json[r'is_visible'] = this.isVisible;
    } else {
      json[r'is_visible'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.images != null) {
      json[r'images'] = this.images;
    } else {
      json[r'images'] = null;
    }
    if (this.lists != null) {
      json[r'lists'] = this.lists;
    } else {
      json[r'lists'] = null;
    }
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
    if (this.occasions != null) {
      json[r'occasions'] = this.occasions;
    } else {
      json[r'occasions'] = null;
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
    if (this.sizes != null) {
      json[r'sizes'] = this.sizes;
    } else {
      json[r'sizes'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.inCart != null) {
      json[r'in_cart'] = this.inCart;
    } else {
      json[r'in_cart'] = null;
    }
    if (this.inWishlist != null) {
      json[r'in_wishlist'] = this.inWishlist;
    } else {
      json[r'in_wishlist'] = null;
    }
    if (this.overallRating != null) {
      json[r'overall_rating'] = this.overallRating;
    } else {
      json[r'overall_rating'] = null;
    }
    if (this.ratingsCount != null) {
      json[r'ratings_count'] = this.ratingsCount;
    } else {
      json[r'ratings_count'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderProduct] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderProduct? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderProduct[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderProduct[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderProduct(
        amount: json[r'amount'] == null
            ? null
            : num.parse(json[r'amount'].toString()),
        categories: Category.listFromJson(json[r'categories']),
        categoryMenu: CategoryMenu.listFromJson(json[r'category_menu']),
        colors: Color.listFromJson(json[r'colors']),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        description: mapValueOfType<String>(json, r'description'),
        descriptionAr: mapValueOfType<String>(json, r'description_ar'),
        descriptionEn: mapValueOfType<String>(json, r'description_en'),
        expectedProcessingTime: mapValueOfType<String>(json, r'expected_processing_time'),
        isVisible: mapValueOfType<int>(json, r'is_visible'),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        images: ImageItem.listFromJson(json[r'images']),
        lists: ProductListItem.listFromJson(json[r'lists']),
        name: mapValueOfType<String>(json, r'name'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        occasions: Occasion.listFromJson(json[r'occasions']),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        priceAfterDiscount: json[r'price_after_discount'] == null
            ? null
            : num.parse(json[r'price_after_discount'].toString()),
        providerId: json[r'provider_id'] == null
            ? null
            : num.parse(json[r'provider_id'].toString()),
        sizes: Size.listFromJson(json[r'sizes']),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        inCart: mapValueOfType<bool>(json, r'in_cart'),
        inWishlist: mapValueOfType<bool>(json, r'in_wishlist'),
        overallRating: json[r'overall_rating'] == null
            ? null
            : num.parse(json[r'overall_rating'].toString()),
        ratingsCount: json[r'ratings_count'] == null
            ? null
            : num.parse(json[r'ratings_count'].toString()),
      );
    }
    return null;
  }

  static List<ProviderProduct> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderProduct>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderProduct.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderProduct> mapFromJson(dynamic json) {
    final map = <String, ProviderProduct>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderProduct.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderProduct-objects as value to a dart map
  static Map<String, List<ProviderProduct>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderProduct>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderProduct.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

