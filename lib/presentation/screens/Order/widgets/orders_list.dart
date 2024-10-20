import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBtwItems),
      itemBuilder:(_, index) => TRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(AppSizes.md),
        backgroundColor: AppColors.light,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// row 1
            Row(
              children: [
                ///1. Icon
                Icon(Iconsax.ship),
                SizedBox(width: AppSizes.spaceBtwItems / 2),
      
                /// 2 - status & date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.primaryColor, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                ///3. icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: AppSizes.iconSm))
              ],
            ),
      
            const SizedBox(height: AppSizes.spaceBtwItems),
      
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///1. Icon
                      Icon(Iconsax.tag),
                      SizedBox(width: AppSizes.spaceBtwItems / 2),
                  
                      /// 2 - status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium
                            ),
                            Text('[#12323]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
      
                Expanded(
                  child: Row(
                    children: [
                      ///1. Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: AppSizes.spaceBtwItems / 2),
                  
                      /// 2 - status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium
                            ),
                            Text('03 Feb 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
