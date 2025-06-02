import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/presentation/screens/Admin/admin_home.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/preference_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../Onboarding/onboarding.dart';

class SplashView extends ConsumerWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  Future<void> _navigationBasedOnConditions(
      BuildContext context, WidgetRef ref, String? token) async {
    final isTokenExpired = await PreferenceUtil.isTokenExpired();
    final pref = await SharedPreferences.getInstance();
    final isFirstLaunch = pref.getBool('isFirstLaunch') ?? true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (token != null && !isTokenExpired) {
        // Decode token and check if the user is an admin
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        String scope = decodedToken['scope'] ?? '';

        if (scope == 'ADMIN') {
          // If the user is admin, navigate to the admin home
          Navigator.pushReplacementNamed(context, AdminHome.routeName);
        } else {
          // If the user is a regular user, navigate to the bottom bar
          Navigator.pushReplacementNamed(context, BottomBar.routeName);
        }
      } else if (isFirstLaunch) {
        // First launch, show onboarding
        pref.setBool('isFirstLaunch', false);
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      } else {
        // Token is invalid or expired, show login
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(tokenStateProvider, (previous, next) {
      next.whenData((token) {
        _navigationBasedOnConditions(context, ref, token);
      });
    });

    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App Shop',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
