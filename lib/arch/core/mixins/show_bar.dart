const showBar = """
import 'package:flutter/material.dart';
import '../exports/constants_exports.dart';

mixin ShowBar {
  void showErrorBar(context, message, {duration, backgroundColor, style}) {
    ScaffoldMessenger.of(context).showSnackBar(
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

  void showSuccessBar(context, message, {duration, backgroundColor, style}) {
    ScaffoldMessenger.of(context).showSnackBar(
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