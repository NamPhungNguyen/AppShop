import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
final selectedPaymentMethodProvider = StateProvider<int?>((ref) => null);

class TBillingAmountSection extends ConsumerWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(selectedPaymentMethodProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment method", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(
                          AssetsPathUtil.payments('cash_on_delivery.png')),
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: AppSizes.spaceBtwItems / 2),
                    const Text("Cash on delivery"),
                  ],
                ),
                Radio<int>(
                  value: 1,
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    ref.read(selectedPaymentMethodProvider.notifier).state =
                        value;
                  },
                  activeColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

