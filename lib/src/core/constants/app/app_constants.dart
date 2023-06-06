import 'package:provider/provider.dart';
import '../../../common/viewModels/connection_view_model.dart';
import '../../../common/viewModels/theme_view_model.dart';

class AppConstants {
  static const appName = 'AppName';
  static const fontFamily = 'fontFamily';

  static final defaultProviders = [
    ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
    ),
    ChangeNotifierProvider<ConnectionViewModel>(
      create: (context) => ConnectionViewModel(),
    ),
  ];
}
