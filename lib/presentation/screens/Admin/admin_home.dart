import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Admin/menu/category_form.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import 'menu/add_product_page.dart';
import 'menu/manage_coupon.dart';
import 'menu/manage_order.dart';
import 'menu/manage_product_screen.dart';
import 'menu/manage_user_screen.dart';

class AdminHome extends ConsumerWidget {
  static const String routeName = '/admin_home';

  const AdminHome({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await ref.read(loginStateProvider.notifier).logout();
    Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
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
              leading: const Icon(Icons.view_list),
              title: const Text('Manage Products'),
              onTap: () {
                Navigator.pushNamed(context, ProductManagementPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer),
              title: const Text('Manage Coupon'),
              onTap: () {
                Navigator.pushNamed(context, ManageCouponScreen.routeName);
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
                Navigator.pushNamed(context, ManageUsersScreen.routeName);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Monthly Revenue for 2024',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: BarChart(
                  BarChartData(
                    barGroups: _generateBarGroups(),
                    titlesData: _getTitlesData(),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    maxY: 120000000, // Maximum Y-axis value
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    // Doanh thu dữ liệu cho 12 tháng (đơn vị VNĐ)
    final revenueData = [
      20000000, 50000000, 40000000, 60000000, 70000000, 30000000,
      80000000, 90000000, 100000000, 40000000, 30000000, 60000000,
    ];

    return List.generate(revenueData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: revenueData[index].toDouble(),
            color: Colors.blueAccent,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }

  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 60,
          getTitlesWidget: (value, meta) {
            // Hiển thị tiền tệ dạng VNĐ
            return Text(
              '${(value / 1000000).toStringAsFixed(0)} triệu đ',
              style: const TextStyle(fontSize: 12),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            const months = [
              'T1', 'T2', 'T3', 'T4', 'T5', 'T6',
              'T7', 'T8', 'T9', 'T10', 'T11', 'T12'
            ];
            return Text(
              months[value.toInt()],
              style: const TextStyle(fontSize: 12),
            );
          },
        ),
      ),
    );
  }
}
