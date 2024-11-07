import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/cart_product.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../commom/widgets/products/cart/cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    required this.cartProducts,
    this.showAddRemoveButtons = true,
  });

  final List<CartProduct> cartProducts;
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwSections,
      ),
      itemCount: cartProducts.length,
      itemBuilder: (_, index) {
        final product = cartProducts[index];
        return Column(
          children: [
            /// cart items
            TCartItem(
              imageUrl: product.imageUrl,
              title: product.productName,
              color: product.color,
              size: product.size,
              quantity: product.quantity,
              onIncrement: () {},
              onDecrement: () {},
            ),
          ],
        );
      },
    );
  }
}
