const styles = """
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class Styles {
  static TextStyle thinFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w300,
        height: height ?? 1.24,
      );

  static TextStyle regularFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w400,
        height: height ?? 1.24,
      );

  static TextStyle mediumFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w500,
        height: height ?? 1.24,
      );

  static TextStyle semiboldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w600,
        height: height ?? 1.24,
      );

  static TextStyle boldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w700,
        height: height ?? 1.24,
      );
}
    """;
