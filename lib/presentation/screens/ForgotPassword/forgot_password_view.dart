import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

import '../../../main.dart';
import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

class ForgotPasswordView extends ConsumerWidget {
  static const String routeName = "/forgot_password";

  const ForgotPasswordView({super.key});

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final isLoading = ValueNotifier(false);
    final isEmailValid = ValueNotifier(false);

    emailController.addListener(() {
      final isValid = _isValidEmail(emailController.text.trim());
      if (isEmailValid.value != isValid) {
        isEmailValid.value = isValid;
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (context, loading, _) {
          return Container(
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
                          text:
                              " We will send you a message to set or reset\nyour new password",
                          style: TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ValueListenableBuilder<bool>(
                  valueListenable: isEmailValid,
                  builder: (context, isValid, _) {
                    return ButtonPrimary(
                      text: loading ? "Loading..." : "Submit",
                      onPressed: loading
                          ? () {}
                          : () async {
                              if (!isValid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Please enter a valid email address."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              isLoading.value = true;
                              try {
                                await ref
                                    .read(userAdminStateProvider.notifier)
                                    .forgotPassword(
                                        emailController.text.trim());
                                Navigator.pushNamed(
                                    context, ForgotPasswordCodeView.routeName,
                                    arguments: emailController.text.trim());
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error: $error"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } finally {
                                isLoading.value = false;
                              }
                            },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
