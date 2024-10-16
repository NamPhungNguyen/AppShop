import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/assets_path_util.dart';

import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Dialog/base_dialog_view.dart';
import '../../commom/widgets/FormLoginWith/form_login_with.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = '/sign_up_view';

  const SignUpView({super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  bool isPrivacyChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 34),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 33),
              child: Text(
                "Create an\naccount",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            InputFieldPrimary(
              labelText: 'Username',
              controller: usernameController,
              icon: const Icon(Icons.person_rounded),
            ),
            const SizedBox(height: 16),
            InputFieldPrimary(
              labelText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 16),
            InputFieldPrimary(
              labelText: 'Confirm Password',
              isPassword: true,
              controller: repeatPasswordController,
              icon: const Icon(Icons.lock),
              textInputAction: TextInputAction.done,
            ),

            // Checkbox for Privacy Agreement
            Row(
              children: [
                Checkbox(
                  value: isPrivacyChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isPrivacyChecked = newValue ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "I agree to the ",
                      style: const TextStyle(color: Color(0xFF676767)),
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                              color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Create Account Button
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: ButtonPrimary(
                text: "Create Account",
                onPressed: isPrivacyChecked
                    ? () {
                        BaseDialogView(
                          titleDialog: "Signup Successful!",
                          imageDialog: AssetsPathUtil.dialog("checkmark.png"),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginView.routeName);
                          },
                        ).showBaseDialog(context);
                      }
                    : () {}, // Provide a no-op callback when disabled
              ),
            ),

            const FormLoginWith(
              titleSuggest: "I Already Have an Account ",
              titleNext: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
