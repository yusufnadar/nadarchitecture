import 'package:flutter/material.dart';

import '../../consts/color/app_colors.dart';
import '../../services/get_it/get_it_service.dart';
import '../../services/theme/theme_service.dart';

extension ColorScheme on ThemeData {
  static final theme = getIt<ThemeService>();

  Color get blackOrWhite =>
      theme.getTheme() == ThemeMode.light ? AppColors.black : AppColors.white;
}
