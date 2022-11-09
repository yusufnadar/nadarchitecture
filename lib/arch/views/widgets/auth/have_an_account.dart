const haveAnAccount = """
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../utils/helpers/text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;

  const HaveAnAccount(
      {Key? key, required this.title, required this.subtitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.02),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: title,
            ),
            TextSpan(
              text: subtitle,
              style: Styles.boldFontStyle(color: AppColors.main),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
    """;
