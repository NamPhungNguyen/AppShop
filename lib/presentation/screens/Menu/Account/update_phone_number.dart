import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../main.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';

class UpdatePhoneNumberView extends ConsumerWidget {
  static const String routeName = "/update_phone_number";

  const UpdatePhoneNumberView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      appBar: const TAppbar(
          showBackArrow: true, title: Text("Update Phone Number")),
      body: userState.when(
        data: (user) {
          TextEditingController phoneController =
              TextEditingController(text: user.result.phoneNumber);

          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  // Update Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        String newPhoneNumber = phoneController.text;

                        await ref
                            .read(userStateProvider.notifier)
                            .updatePhone(newPhoneNumber);

                        Fluttertoast.showToast(
                          msg: 'Phone number updated successfully',
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
