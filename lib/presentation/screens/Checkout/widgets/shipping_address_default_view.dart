import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../main.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/gradient_line.dart';
import '../../Address/address_view.dart';

class ShippingAddressDefaultView extends ConsumerStatefulWidget {
  const ShippingAddressDefaultView({super.key});

  @override
  _ShippingAddressDefaultViewState createState() =>
      _ShippingAddressDefaultViewState();
}

class _ShippingAddressDefaultViewState
    extends ConsumerState<ShippingAddressDefaultView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final address = ref.read(shippingAddressDefaultStateProvider).value?.result;

      if (address == null || address.isEmpty) {
        _showAddAddressDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final shippingAddressDefault = ref.watch(shippingAddressDefaultStateProvider);

    return Material(
      color: Colors.transparent,
      child: shippingAddressDefault.when(
        data: (address) {
          // If address exists, display the address details
          if (address.result == null || address.result.isEmpty) {
            return Center(
              child: Text(
                "You don't have a shipping address yet. Please add one.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor),
                textAlign: TextAlign.center,
              ),
            );
          }

          final shippingAddress = address.result.first; // Assuming you want to display the first address
          return InkWell(
            onTap: () {
              // Navigate to AddressView when tapped
              Navigator.pushNamed(context, AddressView.routeName);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.location),
                    const SizedBox(width: AppSizes.spaceBtwItems / 6),
                    Text(
                      shippingAddress.fullName ?? "Unknown Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: AppSizes.md),
                    ),
                    const SizedBox(width: AppSizes.spaceBtwItems / 4),
                    Text(
                      "(+84)${shippingAddress.phoneNumber ?? "Unknown"}",
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
                const SizedBox(height: AppSizes.spaceBtwItems / 6),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceBtwItems / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shippingAddress.addressDetail ?? "Unknown Address",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.tertiaryText),
                      ),
                      Text(
                        "${shippingAddress.city ?? "Unknown City"}, ${shippingAddress.province ?? "Unknown Province"}, ${shippingAddress.country ?? "Unknown Country"}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.tertiaryText),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const GradientLine(),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          print('Error: $error');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Failed to load your shipping address.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Please try again later.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Method to show the dialog prompting the user to add an address
  void _showAddAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "No Shipping Address",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            "You don't have a shipping address yet. Would you like to add one?",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushNamed(context, AddressView.routeName); // Navigate to AddressView
              },
              child: Text("Add Address"),
            ),
          ],
        );
      },
    );
  }
}






