import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Home/home_view.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import 'package:front_shop/utils/app_colors.dart';

class SplashView extends StatelessWidget {
  static const String splash = '/';

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeView.home_view);
    });
    return Scaffold(
      backgroundColor: AppColors.primaryTextAndButton,
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
