import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/presentation/widgets/Input/input_field_primary.dart';

import '../MainView/main_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 500,
              child: Expanded(
                child: Image(
                  image: AssetImage('assets/images/login_image.png'),
                ),
              ),
            ),
            InputFieldPrimary(
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            InputFieldPrimary(
              labelText: 'Password',
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password ?",
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ButtonPrimary(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, MainView.bottom_bar);
              },
            ),
            
            Align(
              child: Text.rich(
                TextSpan(
                  text: "You don't have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign up now",
                      style: const TextStyle(color: Colors.blue),
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
