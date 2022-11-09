import 'package:get/get.dart';
import '../../../views/pages/auth/register/binding/register_binding.dart';
import '../../../views/pages/auth/register/view/register.dart';
import '../../../views/pages/auth/splash/binding/splash_binding.dart';
import '../../../views/pages/auth/splash/view/splash.dart';
import '../../../views/pages/bottomBar/binding/bottom_navigation_bar_binding.dart';
import '../../../views/pages/bottomBar/view/bottom_bar.dart';
import '../../../views/pages/home/view/home_detail.dart';
import '../../../views/pages/home/view/home_page.dart';
import '../../../views/pages/profile/view/profile.dart';
import '../../constants/routes.dart';

class RouteService {
  final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => Register(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.bottomNavigationBar,
      page: () => const BottomNavigationBars(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const Profile(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => const HomeDetail(),
    ),
  ];
}
    