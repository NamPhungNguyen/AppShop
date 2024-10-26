import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding_item.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:front_shop/utils/preference_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  static const routeName = "/onboarding";

  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = OnboardingItems();
  final pageController = PageController(initialPage: 0);
  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
        lastPage = currentPage == (controller.items.length - 1);
      });
    });
  }

  Future<void> completeOnboarding() async {
    await PreferenceUtil.setIsFirstTime(false);
    Navigator.pushNamed(context, LoginView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text("${currentPage + 1}/3",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18)),
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
              child: Text(
                "Prev",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
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
                  ? completeOnboarding()
                  : pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    ),
              child: Text(
                lastPage ? "Get started" : "Next",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18, color: AppColors.primaryColor),
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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: AppSizes.lg,
                      ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  controller.items[index].description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.tertiaryText,
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
