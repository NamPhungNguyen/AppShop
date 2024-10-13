import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class Product {
  final String imageUrl;
  final String name;
  final String price;
  final String discount;
  bool isSaved;
  final int rating; // Rating out of 5
  final int totalRatings; // Total number of ratings

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discount,
    required this.isSaved,
    required this.rating,
    required this.totalRatings,
  });
}

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;

  const ProductItem({
    super.key,
    required this.product,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.network(
                  product.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: onPress,
                  child: Icon(
                    product.isSaved ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '₹${product.discount}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '40% Off',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ...List.generate(5, (i) {
                  return Icon(
                    i < product.rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 16,
                  );
                }),
                const SizedBox(width: 8),
                Text(
                  '${product.totalRatings}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
