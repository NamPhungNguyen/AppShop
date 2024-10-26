import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const String _authToken = 'AuthToken';
  static const String _isFirstTime = 'isFirstTime';

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
}
