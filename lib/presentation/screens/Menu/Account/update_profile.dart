import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../main.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';

class UpdateProfileNameView extends ConsumerWidget {
  static const String routeName = "/update_profile_name";

  const UpdateProfileNameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      appBar: const TAppbar(showBackArrow: true, title: Text("Update Name")),
      body: userState.when(
        data: (user) {
          TextEditingController nameController =
              TextEditingController(text: user.result.fullName);

          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  // Update Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        String newName = nameController.text;

                        await ref
                            .read(userStateProvider.notifier)
                            .updateProfile(newName);

                        Fluttertoast.showToast(
                          msg: 'Profile name updated successfully',
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
