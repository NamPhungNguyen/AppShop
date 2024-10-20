import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../commom/widgets/products/cart/add_remove_button.dart';
import '../../../../commom/widgets/products/cart/cart_item.dart';
import '../../../../commom/widgets/texts/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// cart items
          TCartItem(),
          if (showAddRemoveButtons) SizedBox(height: AppSizes.spaceBtwItems),

          /// add remove button row with total price
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// extra space
                    SizedBox(width: 70),

                    /// add remove buttons
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                /// product total price
                ProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
