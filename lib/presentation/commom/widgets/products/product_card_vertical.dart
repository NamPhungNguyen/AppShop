import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../styles/shadows.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/circular_icon.dart';
import '../images/round_image.dart';
import '../texts/product_title_text.dart';

class ProductCardVertical extends ConsumerStatefulWidget {
  final Product product;

  const ProductCardVertical({super.key, required this.product});

  @override
  ConsumerState<ProductCardVertical> createState() =>
      _ProductCardVerticalState();
}

class _ProductCardVerticalState extends ConsumerState<ProductCardVertical> {
  late bool isFavorite;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();

    final favoriteState = ref.read(favoriteStateProvider);
    isFavorite = favoriteState.maybeWhen(
      data: (favorites) => favorites.any(
          (favProduct) => favProduct.productId == widget.product.productId),
      orElse: () => false,
    );
  }

  Future<void> _toggleFavorite() async {
    if (isProcessing || !widget.product.available || widget.product.stock <= 1)
      return; // Không cho phép khi sản phẩm hết hàng

    setState(() {
      isProcessing = true;
      isFavorite = !isFavorite; // Thay đổi trạng thái ngay lập tức
    });

    try {
      final favoriteNotifier = ref.read(favoriteStateProvider.notifier);

      if (isFavorite) {
        await favoriteNotifier.addProductToFavorites(widget.product);
      } else {
        await favoriteNotifier
            .removeProductFromFavorites(widget.product.productId.toString());
      }

      await ref.read(favoriteStateProvider.notifier).fetchFavoriteProducts();
    } catch (e) {
      if (mounted) {
        setState(() {
          isFavorite = !isFavorite;
        });
      }
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailView.routeName,
          arguments: widget.product,
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: AppColors.light,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TRoundedImage(
                      imageUrl: widget.product.imgProduct.isNotEmpty
                          ? widget.product.imgProduct[0]
                          : AssetsPathUtil.categories("placeholder.png"),
                      fit: BoxFit.cover,
                      applyImageRadius: true,
                    ),
                  ),
                  if (widget.product.discount != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: TRoundedContainer(
                        radius: AppSizes.sm,
                        backgroundColor:
                            AppColors.textSecondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.sm, vertical: AppSizes.xs),
                        child: Text(
                          '-${widget.product.discount}%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black),
                        ),
                      ),
                    ),

                  /// Favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: isFavorite ? Iconsax.heart5 : Iconsax.heart,
                      color: isFavorite ? Colors.red : Colors.grey,
                      onPressed: isProcessing
                          ? null
                          : _toggleFavorite, // Không cho phép nhấn khi hết hàng
                    ),
                  ),

                  // Nếu sản phẩm không còn hàng, hiển thị thông báo "Hết hàng"
                  if (!widget.product.available || widget.product.stock <= 1)
                    Positioned(
                      bottom: 10,
                      left: 8,
                      child: TRoundedContainer(
                        radius: AppSizes.sm,
                        backgroundColor: Colors.red.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.sm, vertical: AppSizes.xs),
                        child: Text(
                          'Hết hàng',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                      title: widget.product.name, smallLines: true),
                  Row(
                    children: [
                      Text(
                        widget.product.brand,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: Colors.blue,
                        size: AppSizes.iconXs,
                      ),
                    ],
                  ),

                  /// rating star number
                  Row(
                    children: [
                      if (widget.product.rating != 0)
                        const Icon(Icons.star,
                            color: Colors.amber, size: AppSizes.iconSm),
                      const SizedBox(width: 4),
                      if (widget.product.rating != 0)
                        Text(
                          widget.product.rating.toStringAsFixed(1),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontSize: 12),
                        ),
                    ],
                  ),

                  ///
                  Row(
                    children: [
                      Text(
                        "${widget.product.discount != null ? (widget.product.price - (widget.product.price * (widget.product.discount! / 100))).toStringAsFixed(2) : widget.product.price.toStringAsFixed(2)}đ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      if (widget.product.discount != null)
                        Text(
                          "${widget.product.price.toStringAsFixed(2)}đ",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
