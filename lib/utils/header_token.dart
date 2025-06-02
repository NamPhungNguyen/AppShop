import 'package:front_shop/utils/preference_util.dart';

class Util {
  /// Retrieves the authorization token, prefixed with "Bearer ".
  static Future<String> createAuthorization() async {
    try {
      final token = await getAccessToken();
      return 'Bearer $token';
    } catch (err) {
      print("Token retrieval error: $err");
      return 'Bearer Unknown';
    }
  }

  static Future<String> getAccessToken() async {
    final token = await PreferenceUtil.getAuthToken();
    if (token == null || token.isEmpty) {
      throw Exception("Access token is missing or invalid.");
    }
    return token;
  }
}
