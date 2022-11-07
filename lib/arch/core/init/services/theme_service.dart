const themeService =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/local_consts.dart';
import 'get_it_service.dart';
import 'local_service.dart';

class ThemeService {
  final localService = GetItService.getIt.get<LocalService>();

  bool isSavedDarkMode() {
    return localService.read(AppLocalConsts.theme) ?? false;
  }

  ThemeMode getTheme() {
    return isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setTheme(value) async {
    await localService.write(AppLocalConsts.theme, value);
  }

  Future<void> changeTheme() async {
    Get.changeThemeMode(
        isSavedDarkMode() == false ? ThemeMode.dark : ThemeMode.light);
    await setTheme(!isSavedDarkMode());
  }
}
    """;