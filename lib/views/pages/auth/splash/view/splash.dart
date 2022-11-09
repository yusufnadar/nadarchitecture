import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../controller/splash_controller.dart';
import '../../../../../utils/helpers/text_styles.dart';

class Splash extends GetWidget<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.main,
        alignment: Alignment.center,
        child: buildAppName(size),
      ),
    );
  }

  Padding buildAppName(size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.15),
      child: Text(
        'NADARCHITECTURE',
        style: Styles.boldFontStyle(
          fontSize: 24,
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
    