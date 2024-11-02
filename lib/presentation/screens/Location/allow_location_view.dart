import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      Fluttertoast.showToast(
        msg: 'Location permissions are denied forever.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      await ref.read(locationStateProvider.notifier).updateLocation(false);
      await PreferenceUtil.setIsFirstAllowLocation(false);
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await ref.read(locationStateProvider.notifier).updateLocation(true);
      await PreferenceUtil.setIsFirstAllowLocation(false);
      Navigator.pushNamed(context, BottomBar.routeName);
    } else {
      Fluttertoast.showToast(
        msg: 'Location permissions are not granted.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      await ref.read(locationStateProvider.notifier).updateLocation(false);
    }
  }

  Future<void> _checkFirstLaunch(BuildContext context, WidgetRef ref) async {
    bool isFirstLocation = await PreferenceUtil.getIsFirstAllowLocation();
    if (isFirstLocation) {
      await _requestLocationPermission(context, ref);
      await PreferenceUtil.setIsFirstAllowLocation(false);
    } else {
      Navigator.pushNamed(context, BottomBar.routeName);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(locationStateProvider, (previous, next) {
      next.when(
        data: (_) {},
        loading: () {},
        error: (error, stack) {
          Fluttertoast.showToast(
            msg: 'Error updating location: $error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
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
