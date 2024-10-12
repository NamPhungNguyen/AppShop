import 'package:flutter/material.dart';
import 'package:front_shop/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String titleNotify;
  final String subTitleNotify;
  final String date;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.titleNotify,
    required this.subTitleNotify,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: Colors.black,
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleNotify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subTitleNotify,
                    style: TextStyle(
                      color: AppColors.tertiaryText,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
