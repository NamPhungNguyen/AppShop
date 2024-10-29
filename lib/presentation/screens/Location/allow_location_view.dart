import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/preference_util.dart';
import 'package:geolocator/geolocator.dart';
import '../../commom/widgets/Button/button_primary.dart';

class AllowLocationView extends ConsumerWidget {
  static const String routeName = "/allow_location";

  const AllowLocationView({super.key});

  Future<void> _requestLocationPermission(
      BuildContext context, WidgetRef ref) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permissions are denied forever.'),
        ),
      );
      await ref.read(locationStateProvider.notifier).updateLocation(false);
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await PreferenceUtil.setIsFirstAllowLocation(false);
      await ref.read(locationStateProvider.notifier).updateLocation(true);
      Navigator.pushNamed(context, BottomBar.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permissions are not granted.'),
        ),
      );
      await ref.read(locationStateProvider.notifier).updateLocation(false);
    }
  }

  Future<void> _checkFirstLaunch(BuildContext context, WidgetRef ref) async {
    bool isFirstLaunch = await PreferenceUtil.getIsFirstAllowLocation();
    print("isFirstLaunch Before, $isFirstLaunch");
    if (isFirstLaunch) {
      await PreferenceUtil.setIsFirstAllowLocation(false);
      // Fetch the new value to confirm it’s updated
      bool updatedIsFirstLaunch = await PreferenceUtil.getIsFirstAllowLocation();
      print("isFirstLaunch After Update: $updatedIsFirstLaunch");
      await _requestLocationPermission(context, ref);
    } else {
      Navigator.pushNamed(context, BottomBar.routeName);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(locationStateProvider, (previous, next) {
      // Check if there is an error in the location update process
      next.when(
        data: (_) {},
        loading: () {},
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error updating location: $error')),
          );
          print(error);
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPathUtil.location("location.png"),
              color: AppColors.primaryColor,
              height: 50,
              width: 38,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              "What is Your Location?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We need to know your location in order to suggest nearby services.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 48),
            ButtonPrimary(
              text: "Allow Location Access",
              onPressed: () => _checkFirstLaunch(context, ref),
            ),
          ],
        ),
      ),
    );
  }
}
