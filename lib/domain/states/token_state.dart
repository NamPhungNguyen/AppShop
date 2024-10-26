import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/preference_util.dart';

class TokenState extends StateNotifier<AsyncValue<String?>> {
  TokenState() : super(const AsyncValue.loading()) {
    _checkToken();
  }

  Future<void> _checkToken() async {
    try {
      final token = await PreferenceUtil.getAuthToken();
      if (token != null) {
        state = AsyncValue.data(token);
      } else {
        state = const AsyncValue.data(null); // no token auth
      }
    }catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}