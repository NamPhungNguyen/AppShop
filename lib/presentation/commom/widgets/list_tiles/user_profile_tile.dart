import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Menu/Account/profile_view.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/assets_path_util.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          child: Image.asset(AssetsPathUtil.user("profile.png"),
              width: 50, height: 50)),
      title: Text("Nam Phung",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white)),
      subtitle: Text("namhien12802003@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
      trailing: IconButton(onPressed: (){Navigator.pushNamed(context, ProfileView.routeName);}, icon: const Icon(Iconsax.edit, color: Colors.white,)),
    );
  }
}