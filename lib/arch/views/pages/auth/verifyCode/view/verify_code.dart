const verifyCode =
    """
import '../../../../../utils/extensions/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../utils/helpers/text_styles.dart';
import '../../../../widgets/custom/custom_back_button.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_input.dart';
import '../controller/verify_code_controller.dart';

class VerifyCode extends GetWidget<VerifyCodeController> {
  VerifyCode({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildBackButton(),
            buildVerifyCodeTitle(),
            buildVerifyCodeSubtitle(),
            buildVerifyCodeInput(),
            buildVerifyButton()
          ],
        ).pagePadding(),
      ),
    );
  }

  CustomBackButton buildBackButton() => const CustomBackButton();

  CustomButton buildVerifyButton() => CustomButton(
      text: 'Verify',
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Get.toNamed(Routes.newPassword);
        }
      });

  Container buildVerifyCodeInput() => Container(
        margin:
            EdgeInsets.only(top: Get.height * 0.04, bottom: App.buttonMargin),
        child: Form(
          key: formKey,
          child: CustomInput(
            controller: controller.codeController,
            hintText: 'Verify Code',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'This field can not be empty';
              }
              return null;
            },
          ),
        ),
      );

  Text buildVerifyCodeSubtitle() => Text(
        "We've sent a code to yusufnadaroglu@gmail.com",
        textAlign: TextAlign.center,
        style: Styles.regularFontStyle(fontSize: 16),
      );

  Container buildVerifyCodeTitle() => Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.01),
        child: Text(
          'Please check your email',
          style: Styles.boldFontStyle(fontSize: 20),
        ),
      );
}
    """;