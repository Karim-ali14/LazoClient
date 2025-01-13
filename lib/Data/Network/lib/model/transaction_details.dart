//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TransactionDetails {
  /// Returns a new [TransactionDetails] instance.
  TransactionDetails({
    this.id,
    this.providerId,
    this.number,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.receipt,
    this.dateTime,
    this.status,
    this.sender,
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
  String? providerId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? number;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? orderId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? receipt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dateTime;

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
  String? sender;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TransactionDetails &&
     other.id == id &&
     other.providerId == providerId &&
     other.number == number &&
     other.amount == amount &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt &&
     other.orderId == orderId &&
     other.receipt == receipt &&
     other.dateTime == dateTime &&
     other.status == status &&
     other.sender == sender;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (number == null ? 0 : number!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (receipt == null ? 0 : receipt!.hashCode) +
    (dateTime == null ? 0 : dateTime!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (sender == null ? 0 : sender!.hashCode);

  @override
  String toString() => 'TransactionDetails[id=$id, providerId=$providerId, number=$number, amount=$amount, createdAt=$createdAt, updatedAt=$updatedAt, orderId=$orderId, receipt=$receipt, dateTime=$dateTime, status=$status, sender=$sender]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.providerId != null) {
      json[r'provider_id'] = this.providerId;
    } else {
      json[r'provider_id'] = null;
    }
    if (this.number != null) {
      json[r'number'] = this.number;
    } else {
      json[r'number'] = null;
    }
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'created_at'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt!.toUtc().toIso8601String();
    } else {
      json[r'updated_at'] = null;
    }
    if (this.orderId != null) {
      json[r'order_id'] = this.orderId;
    } else {
      json[r'order_id'] = null;
    }
    if (this.receipt != null) {
      json[r'receipt'] = this.receipt;
    } else {
      json[r'receipt'] = null;
    }
    if (this.dateTime != null) {
      json[r'date_time'] = this.dateTime;
    } else {
      json[r'date_time'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.sender != null) {
      json[r'sender'] = this.sender;
    } else {
      json[r'sender'] = null;
    }
    return json;
  }

  /// Returns a new [TransactionDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TransactionDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TransactionDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TransactionDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TransactionDetails(
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        providerId: mapValueOfType<String>(json, r'provider_id'),
        number: mapValueOfType<String>(json, r'number'),
        amount: mapValueOfType<String>(json, r'amount'),
        createdAt: mapDateTime(json, r'created_at', ''),
        updatedAt: mapDateTime(json, r'updated_at', ''),
        orderId: mapValueOfType<String>(json, r'order_id'),
        receipt: mapValueOfType<String>(json, r'receipt'),
        dateTime: mapValueOfType<String>(json, r'date_time'),
        status: mapValueOfType<String>(json, r'status'),
        sender: mapValueOfType<String>(json, r'sender'),
      );
    }
    return null;
  }

  static List<TransactionDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransactionDetails> mapFromJson(dynamic json) {
    final map = <String, TransactionDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TransactionDetails-objects as value to a dart map
  static Map<String, List<TransactionDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TransactionDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TransactionDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

