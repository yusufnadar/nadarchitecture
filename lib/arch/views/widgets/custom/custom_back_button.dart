const customBackButton = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.03),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back,
          size: Get.width * 0.09,
        ),
      ),
    );
  }
}
    """;
