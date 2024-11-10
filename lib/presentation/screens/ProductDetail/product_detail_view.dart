import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/presentation/commom/widgets/texts/section_heading.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/bottom_add_to_cart.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/product_detail_image_slider.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/product_meta_data.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/rating_share_widget.dart';
import 'package:front_shop/presentation/screens/ProductReviews/product_reviews.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailView extends ConsumerWidget {
  static const String routeName = "/product_detail";

  final Product product;

  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1 product image slider
            TProductImageSlider(product: product),

            ///2 product detail
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// rating and share button
                  TRaitingAndShare(product: product),

                  /// price, title, stock and brand
                  TProductMetaData(product: product),

                  /// description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// reviews
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  TSectionHeading(
                    title: 'Reviews(199)',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ProductReviewsView.routeName);
                    },
                    showActionButton: true,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
