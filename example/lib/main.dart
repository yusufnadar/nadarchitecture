import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/consts/app/app_constants.dart';
import 'core/consts/theme/app_themes.dart';
import 'core/helper/init/helper_init.dart';
import 'core/services/get_it/get_it_service.dart';
import 'core/services/route/app_router.dart';
import 'core/services/route/route_service.dart';
import 'core/services/theme/theme_service.dart';

Future<void> main() async {
  await HelperInit.init();
  HelperInit.startApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 882),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        themeMode: context.watch<ThemeService>().themeMode,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        navigatorKey: getIt<RouteService>().navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
