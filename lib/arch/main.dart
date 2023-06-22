const mainPage = """
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'src/common/viewModels/language_view_model.dart';
import 'src/common/viewModels/theme_view_model.dart';
import 'src/core/exports/constants_exports.dart';
import 'src/core/services/language/languages/l10n.dart';
import 'src/core/services/navigation/navigation_route.dart';
import 'src/core/services/navigation/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: AppConstants.defaultProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: context.watch<ThemeViewModel>().themeMode,
        //builder: (context, child) => BuilderWidget(child: child),
        initialRoute: NavigationConstants.home,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
        supportedLocales: L10n.allLanguages,
        locale: context.watch<LanguageViewModel>().locale,
        localizationsDelegates: const [
          //.dart_tool dosyasının altında flutter_gen dosyası oluşturunca import ediyoruz 
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
""";
