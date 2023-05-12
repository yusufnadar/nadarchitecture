const showBar = """
import 'package:flutter/material.dart';

import '../exports/constants_exports.dart';
import '../services/navigation/navigation_service.dart';

mixin ShowBar {
  void showErrorBar(
    dynamic message, {
    Duration? duration,
    Color? backgroundColor,
    TextStyle? style,
    BuildContext? context,
  }) {
    ScaffoldMessenger.of(
            context ?? NavigationService.instance.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: style ??
              TextStyleConstants.regularStyle(
                color: ColorConstants.white,
              ),
        ),
        duration: duration ?? const Duration(seconds: 1),
        backgroundColor: backgroundColor ?? ColorConstants.red,
      ),
    );
  }

  void showSuccessBar(
    dynamic message, {
    Duration? duration,
    Color? backgroundColor,
    TextStyle? style,
    BuildContext? context,
  }) {
    ScaffoldMessenger.of(
            context ?? NavigationService.instance.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: style ??
              TextStyleConstants.regularStyle(
                color: ColorConstants.white,
              ),
        ),
        duration: duration ?? const Duration(seconds: 1),
        backgroundColor: backgroundColor ?? ColorConstants.green,
      ),
    );
  }
}

""";
