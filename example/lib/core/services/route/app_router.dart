import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/home/presentation/view/home_view.dart';
import '../../../features/login/presentation/view/login_view.dart';
import '../../../features/login/presentation/view_model/login_view_model.dart';
import '../../consts/local/app_locals.dart';
import '../../consts/route/app_routes.dart';
import '../get_it/get_it_service.dart';
import '../local/local_service.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final localService = getIt<LocalService>();
    switch (settings.name) {
      case AppRoutes.base:
        if (localService.read(AppLocals.accessToken) != null) {
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) => getIt<LoginViewModel>(),
              child: const LoginView(firstOpen: true),
            ),
            settings: const RouteSettings(name: AppRoutes.login),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const HomeView(),
            settings: const RouteSettings(name: AppRoutes.home),
          );
        }
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: const RouteSettings(name: AppRoutes.login),
        );
      case AppRoutes.test:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: const RouteSettings(name: AppRoutes.home),
        );
      default:
        return null;
    }
  }
}
