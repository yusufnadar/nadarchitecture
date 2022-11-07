const verifyCodeController =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  final codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
}
    """;