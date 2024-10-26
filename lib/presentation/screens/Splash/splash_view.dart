import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Onboarding/onboarding.dart';

class SplashView extends ConsumerWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  Future<void> _navigationBasedOnConditions(BuildContext context, WidgetRef ref) async {
    final pref = await SharedPreferences.getInstance();
    final isFirstLaunch = pref.getBool('isFirstLaunch') ?? true;
    final token = ref.watch(tokenStateProvider).maybeWhen(
      data: (token) => token,
      orElse: () => null,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (token != null) {
        Navigator.pushReplacementNamed(context, BottomBar.routeName);
      } else if (isFirstLaunch) {
        pref.setBool('isFirstLaunch', false);
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(tokenStateProvider, (previous, next) {
      next.whenData((_) => _navigationBasedOnConditions(context, ref));
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
