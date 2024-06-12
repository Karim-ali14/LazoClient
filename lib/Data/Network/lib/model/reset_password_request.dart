//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResetPasswordRequest {
  /// Returns a new [ResetPasswordRequest] instance.
  ResetPasswordRequest({
    this.emailOrPhone,
    this.newPassword,
    this.confirmNewPassword,
    this.accountType,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailOrPhone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newPassword;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? confirmNewPassword;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResetPasswordRequest &&
     other.emailOrPhone == emailOrPhone &&
     other.newPassword == newPassword &&
     other.confirmNewPassword == confirmNewPassword &&
     other.accountType == accountType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emailOrPhone == null ? 0 : emailOrPhone!.hashCode) +
    (newPassword == null ? 0 : newPassword!.hashCode) +
    (confirmNewPassword == null ? 0 : confirmNewPassword!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode);

  @override
  String toString() => 'ResetPasswordRequest[emailOrPhone=$emailOrPhone, newPassword=$newPassword, confirmNewPassword=$confirmNewPassword, accountType=$accountType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.emailOrPhone != null) {
      json[r'email_or_phone'] = this.emailOrPhone;
    } else {
      json[r'email_or_phone'] = null;
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
    if (this.accountType != null) {
      json[r'account_type'] = this.accountType;
    } else {
      json[r'account_type'] = null;
    }
    return json;
  }

  /// Returns a new [ResetPasswordRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResetPasswordRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResetPasswordRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResetPasswordRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResetPasswordRequest(
        emailOrPhone: mapValueOfType<String>(json, r'email_or_phone'),
        newPassword: mapValueOfType<String>(json, r'new_password'),
        confirmNewPassword: mapValueOfType<String>(json, r'confirm_new_password'),
        accountType: mapValueOfType<String>(json, r'account_type'),
      );
    }
    return null;
  }

  static List<ResetPasswordRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ResetPasswordRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResetPasswordRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResetPasswordRequest> mapFromJson(dynamic json) {
    final map = <String, ResetPasswordRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResetPasswordRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResetPasswordRequest-objects as value to a dart map
  static Map<String, List<ResetPasswordRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResetPasswordRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ResetPasswordRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

