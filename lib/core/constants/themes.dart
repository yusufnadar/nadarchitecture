import 'package:flutter/material.dart';
import 'app.dart';
import 'colors.dart';

class Themes {
  static final darkTheme = ThemeData(
    primaryColor: AppColors.main,
    fontFamily: App.fontFamily,
  );

  static final lightTheme = ThemeData(
    primaryColor: AppColors.main,
    fontFamily: App.fontFamily,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.main),
  );
}
    