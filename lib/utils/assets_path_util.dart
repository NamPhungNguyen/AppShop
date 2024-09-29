class AssetsPathUtil {
  static const basePath = "assets/images";

  static String onboarding(String name){
    return "$basePath/onboarding/$name";
  }

  static String login(String name){
    return "$basePath/login/$name";
  }
}