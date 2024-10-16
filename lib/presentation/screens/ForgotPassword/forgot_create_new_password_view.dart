import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/assets_path_util.dart';

import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Dialog/base_dialog_view.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

class ForgotCreateNewPasswordView extends StatelessWidget {
  static const String routeName = "/forgot_create_new_pass";

  const ForgotCreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final newPassword = TextEditingController();
    final confirmPassword = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: ListView(
          children: [
            const Text(
              "Create New Password",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 48,
            ),
            InputFieldPrimary(
              labelText: "Enter your new Password",
              controller: newPassword,
              icon: const Icon(Icons.person_rounded),
              isPassword: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16,
            ),
            InputFieldPrimary(
              labelText: "Enter your confirm Password",
              controller: confirmPassword,
              icon: const Icon(Icons.lock),
              isPassword: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 68,
            ),
            ButtonPrimary(
              text: "Update Password",
              onPressed: () {
                BaseDialogView(
                  titleDialog: 'Password updated successfully!',
                  imageDialog: AssetsPathUtil.dialog("checkmark.png"),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                ).showBaseDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
