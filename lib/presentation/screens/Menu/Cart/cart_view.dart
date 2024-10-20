import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/presentation/screens/Menu/Cart/widgets/cart_items.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class CartView extends StatelessWidget {
  static const String routeName = "/cart_view";

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child:
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, CheckoutView.routeName);
            }, child: Text('Checkout \$256.0')),
      ),
    );
  }
}
