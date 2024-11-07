import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_address_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../commom/widgets/products/cart/coupon_widget.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = "/checkout";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Order summary',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.location))
                    ],
                  )
                ],
              ),
              /// items in cart
              // TCartItems(showAddRemoveButtons: false),
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
                    /// pricing
                    TBillingAmountSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    /// divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    /// payment methods
                    TBillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    ///address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, CheckoutView.routeName);
          },
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
