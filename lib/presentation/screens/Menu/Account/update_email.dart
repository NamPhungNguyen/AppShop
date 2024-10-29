import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../main.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';

class UpdateProfileEmailView extends ConsumerWidget {
  static const String routeName = "/update_profile_email";

  const UpdateProfileEmailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      appBar: const TAppbar(showBackArrow: true, title: Text("Update email")),
      body: userState.when(
        data: (user) {
          TextEditingController emailController =
              TextEditingController(text: user.result.email);

          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  // Update Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        String newEmail = emailController.text;

                        await ref
                            .read(userStateProvider.notifier)
                            .updateEmail(newEmail);

                        Fluttertoast.showToast(
                          msg: 'Profile email updated successfully',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      },
                      child: const Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stack) {
          return Center(child: Text("Error: $error"));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
