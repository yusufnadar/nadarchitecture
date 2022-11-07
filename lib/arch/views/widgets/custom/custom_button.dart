const customButton =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../utils/helpers/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.065,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.main,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Styles.regularFontStyle(
            color: textColor ?? AppColors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
    """;