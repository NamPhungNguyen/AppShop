import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/common/product_item.dart';
import 'package:front_shop/utils/app_colors.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({super.key});

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hot Deals',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotDeals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 15, bottom: 16),
                child: ProductItem(
                  imageUrl: hotDeals[index]['imageUrl']!,
                  name: hotDeals[index]['name']!,
                  price: hotDeals[index]['price']!,
                  discount: hotDeals[index]['discount'],
                  isSaved: hotDeals[index]['isSaved'],
                  index: index,
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
