import '../common.dart';

mixin LandingTabBarMixin {
  int currentIndexFromString(String currentTabBarName) {
    switch (currentTabBarName) {
      case LandingTab.home:
        return 0;
      case LandingTab.notification:
        return 1;
      case LandingTab.profile:
        return 2;
      default:
        return 0;
    }
  }
}
