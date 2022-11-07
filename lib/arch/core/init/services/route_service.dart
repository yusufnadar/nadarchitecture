const routeService =
    """
import 'package:get/get.dart';
import '../../../views/pages/auth/forgotPassword/view/forgot_password.dart';
import '../../../views/pages/auth/login/view/login.dart';
import '../../../views/pages/auth/newPassword/binding/new_password_binding.dart';
import '../../../views/pages/auth/newPassword/view/new_password.dart';
import '../../../views/pages/auth/register/view/register.dart';
import '../../../views/pages/auth/splash/view/splash.dart';
import '../../../views/pages/auth/verifyCode/view/verify_code.dart';
import '../../../views/pages/bottomBar/binding/bottom_navigation_bar_binding.dart';
import '../../../views/pages/bottomBar/view/bottom_bar.dart';
import '../../../views/pages/home/view/home_detail.dart';
import '../../../views/pages/home/view/home_page.dart';
import '../../../views/pages/profile/view/profile.dart';
import '../../../views/pages/profile/view/profile_detail.dart';
import '../../constants/routes.dart';
import '../../../views/pages/auth/forgotPassword/binding/forgot_password_binding.dart';
import '../../../views/pages/auth/login/binding/login_binding.dart';
import '../../../views/pages/auth/register/binding/register_binding.dart';
import '../../../views/pages/auth/splash/binding/splash_binding.dart';
import '../../../views/pages/auth/verifyCode/binding/verify_code_binding.dart';

class RouteService {
  final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => Register(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.bottomNavigationBar,
      page: () => const BottomNavigationBars(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => VerifyCode(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: Routes.newPassword,
      page: () => NewPassword(),
      binding: NewPasswordBinding(),
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
      page: () => const DetailPage(),
    ),
    GetPage(
      name: Routes.profileDetail,
      page: () => const ProfileDetail(),
    ),
  ];
}
    """;