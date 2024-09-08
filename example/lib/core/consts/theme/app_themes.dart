import 'package:flutter/material.dart';

import '../app/app_constants.dart';
import '../color/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.white,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: AppConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.lightGray,
  );
}
