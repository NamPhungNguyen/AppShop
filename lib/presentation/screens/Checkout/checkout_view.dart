import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/screens/Address/address_view.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_address_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:front_shop/presentation/screens/Checkout/widgets/billing_payment_section.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/gradient_line.dart';
import '../../commom/widgets/products/cart/coupon_widget.dart';
import '../Menu/Cart/widgets/cart_items.dart';

class CheckoutView extends ConsumerWidget {
  static const String routeName = "/checkout";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingAddressDefault =
        ref.watch(shippingAddressDefaultStateProvider);

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(context, AddressView.routeName);

                        ///after returning, refresh the provider to fetch the latest address
                        ref.refresh(shippingAddressDefaultStateProvider);
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      splashColor: Colors.grey.withOpacity(0.2),
                      child: shippingAddressDefault.when(
                        data: (address) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Iconsax.location),
                                  const SizedBox(
                                      width: AppSizes.spaceBtwItems / 6),
                                  Text(
                                    address.result.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: AppSizes.md),
                                  ),
                                  const SizedBox(
                                      width: AppSizes.spaceBtwItems / 4),
                                  Text(
                                    "(+84)${address.result.phoneNumber}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: AppSizes.md),
                                  ),
                                  const SizedBox(width: AppSizes.spaceBtwItems),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: AppSizes.spaceBtwItems,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: AppSizes.spaceBtwItems / 6),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.spaceBtwItems / 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      address.result.addressDetail,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.tertiaryText),
                                    ),
                                    Text(
                                      "${address.result.city}, ${address.result.province}, ${address.result.country}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.tertiaryText),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: AppSizes.spaceBtwItems),
                              const GradientLine(),
                            ],
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stackTrace) => Text(
                          'Failed to load address: $error',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// items in cart
              //  TCartItems(showAddRemoveButtons: false, ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// coupon textField
              const TCouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// -- billing section
              TRoundedContainer(
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

                    /// address section
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
          child: const Text('Place order'),
        ),
      ),
    );
  }
}
