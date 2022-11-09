const getBars = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';

class GetBars {
  static errorSnackBar(title, message) => Get.snackbar(
        title,
        message,
        backgroundColor: AppColors.red,
        colorText: AppColors.black,
        duration: const Duration(milliseconds: 10500),
        dismissDirection: DismissDirection.horizontal,
      );

  static successSnackBar(title, message) => Get.snackbar(
        title,
        message,
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
        duration: const Duration(milliseconds: 1500),
        dismissDirection: DismissDirection.horizontal,
      );

  static warningSnackBar(title, message) => Get.snackbar(
        title,
        message,
        backgroundColor: AppColors.yellow,
        colorText: AppColors.black,
        duration: const Duration(milliseconds: 1500),
        dismissDirection: DismissDirection.horizontal,
      );
}
    """;
