import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_create_new_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../domain/models/validate.dart';
import '../../../main.dart';
import '../../../utils/constants/app_colors.dart';
import '../../commom/widgets/Button/button_primary.dart';

class ForgotPasswordCodeView extends ConsumerWidget {
  static const String routeName = "/forgot_password_code";

  final String email;

  const ForgotPasswordCodeView({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = ValueNotifier<String>("");

    ref.listen<AsyncValue<Validate>>(
      validateStateProvider,
      (previous, next) {
        next.when(
          data: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("OTP is correct!"),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.pushNamed(
              context,
              ForgotCreateNewPasswordView.routeName,
              arguments: email,
            );
          },
          error: (message, stack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message.toString()),
                backgroundColor: Colors.red,
              ),
            );
          },
          loading: () {},
        );
      },
    );

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
              "Enter 4 Digit Code",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Enter 4 digit code that you received on your email.",
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.none,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 48,
                  fieldWidth: 48,
                  activeColor: Colors.grey,
                  selectedColor: Colors.pink,
                  inactiveColor: Colors.grey,
                ),
                onChanged: (value) {
                  otpController.value = value;
                },
                onCompleted: (value) {
                  print("Code entered: $value");
                },
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Email not received? ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Resend Code",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Resend Code Clicked");
                        },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: ButtonPrimary(
                text: "Continue",
                onPressed: () async {
                  final otp = otpController.value;
                  if (otp.length < 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid 4-digit code."),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  await ref
                      .read(validateStateProvider.notifier)
                      .validateOtp(email, otp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
