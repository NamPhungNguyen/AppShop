import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/presentation/commom/widgets/images/round_image.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

import '../../../../domain/models/product.dart';
import '../../../../main.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../commom/widgets/texts/product_price_text.dart';

class TBottomAddToCart extends ConsumerWidget {
  final Product product;

  const TBottomAddToCart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: const BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _showAddToCartOptions(context, ref);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: AppColors.primaryColor,
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        child: const Text("Add to Cart"),
      ),
    );
  }

  void _showAddToCartOptions(BuildContext context, WidgetRef ref) {
    final selectedColorNotifier = ValueNotifier<String?>(null);
    final selectedSizeNotifier = ValueNotifier<String?>(null);
    final quantityNotifier = ValueNotifier<int>(1);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final double discountPercentage = product.discount ?? 0.0;
        final double originalPrice = product.price;
        final double discountedPrice =
            originalPrice * (1 - discountPercentage / 100);
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems)
                  .copyWith(bottom: AppSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  TRoundedImage(
                    imageUrl: product.imgProduct[0],
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductPriceText(
                        price: (discountPercentage > 0
                                ? discountedPrice
                                : originalPrice)
                            .toStringAsFixed(2),
                        isLarge: true,
                      ),
                      Row(
                        children: [
                          Text(
                            '${originalPrice.toStringAsFixed(2)}₫',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.tertiaryText),
                          ),
                          const SizedBox(width: AppSizes.spaceBtwItems),
                          TRoundedContainer(
                            radius: AppSizes.sm,
                            backgroundColor: Colors.yellow.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.sm, vertical: AppSizes.xs),
                            child: Text(
                                '-${discountPercentage.toStringAsFixed(0)}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Colors',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.tertiaryText),
              ),
              Wrap(
                spacing: 8.0,
                children: product.color.map((colorOption) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: selectedColorNotifier,
                    builder: (context, selectedColor, child) {
                      return GestureDetector(
                        onTap: () {
                          selectedColorNotifier.value = colorOption;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedColor == colorOption
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            colorOption,
                            style: TextStyle(fontSize: AppSizes.spaceBtwItems),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                'Select Size',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.tertiaryText),
              ),
              Wrap(
                spacing: 8.0,
                children: product.size.map((sizeOption) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: selectedSizeNotifier,
                    builder: (context, selectedSize, child) {
                      return GestureDetector(
                        onTap: () {
                          selectedSizeNotifier.value = sizeOption;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedSize == sizeOption
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            sizeOption,
                            style: TextStyle(fontSize: AppSizes.spaceBtwItems),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.tertiaryText),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: quantityNotifier,
                    builder: (context, quantity, child) {
                      return Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (quantity > 1) {
                                quantityNotifier.value--;
                              }
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '$quantity',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              quantityNotifier.value++;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedColor = selectedColorNotifier.value;
                    final selectedSize = selectedSizeNotifier.value;
                    final quantity = quantityNotifier.value;

                    if (selectedColor != null && selectedSize != null) {
                      await ref
                          .read(cartStateProvider.notifier)
                          .addProductToCart(product.productId, quantity,
                              selectedColor, selectedSize);
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: 'Product added to cart!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please select a color and size.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(AppSizes.md),
                    backgroundColor: AppColors.primaryColor,
                    side: const BorderSide(color: AppColors.primaryColor),
                  ),
                  child: const Text("Add now"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
