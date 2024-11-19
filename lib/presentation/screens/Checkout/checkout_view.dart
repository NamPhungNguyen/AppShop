import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/shipping_address_default_view.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/success_order_view.dart';
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

    final discountAmount = couponState.when(
      data: (coupons) {
        // Assuming you want to get the discountAmount from the first coupon or an applied coupon
        // You need to have a way to fetch the correct coupon
        // If you're using `applyCoupon`, discountAmount should already be updated in CouponState
        return ref.watch(couponStateProvider.notifier).discountAmount;
      },
      loading: () => 0.0,
      error: (error, stackTrace) => 0.0,
    );  // Get discount amount from CouponState

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
          double totalAfterDiscount = cartCheckoutProducts.totalCheckoutPrice - discountAmount;
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
                          discountAmount: discountAmount,
                          totalAfterDiscount: totalAfterDiscount,// Pass updated discount amount here
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
          onPressed: () async {
            // Access the selected coupon code
            final selectedCouponCode = ref.read(selectedCouponCodeProvider);
            print("couponCode: $selectedCouponCode");

            // Access the addressId
            final addressId = addressState.value?.result.addressId;
            print('addressId: $addressId');

            if (addressId != null) {
              try {
                if (selectedCouponCode != null && selectedCouponCode.isNotEmpty) {
                  // Coupon code is provided, proceed with the order creation
                  print('Selected coupon code: $selectedCouponCode');
                  await ref.read(orderUsecaseProvider).createOrder(
                    null, // Pass the cart ID or other required data
                    selectedCouponCode, // Apply the coupon code if available
                    addressId,
                  );
                } else {
                  // Handle case when no coupon code is selected
                  print('No coupon code selected');
                  await ref.read(orderUsecaseProvider).createOrder(
                    null, // Pass the cart ID or other required data
                    null, // No coupon code applied
                    addressId,
                  );
                }

                // Navigate to the success screen after placing the order
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderSuccessView()),
                );
              } catch (e) {
                // Show an error message if order creation fails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to place order: $e')),
                );
              }
            } else {
              // Show error if no address is selected
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select an address!')),
              );
            }
          },
          child: const Text('Place order'),
        ),
      ),


    );
  }
}

