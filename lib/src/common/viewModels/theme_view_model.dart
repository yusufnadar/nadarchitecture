import 'package:flutter/material.dart';

import '../../core/services/theme/theme_service.dart';

// Uygulamanın temasını değiştirdiğimiz kısım
class ThemeViewModel extends ChangeNotifier {
  final themeService = ThemeService.instance;

  ThemeMode get themeMode => themeService.getTheme();

  set themeMode(ThemeMode themeMode) => this.themeMode = themeMode;

  void changeTheme() {
    themeService.changeTheme(!themeService.isSavedDarkMode());
    notifyListeners();
  }
}
 