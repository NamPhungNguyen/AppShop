import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';

class LocationState extends StateNotifier<AsyncValue<bool>> {
  final StateNotifierProviderRef _ref;
  LocationState(this._ref) : super(const AsyncValue.loading()){
    _fetchInitialLocationPreference();
  }

  Future<void> _fetchInitialLocationPreference() async {
    try {
      // Simulate fetching data
      final initialPreference = await Future.delayed(
        const Duration(milliseconds: 1), // Simulating network delay
            () => true, // Simulate getting a boolean preference
      );
      state = AsyncValue.data(initialPreference);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updateLocation(bool isLocationEnable) async {
    state = const AsyncValue.loading();
    try {
      final locationResult = _ref.read(locationUsecaseProvider);
      await locationResult.updateLocation(isLocationEnable);

      state = AsyncValue.data(isLocationEnable);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
