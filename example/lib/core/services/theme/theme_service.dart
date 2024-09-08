import 'package:flutter/material.dart';

import '../../consts/local/app_locals.dart';
import '../local/local_service.dart';

class ThemeService extends ChangeNotifier {
  ThemeService(this.localService);

  final LocalService localService;

  ThemeMode get themeMode => getTheme();

  set themeMode(ThemeMode themeMode) => this.themeMode = themeMode;

  ThemeMode getTheme() => isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;

  bool isSavedDarkMode() => localService.read(AppLocals.theme) ?? false;

  Future<void> changeTheme() async {
    await localService.write(AppLocals.theme, !isSavedDarkMode());
    notifyListeners();
  }
}
