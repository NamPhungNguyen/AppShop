import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Home/home_view.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/presentation/widgets/Input/input_field_primary.dart';
import 'package:front_shop/utils/assets_path_util.dart';

import '../../../utils/app_colors.dart';

class LoginView extends StatelessWidget {
  static const String log_in_view = '/log_in_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: ListView(
          children: [
            const Text(
              "Welcome\nBack!",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 36,
            ),
            InputFieldPrimary(
              labelText: 'Username or Email',
              controller: emailController,
              icon: const Icon(Icons.person_rounded),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InputFieldPrimary(
              labelText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(
              height: 14,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password ?",
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            ButtonPrimary(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, HomeView.home_view);
              },
            ),
            const SizedBox(
              height: 75,
            ),
            Column(
              children: [
                Text(
                  "- OR Continue with -",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF575757),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsPathUtil.login("google.png")),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Image.asset(AssetsPathUtil.login("apple.png")),
                      ),
                      Image.asset(AssetsPathUtil.login("facebook.png")),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              child: Text.rich(
                TextSpan(
                  text: "You don't have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign up now",
                      style: const TextStyle(color: AppColors.primaryTextAndButton, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
