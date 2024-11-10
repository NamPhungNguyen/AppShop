import 'package:flutter/material.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class TBillingAmountSection extends StatefulWidget {
  const TBillingAmountSection({super.key});

  @override
  State<TBillingAmountSection> createState() => _TBillingAmountSectionState();
}

class _TBillingAmountSectionState extends State<TBillingAmountSection> {
  int? _selectedMethod;

  @override
  Widget build(BuildContext context) {
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
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(AssetsPathUtil.payments('paypal.png')),
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: AppSizes.spaceBtwItems / 2),
                    const Text("Paypal"),
                  ],
                ),
                Radio<int>(
                  value: 2,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
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
