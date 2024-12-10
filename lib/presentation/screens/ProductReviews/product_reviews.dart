import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/AddComment/add_comment_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../domain/models/product.dart';
import '../../commom/widgets/products/user_review_card.dart';

class ProductReviewsView extends ConsumerWidget {
  static const String routeName = "/product_reviews";

  const ProductReviewsView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentState =
        ref.watch(commentStateProvider(product.productId.toString()));

    return Scaffold(
      appBar: TAppbar(
        title: const Text("Reviews & Rating"),
        showBackArrow: true,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(commentStateProvider(product.productId.toString()));
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          children: [
            const SizedBox(height: AppSizes.spaceBtwSections),
            AddCommentSection(
              productId: product.productId.toString(),
              onCommentAdded: () {
                // Invalidate the comment state provider to trigger a refresh
                ref.invalidate(commentStateProvider(product.productId.toString()));
              },
            ),
            commentState.when(
              data: (comments) {
                return Column(
                  children: comments.result.map((comment) {
                    return UserReviewCard(comment: comment);
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),

    );
  }
}
