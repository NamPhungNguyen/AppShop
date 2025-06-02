import 'package:front_shop/presentation/screens/Onboarding/onboarding_info.dart';
import 'package:front_shop/utils/assets_path_util.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Choose Product",
        description: "Welcome to My Shop, your go tot destination for trendy and affordable fashion.",
        image: AssetsPathUtil.onboarding("onboarding_img1.png"),
    ),
    OnboardingInfo(
      title: "Make Payment",
      description: "Choose from multiple payment methods, including credit card, Paypal, and more, to suit your convenience.",
      image: AssetsPathUtil.onboarding("onboarding_img2.png"),
    ),
    OnboardingInfo(
      title: "Get Your Order",
      description: "Get your items delivered on time, every time. Simple, safe, and convenience.",
      image: AssetsPathUtil.onboarding("onboarding_img3.png"),
    ),
  ];
}