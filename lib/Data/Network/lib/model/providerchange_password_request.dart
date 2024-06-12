//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderchangePasswordRequest {
  /// Returns a new [ProviderchangePasswordRequest] instance.
  ProviderchangePasswordRequest({
    this.oldPassword,
    this.newPassword,
    this.confirmNewPassword,
  });

  /// The current password of the provider
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oldPassword;

  /// The new password, minimum 8 characters with at least one letter
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newPassword;

  /// The new password again for confirmation, minimum 8 characters with at least one letter
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? confirmNewPassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderchangePasswordRequest &&
     other.oldPassword == oldPassword &&
     other.newPassword == newPassword &&
     other.confirmNewPassword == confirmNewPassword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (oldPassword == null ? 0 : oldPassword!.hashCode) +
    (newPassword == null ? 0 : newPassword!.hashCode) +
    (confirmNewPassword == null ? 0 : confirmNewPassword!.hashCode);

  @override
  String toString() => 'ProviderchangePasswordRequest[oldPassword=$oldPassword, newPassword=$newPassword, confirmNewPassword=$confirmNewPassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.oldPassword != null) {
      json[r'old_password'] = this.oldPassword;
    } else {
      json[r'old_password'] = null;
    }
    if (this.newPassword != null) {
      json[r'new_password'] = this.newPassword;
    } else {
      json[r'new_password'] = null;
    }
    if (this.confirmNewPassword != null) {
      json[r'confirm_new_password'] = this.confirmNewPassword;
    } else {
      json[r'confirm_new_password'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderchangePasswordRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderchangePasswordRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProviderchangePasswordRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProviderchangePasswordRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProviderchangePasswordRequest(
        oldPassword: mapValueOfType<String>(json, r'old_password'),
        newPassword: mapValueOfType<String>(json, r'new_password'),
        confirmNewPassword: mapValueOfType<String>(json, r'confirm_new_password'),
      );
    }
    return null;
  }

  static List<ProviderchangePasswordRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderchangePasswordRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderchangePasswordRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderchangePasswordRequest> mapFromJson(dynamic json) {
    final map = <String, ProviderchangePasswordRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderchangePasswordRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderchangePasswordRequest-objects as value to a dart map
  static Map<String, List<ProviderchangePasswordRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderchangePasswordRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderchangePasswordRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

