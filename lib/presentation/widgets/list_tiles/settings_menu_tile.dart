import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.icon, required this.title, required this.subTitle, this.trailing, this.opTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? opTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: AppColors.primaryColor),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: opTap,
    );
  }
}
