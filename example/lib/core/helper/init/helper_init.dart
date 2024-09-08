import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../services/get_it/get_it_service.dart';
import '../../services/local/local_service.dart';
import '../../services/theme/theme_service.dart';

class HelperInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    await getIt<LocalService>().init();
  }

  static void startApp() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeService>(
            create: (context) => getIt<ThemeService>(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}
