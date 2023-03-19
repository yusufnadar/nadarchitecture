import 'package:flutter/material.dart';
import '../../exports/constants_exports.dart';
import '../local/local_service.dart';

class ThemeService {
  ThemeService._init();

  static final ThemeService _instance = ThemeService._init();

  static ThemeService get instance => _instance;

  final localService = LocalService.instance;

  bool isSavedDarkMode() {
    return localService.read(LocalConstants.theme) ?? false;
  }

  ThemeMode getTheme() {
    return isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setTheme(value) async {
    await localService.write(LocalConstants.theme, value);
  }
}
