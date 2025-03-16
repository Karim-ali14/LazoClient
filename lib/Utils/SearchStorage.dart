import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SearchStorage {
  static const String product_key = 'product_recent_searches';
  static const String service_key = 'service_recent_searches';
  static const String seller_key = 'seller_recent_searches';

  // Save a search query
  static Future<void> saveSearch({String? key, String? query}) async {
    List<String> searches = prefs.getStringList(key!) ?? [];

    // Avoid duplicates and limit recent searches
    if (!searches.contains(query)) {
      searches.insert(0, query!);
      if (searches.length > 10) searches.removeLast(); // Keep last 10 searches
    }
    print("asdfsfs $searches");
    await prefs.setStringList(key, searches);
  }

  // Get all recent searches
  static Future<List<String>> getSearches(String key ,) async {
    print("asdfsfs ${prefs.getStringList(key) ?? []}");
    return prefs.getStringList(key) ?? [];
  }

  // Clear recent searches
  static Future<void> clearSearches(String key) async {
    await prefs.remove(key);
  }
}
