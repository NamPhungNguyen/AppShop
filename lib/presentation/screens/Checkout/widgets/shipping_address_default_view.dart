import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../main.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/gradient_line.dart';
import '../../Address/address_view.dart';

class ShippingAddressDefaultView extends ConsumerWidget {
  const ShippingAddressDefaultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingAddressDefault = ref.watch(shippingAddressDefaultStateProvider);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await Navigator.pushNamed(context, AddressView.routeName);

          /// After returning, refresh the provider to fetch the latest address
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
                    const SizedBox(width: AppSizes.spaceBtwItems / 6),
                    Text(
                      address.result.fullName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: AppSizes.md),
                    ),
                    const SizedBox(width: AppSizes.spaceBtwItems / 4),
                    Text(
                      "(+84)${address.result.phoneNumber}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: AppSizes.md),
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
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.result.addressDetail,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.tertiaryText),
                      ),
                      Text(
                        "${address.result.city}, ${address.result.province}, ${address.result.country}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.tertiaryText),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
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
    );
  }
}