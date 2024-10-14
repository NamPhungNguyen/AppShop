import 'dart:async';
import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/product_item.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class HotDeals extends StatefulWidget {
  static const String hot_deals = "/hot_deal";
  const HotDeals({super.key});

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  final List<Product> hotDeals = [
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

  Duration remainingTime = const Duration(hours: 22, minutes: 55, seconds: 20);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  void toggleSaved(int index) {
    setState(() {
      hotDeals[index].isSaved = !hotDeals[index].isSaved;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deal of the Day',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '⏳ ${remainingTime.inHours.toString().padLeft(2, '0')}h ${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}m ${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}s remaining',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {

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
          height: 250, // Chiều cao cho ListView cuộn ngang
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotDeals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 15, bottom: 16),
                child: ProductItem(
                  product: hotDeals[index],
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
