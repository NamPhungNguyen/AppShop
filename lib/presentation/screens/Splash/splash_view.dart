import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/login.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/presentation/screens/Menu/Cart/cart_view.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';
import 'package:front_shop/presentation/screens/Order/order_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, OnBoardingView.routeName);
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
