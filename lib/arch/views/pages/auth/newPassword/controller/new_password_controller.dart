const newPasswordController =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final newPasswordAgainController = TextEditingController();

  final _newPasswordObscureText = true.obs;

  bool get newPasswordObscureText => _newPasswordObscureText.value;

  set newPasswordObscureText(bool obscureText) =>
      _newPasswordObscureText.value = obscureText;

  final _newPasswordAgainObscureText = true.obs;

  bool get newPasswordAgainObscureText => _newPasswordAgainObscureText.value;

  set newPasswordAgainObscureText(bool obscureText) =>
      _newPasswordAgainObscureText.value = obscureText;

  @override
  void dispose() {
    newPasswordController.dispose();
    newPasswordAgainController.dispose();
    super.dispose();
  }

  void changeObscureNewPassword() {
    newPasswordObscureText = !newPasswordObscureText;
    update();
  }

  void changeObscureNewPasswordAgain() {
    newPasswordAgainObscureText = !newPasswordAgainObscureText;
    update();
  }
}
    """;