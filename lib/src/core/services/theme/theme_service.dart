import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart';
import '../local/local_service.dart';

// Uygulamanın tema değişiminin yapıldığı ve kaydedildiği kısım
class ThemeService {
  ThemeService._init();

  static final ThemeService _instance = ThemeService._init();

  static ThemeService get instance => _instance;

  final localService = LocalService.instance;

  bool isSavedDarkMode() => localService.read(LocalConstants.theme) ?? false;

  ThemeMode getTheme() =>
      isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;

  Future<void> changeTheme(value) async =>
      await localService.write(LocalConstants.theme, value);
}
