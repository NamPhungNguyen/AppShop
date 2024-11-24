import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/Order/widgets/orders_list.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../main.dart';

class OrderView extends ConsumerWidget {
  static const String routeName = "/order_view";

  const OrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderStateProvider);

    if (orderState.isLoading) {
      ref.read(orderStateProvider.notifier).fetchAllOrders();
    }

    return Scaffold(
      appBar: TAppbar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(orderStateProvider.notifier).fetchAllOrders();
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: orderState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (orders) {
              return TOrderListItems(
                orders: orders,
                onCancelOrder: (orderId) {
                  ref.read(orderStateProvider.notifier).cancelOrder(orderId);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
