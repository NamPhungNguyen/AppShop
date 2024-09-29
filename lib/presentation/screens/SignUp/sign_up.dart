import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import '../../widgets/Button/button_primary.dart';
import '../../widgets/Input/input_field_primary.dart';

class SignUpView extends StatelessWidget {
  static const String sign_up_view = '/sign_up_view';

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController repeatPasswordController =
        TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            // InputFieldPrimary(
            //   labelText: 'Username',
            //   controller: usernameController,
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // InputFieldPrimary(
            //   labelText: 'Email',
            //   isPassword: false,
            //   controller: emailController,
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // InputFieldPrimary(
            //   labelText: 'Password',
            //   isPassword: true,
            //   controller: passwordController,
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // InputFieldPrimary(
            //   labelText: 'Repeat Password',
            //   isPassword: true,
            //   controller: repeatPasswordController,
            // ),
            const SizedBox(
              height: 16.0,
            ),
            ButtonPrimary(
              text: "Sign Up",
              onPressed: () {},
            ),
            Align(
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, LoginView.log_in_view);
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
