import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/common/product_item.dart';
import 'package:front_shop/utils/typography.dart';

class PopularProductItem extends StatefulWidget {
  const PopularProductItem({super.key});

  @override
  State<PopularProductItem> createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<PopularProductItem> {
  final List<Map<String, dynamic>> hotDeals = [
    {
      'imageUrl':
          'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp',
      'name': 'Bàn phím cơ',
      'price': '\$12.14',
      'discount' : '120.000',
      'isSaved': false,
    },
    {
      'imageUrl':
          'https://down-vn.img.susercontent.com/file/sg-11134201-23020-dbc2l9vh8wnve7_tn.webp',
      'name': 'Áo phông nam sdfsdkhfksd',
      'price': '\$10',
      'discount' : '99.000',
      'isSaved': false,
    },
    {
      'imageUrl':
          'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltdxwlwjh70k07_tn',
      'name': 'Đồng hồ nam',
      'price': '\$250',
      'discount' : '45.000',
      'isSaved': false,
    },
    {
      'imageUrl':
          'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp',
      'name': 'Portable Neck Fan',
      'price': '\$20.99',
      'discount' : '69.000',
      'isSaved': false,
    },
    {
      'imageUrl':
          'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx0m7vsacrtn0c_tn',
      'name': 'Áo ba lỗ',
      'price': '\$8',
      'discount' : '286.000',
      'isSaved': false,
    },
  ];

  void toggleSaved(int index) {
    setState(() {
      hotDeals[index]['isSaved'] = !hotDeals[index]['isSaved'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "View all",
              style: TypographyClass.Regular.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 250,
          child: GridView.builder(
            itemCount: hotDeals.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 8, // Spacing between rows
              childAspectRatio:
                  0.7, // Adjust for the item height to width ratio
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                imageUrl: hotDeals[index]['imageUrl']!,
                name: hotDeals[index]['name']!,
                price: hotDeals[index]['price']!,
                discount: hotDeals[index]['discount'],
                isSaved: hotDeals[index]['isSaved'],
                index: index,
                onPress: () {
                  toggleSaved(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
