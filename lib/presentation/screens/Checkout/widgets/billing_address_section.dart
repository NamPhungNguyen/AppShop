import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/texts/section_heading.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),

        Text('Nguyen Phung Nam', style: Theme.of(context).textTheme.bodyLarge),

        const SizedBox(height: AppSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('+081 387 438', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: Text("91, Luong Dinh Cua, Dong Da, Ha Noi",style: Theme.of(context).textTheme.bodyMedium, softWrap: true))
          ],
        )
      ],
    );
  }
}
