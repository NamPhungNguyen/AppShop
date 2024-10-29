import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const String _authToken = 'AuthToken';
  static const String _isFirstTime = 'isFirstTime';
  static const String _isFirstAllowLocation = 'isFirstAllowLocation';

  static Future<bool> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_authToken, token);
  }

  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken);
  }

  static Future<bool> removeAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(_authToken);
  }

  static Future<bool> setIsFirstTime(bool isFirstTime) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_isFirstTime, isFirstTime);
  }

  static Future<bool> getIsFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_isFirstTime) ?? true;
  }

  static Future<bool> setIsFirstAllowLocation(bool isFirstAllowLocation) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_isFirstAllowLocation, isFirstAllowLocation);
  }

  static Future<bool> getIsFirstAllowLocation() async {
    final pref = await SharedPreferences.getInstance();
    bool value = pref.getBool(_isFirstAllowLocation) ?? true;
    return value;
  }

  static Future<void> clearPreferences() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_authToken);
    await pref.setBool(_isFirstAllowLocation, true);
  }
}
