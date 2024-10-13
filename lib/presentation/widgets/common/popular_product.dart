import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/common/product_item.dart';
import '../../../utils/constants/app_colors.dart';

class PopularProductItem extends StatefulWidget {
  const PopularProductItem({super.key});

  @override
  State<PopularProductItem> createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<PopularProductItem> {
  final List<Product> productTrendings = [
    Product(
      imageUrl:
          'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp',
      name: 'Women Printed Kurta',
      price: '\$12.14',
      discount: '120.000',
      isSaved: false,
      rating: 4,
      totalRatings: 56890,
    ),
    Product(
      imageUrl:
          'https://down-vn.img.susercontent.com/file/sg-11134201-23020-dbc2l9vh8wnve7_tn.webp',
      name: 'HRX by Hrithik Roshan',
      price: '\$10',
      discount: '99.000',
      isSaved: false,
      rating: 1,
      totalRatings: 32000,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void toggleSaved(int index) {
    setState(() {
      productTrendings[index].isSaved = !productTrendings[index].isSaved;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending Products',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Action for "View all"
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'View all →',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productTrendings.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 15, bottom: 16),
                child: ProductItem(
                  product: productTrendings[index],
                  onPress: () {
                    toggleSaved(index);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
