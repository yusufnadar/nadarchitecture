const customInput =
    """
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final String? Function(dynamic)? validator;
  final Function()? iconPressed;
  bool? obscureText;
  final TextInputType? keyboardType;

  CustomInput({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
    this.obscureText,
    this.iconPressed,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: const EdgeInsets.only(bottom: double.maxFinite),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: obscureText != null
            ? IconButton(
                onPressed: iconPressed,
                icon: Icon(Icons.remove_red_eye,
                    color: obscureText == false
                        ? AppColors.main
                        : AppColors.lightGrey),
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.main,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
    """;