import 'package:flutter/material.dart';
import '../../exports/constants_exports.dart';

class ThemeConstants {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.white,
      fontFamily: AppConstants.fontFamily
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.black,
    fontFamily: AppConstants.fontFamily
  );
}
