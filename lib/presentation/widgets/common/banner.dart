import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  final List<String> imgListBanner = [
    'https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?w=1060&t=st=1728137332~exp=1728137932~hmac=7d24adc7b07a99673b520017da97b0f65e96e5729544568ddbb8044be35b6423',
    'https://img.freepik.com/free-psd/modern-sales-banner-template_23-2148995448.jpg?w=1060&t=st=1728112185~exp=1728112785~hmac=919a6586420fd16ade22b3ef0329678a2268a4e540239412a6b196d8190b85fa',
    'https://img.freepik.com/free-psd/banner-template-design-online-shopping_23-2148537544.jpg?w=1060&t=st=1728137226~exp=1728137826~hmac=42eea9c6bdcb188c25f2befa9d23cab632ee48790cc27e9c0b6b266f18a3b0a4',
    'https://img.freepik.com/premium-vector/gradient-horizontal-banner-template-11-11-singles-day-sale_23-2150854310.jpg?w=1060',
    'https://img.freepik.com/free-vector/flat-11-11-shopping-day-sale-banner-template_23-2149724057.jpg?w=1060&t=st=1728112245~exp=1728112845~hmac=d8bfc2519fc96055e1853fe03318ea1df41ac7fba91fe02f39b75be533da629f',
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
                        child: Image.network(
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
