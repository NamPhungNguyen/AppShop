import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const String _authToken = 'AuthToken';
  static const String _tokenExpiry = 'TokenExpiry';
  static const String _isFirstTime = 'isFirstTime';
  static const String _isFirstAllowLocation = 'isFirstAllowLocation';
  static const String _favorites = 'favorites';

  // Store the authentication token and its expiration
  static Future<bool> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final decodedToken = json.decode(
        utf8.decode(base64.decode(base64.normalize(token.split('.')[1]))));
    final exp = decodedToken['exp']; // Get the expiration timestamp
    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

    // Store token and its expiry date
    await prefs.setString(_authToken, token);
    return await prefs.setString(_tokenExpiry, expiryDate.toIso8601String());
  }

  // Retrieve the authentication token
  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken);
  }

  // Check if the token is expired
  static Future<bool> isTokenExpired() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final expiryString = prefs.getString(_tokenExpiry);

    if (expiryString == null) {
      return true; // No expiry info, treat as expired
    }

    final expiryDate = DateTime.parse(expiryString);
    return DateTime.now().isAfter(expiryDate);
  }

  // Remove the authentication token
  static Future<bool> removeAuthToken() async {
    final pref = await SharedPreferences.getInstance();

    // Await both remove calls and combine their results
    bool removedAuthToken = await pref.remove(_authToken);
    bool removedTokenExpiry = await pref.remove(_tokenExpiry);

    return removedAuthToken && removedTokenExpiry;
  }

  // Other preference methods remain unchanged
  static Future<bool> setIsFirstTime(bool isFirstTime) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_isFirstTime, isFirstTime);
  }

  static Future<bool> getIsFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_isFirstTime) ?? true;
  }

  static Future<bool> getIsFirstAllowLocation() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_isFirstAllowLocation) ?? true;
  }

  static Future<bool> setIsFirstAllowLocation(bool isFirstAllowLocation) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_isFirstAllowLocation, isFirstAllowLocation);
  }

  // Methods to manage favorite products
  static Future<bool> addFavorite(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favorites) ?? [];
    if (!favorites.contains(productId)) {
      favorites.add(productId);
      return await prefs.setStringList(_favorites, favorites);
    }
    return false; // Already exists
  }

  static Future<bool> removeFavorite(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favorites) ?? [];
    if (favorites.contains(productId)) {
      favorites.remove(productId);
      return await prefs.setStringList(_favorites, favorites);
    }
    return false; // Not found
  }

  static Future<List<String>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favorites) ?? [];
  }
}
