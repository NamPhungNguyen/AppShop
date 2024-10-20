import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/ProductReviews/widgets/rating_progress_indicator.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import '../../commom/widgets/products/rating_indicator.dart';
import '../../commom/widgets/products/user_review_card.dart';

class ProductReviewsView extends StatelessWidget {
  static const String routeName = "/product_reviews";

  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: const Text("Reviews & Rating"),
        showBackArrow: true,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// overall product ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12.611', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// user reviews list
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}


