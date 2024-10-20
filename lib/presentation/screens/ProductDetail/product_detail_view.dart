import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/texts/section_heading.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/bottom_add_to_cart.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/product_attributes.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/product_detail_image_slider.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/product_meta_data.dart';
import 'package:front_shop/presentation/screens/ProductDetail/widgets/rating_share_widget.dart';
import 'package:front_shop/presentation/screens/ProductReviews/product_reviews.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailView extends StatelessWidget {
  static const String routeName = "/product_detail";

  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1 product image slider
            TProductImageSlider(),

            ///2 product detail
            Padding(
              padding: EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// rating and share button
                  TRaitingAndShare(),

                  /// price, title, stock and brand
                  TProductMetaData(),

                  /// attributes
                  TProductAttributes(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: Text("Checkout")),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// reviews
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  TSectionHeading(title: 'Reviews(199)' , onPressed: (){
                    Navigator.pushNamed(context, ProductReviewsView.routeName);
                  }, showActionButton: true,),
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
