import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  final List<String> imgListBanner = [
    AssetsPathUtil.banner('banner1.png'),
    AssetsPathUtil.banner('banner2.png'),
    AssetsPathUtil.banner('banner3.png'),
    AssetsPathUtil.banner('banner4_1.png'),
    AssetsPathUtil.banner('banner5_1.png'),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselSlider(
            items: imgListBanner
                .map((e) => Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              height: 180,
              enlargeFactor: 0.3,
              aspectRatio: 2.0,
              onPageChanged: (value, _) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          ),
          buildCarouselIndicator(),
        ],
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgListBanner.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 8 : 6,
            width: i == _currentPage ? 8 : 6,
            decoration: BoxDecoration(
                color: i == _currentPage
                    ? AppColors.primaryColor
                    : AppColors.tertiaryText,
                shape: BoxShape.circle),
          ),
      ],
    );
  }
}
