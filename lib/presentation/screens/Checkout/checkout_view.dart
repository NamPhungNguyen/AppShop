import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/shipping_address_default_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../domain/domain_modules.dart';
import '../../commom/widgets/products/cart/coupon_widget.dart';
import '../Menu/Cart/widgets/cart_items.dart';

class CheckoutView extends ConsumerWidget {
  static const String routeName = "/checkout";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutState = ref.watch(checkoutStateProvider);
    final addressState = ref.watch(shippingAddressDefaultStateProvider);
    final couponState = ref.watch(couponStateProvider);
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Order summary',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: checkoutState.when(
        data: (cartCheckoutProducts) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const ShippingAddressDefaultView(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// items in cart
                  TCartItems(
                    cartProducts: cartCheckoutProducts.selectedItems,
                    showAddRemoveButtons: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// coupon textField
                  const TCouponCode(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- billing section
                  TRoundedContainer(
                    showBorder: true,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: Column(
                      children: [
                        const TBillingAmountSection(),
                        const SizedBox(height: AppSizes.spaceBtwItems),

                        /// divider
                        const Divider(),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),

                        /// payment methods
                        TBillingPaymentSection(
                          cartCheckoutProducts: cartCheckoutProducts,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
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
            final addressId = addressState.value?.result.addressId;
            print('addressId, $addressId');
            ref.watch(couponStateProvider).when(
              data: (coupons) {
                if (addressId != null && coupons.isNotEmpty) {
                  final couponCode = coupons.first.code;
                  print(couponCode);
                  ref
                      .read(orderUsecaseProvider)
                      .createOrder(null, couponCode, addressId);
                }
              },
              loading: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Loading coupons...')),
                );
              },
              error: (error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error loading coupons: $error')),
                );
              },
            );
          },
          child: const Text('Place order'),
        ),
      ),
    );
  }
}
