//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ClientSignup200ResponseData {
  /// Returns a new [ClientSignup200ResponseData] instance.
  ClientSignup200ResponseData({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ClientSignup200ResponseDataUser? user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ClientSignup200ResponseData &&
     other.accessToken == accessToken &&
     other.tokenType == tokenType &&
     other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken == null ? 0 : accessToken!.hashCode) +
    (tokenType == null ? 0 : tokenType!.hashCode) +
    (user == null ? 0 : user!.hashCode);

  @override
  String toString() => 'ClientSignup200ResponseData[accessToken=$accessToken, tokenType=$tokenType, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessToken != null) {
      json[r'access_token'] = this.accessToken;
    } else {
      json[r'access_token'] = null;
    }
    if (this.tokenType != null) {
      json[r'token_type'] = this.tokenType;
    } else {
      json[r'token_type'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    return json;
  }

  /// Returns a new [ClientSignup200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ClientSignup200ResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ClientSignup200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ClientSignup200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ClientSignup200ResponseData(
        accessToken: mapValueOfType<String>(json, r'access_token'),
        tokenType: mapValueOfType<String>(json, r'token_type'),
        user: ClientSignup200ResponseDataUser.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<ClientSignup200ResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ClientSignup200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientSignup200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ClientSignup200ResponseData> mapFromJson(dynamic json) {
    final map = <String, ClientSignup200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClientSignup200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ClientSignup200ResponseData-objects as value to a dart map
  static Map<String, List<ClientSignup200ResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ClientSignup200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ClientSignup200ResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

