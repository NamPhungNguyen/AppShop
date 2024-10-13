import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/presentation/widgets/FormLoginWith/form_login_with.dart';
import 'package:front_shop/presentation/widgets/Input/input_field_primary.dart';

class LoginView extends StatelessWidget {
  static const String log_in_view = '/log_in_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
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
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 14,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPasswordView.forgot_password);
                },
                child: const Text(
                  "Forgot password ?",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            ButtonPrimary(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, BottomBar.bottom_bar);
              },
            ),
            const FormLoginWith(
              titleSuggest: "You don't have an account? ",
              titleNext: "Sign up",
              checkTitleNext: true,
            )
          ],
        ),
      ),
    );
  }
}
