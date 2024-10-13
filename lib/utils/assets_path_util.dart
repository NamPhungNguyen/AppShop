class AssetsPathUtil {
  static const basePath = "assets/images";

  static String onboarding(String name) {
    return "$basePath/onboarding/$name";
  }

  static String login(String name) {
    return "$basePath/login/$name";
  }

  static String dialog(String name) {
    return "$basePath/dialog/$name";
  }

  static String location(String name){
    return "$basePath/location/$name";
  }

  static String user(String name){
    return "$basePath/user/$name";
  }
}
