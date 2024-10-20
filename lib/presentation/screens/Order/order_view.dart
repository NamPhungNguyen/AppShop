import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/Order/widgets/orders_list.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class OrderView extends StatelessWidget {
  static const String routeName = "/order_view";

  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
          title: Text('My Orders',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
