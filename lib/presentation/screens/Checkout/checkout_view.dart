import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/shipping_address_default_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../commom/widgets/products/cart/coupon_widget.dart';
import '../Menu/Cart/widgets/cart_items.dart';

class CheckoutView extends ConsumerWidget {
  static const String routeName = "/checkout";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartStateProvider);

    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Order summary',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: cartState.when(
        data: (cartProducts) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const ShippingAddressDefaultView(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// items in cart
                  TCartItems(
                    cartProducts: cartProducts.result,
                    showAddRemoveButtons: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// coupon textField
                  const TCouponCode(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- billing section
                  const TRoundedContainer(
                    showBorder: true,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(AppSizes.md),
                    child: Column(
                      children: [
                        TBillingAmountSection(),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        /// divider
                        Divider(),
                        SizedBox(height: AppSizes.spaceBtwItems / 2),

                        /// payment methods
                        TBillingPaymentSection(),
                        SizedBox(height: AppSizes.spaceBtwItems),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(
            'Failed to load cart: $error',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, CheckoutView.routeName);
          },
          child: const Text('Place order'),
        ),
      ),
    );
  }
}
