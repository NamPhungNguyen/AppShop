import 'package:flutter/material.dart';
import '../../Notification/notification_view.dart';

class AccountView extends StatelessWidget {
  static const String account = "/account";

  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.notification);
            },
            icon: Icon(
              Icons.notifications_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildMenuItem(context,
              icon: Icons.person_outline, text: "Your Profile", onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          _buildMenuItem(context,
              icon: Icons.shopping_bag_outlined,
              text: "My Order",
              onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          _buildMenuItem(context,
              icon: Icons.credit_card_outlined,
              text: "Payment Methods",
              onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          _buildMenuItem(context,
              icon: Icons.notifications_outlined,
              text: "Notifications",
              onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          _buildMenuItem(context,
              icon: Icons.privacy_tip_outlined,
              text: "Privacy Policy",
              onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          _buildMenuItem(context,
              icon: Icons.help_outline, text: "Help Center", onTap: () {}),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}
