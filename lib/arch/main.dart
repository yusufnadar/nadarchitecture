const mainPage = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/app.dart';
import 'core/constants/routes.dart';
import 'core/constants/themes.dart';
import 'core/init/bindings/initial_bindings.dart';
import 'core/init/controller/my_app_controller.dart';
import 'core/init/main/init_main.dart';
import 'core/init/services/get_it_service.dart';
import 'core/init/services/route_service.dart';
import 'core/init/services/theme_service.dart';

void main() async {
  Get.put(MyAppController());
  GetItService.setupSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: App.appName,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        builder: InitMain.builder,
        initialBinding: InitialBindings(),
        getPages: GetItService.getIt.get<RouteService>().pages,
        initialRoute: Routes.splash,
        themeMode: GetItService.getIt.get<ThemeService>().getTheme(),
      ),
    );
  }
}
    """;
