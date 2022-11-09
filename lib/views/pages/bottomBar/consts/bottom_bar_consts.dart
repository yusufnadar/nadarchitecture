import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/routes.dart';
import '../../home/view/home_detail.dart';
import '../../home/view/home_page.dart';
import '../../profile/view/profile.dart';
import '../enums/bottom_bar_enums.dart';

class BottomBarConsts {
  static const List<Map<BottomBar, String>> bottomBarLabels = [
    {BottomBar.homePage: 'Home Page'},
    {BottomBar.profile: 'Profile'},
  ];

  static const List<IconData> bottomBarIcons = [
    Icons.home,
    Icons.add,
  ];

  static List<BottomNavigationBarItem> bottomBarItemList = [];

  static const navigatorIdHomePage = 0;
  static const navigatorIdProfile = 1;

  static int currentKey = navigatorIdHomePage;

  static var allNavigators = <Navigator>[
    Navigator(
      key: Get.nestedKey(navigatorIdHomePage),
      initialRoute: Routes.homePage,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == Routes.homePage) {
          return GetPageRoute(
            routeName: Routes.homePage,
            page: () => const HomePage(),
            transition: Transition.rightToLeftWithFade,
          );
        } else if (routeSettings.name == Routes.detail) {
          return GetPageRoute(
            routeName: Routes.detail,
            page: () => const HomeDetail(),
            transition: Transition.rightToLeftWithFade,
          );
        }
        return null;
      },
    ),
    Navigator(
      key: Get.nestedKey(BottomBarConsts.navigatorIdProfile),
      initialRoute: Routes.profile,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == Routes.profile) {
          return GetPageRoute(
            routeName: Routes.profile,
            page: () => const Profile(),
            transition: Transition.rightToLeftWithFade,
            //binding: ProfileBinding()
          );
        }
      },
    ),
  ];
}
    