import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Dialog/base_dialog_view.dart';
import '../../commom/widgets/Input/input_field_primary.dart';
import '../Login/log_in_view.dart';

class ForgotCreateNewPasswordView extends ConsumerStatefulWidget {
  static const String routeName = "/forgot_create_new_pass";
  final String email;

  const ForgotCreateNewPasswordView({super.key, required this.email});

  @override
  ConsumerState<ForgotCreateNewPasswordView> createState() =>
      _ForgotCreateNewPasswordViewState();
}

class _ForgotCreateNewPasswordViewState
    extends ConsumerState<ForgotCreateNewPasswordView> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false; // State loading

  void handleChangePassword() async {
    if (newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      BaseDialogView(
        titleDialog: 'Please fill in all fields!',
        imageDialog: AssetsPathUtil.dialog("error.png"),
        onPressed: () {},
      ).showBaseDialog(context);
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      BaseDialogView(
        titleDialog: 'Passwords do not match!',
        onPressed: () {},
        imageDialog: AssetsPathUtil.dialog("error.png"),
      ).showBaseDialog(context);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await changePassword(widget.email, newPasswordController.text, ref);

      BaseDialogView(
        titleDialog: 'Password updated successfully!',
        imageDialog: AssetsPathUtil.dialog("checkmark.png"),
        onPressed: () {
          Navigator.pushNamed(context, LoginView.routeName);
        },
      ).showBaseDialog(context);
    } catch (error) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              controller: newPasswordController,
              icon: const Icon(Icons.person_rounded),
              isPassword: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16,
            ),
            InputFieldPrimary(
              labelText: "Enter your confirm Password",
              controller: confirmPasswordController,
              icon: const Icon(Icons.lock),
              isPassword: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 68,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ButtonPrimary(
                    text: "Update Password",
                    onPressed: handleChangePassword,
                  ),
          ],
        ),
      ),
    );
  }
}

Future<void> changePassword(
    String email, String newPassword, WidgetRef ref) async {
  try {
    final userUsecase = ref.read(userAdminStateProvider.notifier);
    await userUsecase.changePassword(email, newPassword);
  } catch (error) {
    throw Exception('Error updating password');
  }
}
