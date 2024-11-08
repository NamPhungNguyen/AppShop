import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/Menu/Account/profile_view.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/assets_path_util.dart';

class UserProfileTile extends ConsumerWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);

    return userState.when(
      data: (userInfo) => ListTile(
        leading: CircleAvatar(
          child: Image.network(
              userInfo.result.profileImg ?? AssetsPathUtil.user("profile.png"),
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          userInfo.result.fullName ?? 'No Name',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
        ),
        subtitle: Text(
          userInfo.result.email ?? 'No Email',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileView.routeName);
          },
          icon: const Icon(Iconsax.edit, color: Colors.white),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (error, stack) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error: $error"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(userStateProvider); // This line will trigger a refresh of the state provider
                },
                child: const Text("Reload"),
              ),
            ],
          ),
        );
      },
    );
  }
}
