import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Admin/menu/category_form.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import 'menu/add_product_page.dart';
import 'menu/manage_order.dart';

class AdminHome extends ConsumerWidget {
  static const String routeName = '/admin_home';

  const AdminHome({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await ref.read(loginStateProvider.notifier).logout();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginView.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Center(
                child: Text(
                  'Admin Panel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Add Product'),
              onTap: () {
                Navigator.pushNamed(context, AddProductPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Update Product'),
              onTap: () {
                Navigator.pushNamed(context, '/update_product');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete Product'),
              onTap: () {
                Navigator.pushNamed(context, '/delete_product');
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Manage Categories'),
              onTap: () {
                Navigator.pushNamed(context, CategoryFormScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Manage Users'),
              onTap: () {
                Navigator.pushNamed(context, '/manage_users');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Manage Orders'),
              onTap: () {
                Navigator.pushNamed(context, ManageOrderScreen.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await _logout(context, ref);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Admin Dashboard!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
