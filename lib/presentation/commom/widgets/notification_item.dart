import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String titleNotify;
  final String subTitleNotify;
  final String date;

  const NotificationItem({
    super.key,
    required this.icon,
    required this.titleNotify,
    required this.subTitleNotify,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.black,
      ),
      title: Text(
        titleNotify,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitleNotify,
            style: const TextStyle(
              color: AppColors.tertiaryText,
              fontSize: 16,
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      onTap: () {
        print('Notification tapped');
      },
    );
  }
}
