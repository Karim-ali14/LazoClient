
import 'dart:convert';

import 'package:lazo_client/Data/Network/lib/api.dart';

import '../Localization/Keys.dart';
import '../main.dart';

/// Saves any JSON-serializable object to SharedPreferences
Future<void> saveObject<T>(String key, T object, Map<String, dynamic> Function(T) toJson) async {
  String jsonString = jsonEncode(toJson(object));
  await prefs.setString(key, jsonString);
}

/// Retrieves an object from SharedPreferences using its key and a fromJson function
Future<T?> getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
  String? jsonString = prefs.getString(key);

  if (jsonString != null) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }

  return null;
}

void saveCountrySelected(Country? country) {
  saveObject<Country>(countrySelectedKey, country??Country(), (Country value) => value.toJson());
}

void saveCitySelected(City? citySelected) {
  saveObject<City>(citySelectedKey, citySelected??City(), (City value) => value.toJson());
  prefs.setInt(selectedCityIdKey, citySelected?.id ?? 0);
}
