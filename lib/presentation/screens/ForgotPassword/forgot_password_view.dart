import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String routeName = "/forgot_password";

  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: ListView(
          children: [
            const Text(
              "Forgot\npassword?",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 26),
              child: InputFieldPrimary(
                labelText: "Enter your email address",
                controller: emailController,
                icon: const Icon(Icons.email),
                textInputAction: TextInputAction.done,
              ),
            ),
            const Text.rich(
              TextSpan(
                text: "*",
                style: TextStyle(
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: " We will send you a message to set or reset\nyour new password",
                    style: TextStyle(
                      color: AppColors.textSecondary
                    )
                  )
                ]
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonPrimary(
              text: "Submit",
              onPressed: (){
                Navigator.pushNamed(context, ForgotPasswordCodeView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
