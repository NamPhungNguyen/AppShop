import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/Menu/Home/home_view.dart';

import '../../BottomBar/bottom_bar.dart';
import '../../Order/order_view.dart';

class OrderSuccessView extends ConsumerWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              "Your order has been placed successfully!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, OrderView.routeName);
                await ref.watch(cartStateProvider.notifier).fetchCartUser();
              },
              child: const Text('Go to Order'),
            ),
          ],
        ),
      ),
    );
  }
}
