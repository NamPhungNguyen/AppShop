import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/assets_path_util.dart';
import 'package:front_shop/domain/models/my_info.dart';

import '../../../screens/Menu/Account/profile_view.dart';

class UserProfileTile extends StatelessWidget {
  final MyInfo user;

  const UserProfileTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final result = user.result;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: ClipOval(
        child: SizedBox(
          width: 55,
          height: 55,
          child: Image.network(
            result.profileImg ?? AssetsPathUtil.user("profile.png"),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AssetsPathUtil.user("profile.png"),
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
      title: Text(
        result.fullName ?? 'No Name',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: Colors.white),
      ),
      subtitle: Text(
        result.email ?? 'No Email',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: Colors.white70),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, ProfileView.routeName);
        },
        icon: const Icon(Iconsax.edit, color: Colors.white),
      ),
    );
  }
}
