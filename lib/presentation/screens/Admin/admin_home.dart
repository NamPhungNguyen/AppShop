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
                'Welcome to the Admin Dashboard!',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Monthly Revenue for 2024',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      barGroups: _generateBarGroups(),
                      titlesData: _getTitlesData(),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      maxY: _calculateMaxY(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateMaxY() {
    final revenueData = [
      100000,
      1000000,
      10000000,
      50000000,
      100000000,
      500000000,
      1000000000,
    ];
    double maxRevenue = revenueData.reduce((a, b) => a > b ? a : b).toDouble();
    return maxRevenue * 1.2;
  }

  List<BarChartGroupData> _generateBarGroups() {
    // Test data for revenue
    final revenueData = [
      100000, // 100 thousand
      1000000, // 1 million
      10000000, // 10 million
      50000000, // 50 million
      100000000, // 100 million
      500000000, // 500 million
      1000000000, // 1 billion
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

  String _getFormattedValue(double value) {
    // Convert values to a readable format
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)} B'; // Billions
    } else if (value >= 100000000) {
      return '${(value / 100000000).toStringAsFixed(1)} M'; // Millions
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)} K'; // Thousands
    } else {
      return value.toStringAsFixed(0);
    }
  }

  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 70,
          getTitlesWidget: (value, meta) {
            return Text(
              _getFormattedValue(value),
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
            // 12 months display
            switch (value.toInt()) {
              case 0:
                return const Text('Jan');
              case 1:
                return const Text('Feb');
              case 2:
                return const Text('Mar');
              case 3:
                return const Text('Apr');
              case 4:
                return const Text('May');
              case 5:
                return const Text('Jun');
              case 6:
                return const Text('Jul');
              case 7:
                return const Text('Aug');
              case 8:
                return const Text('Sep');
              case 9:
                return const Text('Oct');
              case 10:
                return const Text('Nov');
              case 11:
                return const Text('Dec');
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
