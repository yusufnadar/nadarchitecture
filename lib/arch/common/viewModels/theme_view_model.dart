const themeViewModel = """
import 'package:flutter/material.dart';
import '../../core/services/theme/theme_service.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode get themeMode => themeService.getTheme();

  set themeMode(ThemeMode themeMode) => this.themeMode = themeMode;

  final themeService = ThemeService.instance;

  void changeTheme() {
    themeService.setTheme(!themeService.isSavedDarkMode());
    notifyListeners();
  }
}
 """;
