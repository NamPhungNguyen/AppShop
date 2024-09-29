import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';

class SplashView extends StatelessWidget {
  static const String splash = '/';

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, LoginView.log_in_view);
    });

    return const Scaffold(
      backgroundColor: Colors.blue,
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
