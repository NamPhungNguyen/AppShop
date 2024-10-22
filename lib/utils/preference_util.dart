import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const String _authToken = 'AuthToken';

  // Store token
  static Future<bool> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_authToken, token);
  }

  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken);
  }
}

