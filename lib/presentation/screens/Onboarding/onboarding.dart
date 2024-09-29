import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in.dart';
import 'package:front_shop/presentation/screens/Onboarding/Onboarding_item.dart';
import 'package:front_shop/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  static const onboarding = "/onboarding";

  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = OnboardingItems();
  final pageController =
      PageController(initialPage: 0); // Ensure initialPage is set
  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage =
            pageController.page!.round(); // Track the current page index
        lastPage = currentPage == (controller.items.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text(
            "${currentPage + 1}/3",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () =>
                  pageController.jumpToPage(controller.items.length - 1),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous button
            TextButton(
              onPressed: () => pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              child: const Text(
                "Prev",
                style: TextStyle(color: AppColors.secondaryText, fontSize: 18),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(
                index,
                duration: const Duration(
                  milliseconds: 400,
                ),
                curve: Curves.easeIn,
              ),
              effect: const ExpandingDotsEffect(
                dotColor: Color(0xFFC4C4C4),
                activeDotColor: Color(0xFF17223B),
                dotHeight: 10,
              ),
            ),
            // Next button
            TextButton(
              onPressed: () => lastPage
                  ? Navigator.pushNamed(context, LoginView.log_in_view)
                  : pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    ),
              child: Text(
                lastPage ? "Get started" : "Next",
                style: const TextStyle(
                    color: AppColors.primaryTextAndButton, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.items[index].image),
                Text(
                  controller.items[index].title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.items[index].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
