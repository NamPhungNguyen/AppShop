import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commom/widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  static const String notification = "notification";

  const NotificationView({super.key});

  String formatDate(DateTime date) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM dd, yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.local_offer_outlined,
        'title': '30% Special Discount!',
        'message': 'Special promotion only valid today.',
        'date': DateTime.now(), // Today
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Top Up E-wallet Successfully!',
        'message': 'You have top up your e-wallet.',
        'date': DateTime.now().subtract(const Duration(days: 1)), // Yesterday
      },
      {
        'icon': Icons.location_on_outlined,
        'title': 'New Service Available!',
        'message': 'Now you can track order in real-time.',
        'date': DateTime.now().subtract(const Duration(days: 1)), // Yesterday
      },
      {
        'icon': Icons.credit_card_outlined,
        'title': 'Credit Card Connected!',
        'message': 'Credit card has been linked.',
        'date': DateTime(2024, 6, 15), // Specific date
      },
      {
        'icon': Icons.account_circle_outlined,
        'title': 'Account Setup Successfully!',
        'message': 'Your account has been created.',
        'date': DateTime(2024, 6, 15), // Specific date
      },
    ];

    // Sort notifications by date in descending order
    notifications.sort(
        (a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime));

    // Group notifications by formatted date (e.g., Today, Yesterday)
    Map<String, List<Map<String, dynamic>>> groupedNotifications = {};

    for (var notification in notifications) {
      String formattedDate = formatDate(notification['date']);
      if (groupedNotifications[formattedDate] == null) {
        groupedNotifications[formattedDate] = [];
      }
      groupedNotifications[formattedDate]!.add(notification);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: groupedNotifications.keys.length,
        itemBuilder: (context, index) {
          String dateKey = groupedNotifications.keys.elementAt(index);
          List<Map<String, dynamic>> dateGroup = groupedNotifications[dateKey]!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateKey,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // List of notifications for that date
                ...List.generate(dateGroup.length, (i) {
                  final isLastItem = i == dateGroup.length - 1;
                  final notification = dateGroup[i];

                  return Column(
                    children: [
                      NotificationItem(
                        icon: notification['icon'],
                        titleNotify: notification['title'],
                        subTitleNotify: notification['message'],
                        date: '',
                      ),
                      if (!isLastItem)
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                    ],
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
