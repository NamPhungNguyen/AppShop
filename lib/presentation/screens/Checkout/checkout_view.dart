import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_address_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/presentation/screens/Menu/Cart/widgets/cart_items.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import '../../commom/widgets/products/cart/coupon_widget.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = "/checkout";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// items in cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// coupon textField
              TCouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// -- billing section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  children: [
                    /// pricing
                    TBillingAmountSection(),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    /// divider
                    const Divider(),
                    const SizedBox(height: AppSizes.spaceBtwItems),

                    /// payment methods
                    TBillingPaymentSection(),
                    const SizedBox(height: AppSizes.spaceBtwItems),

                    ///address
                    TBillingAddressSection(),

                  ],
                ),
              )
            ],
          ),
        ),
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


