const forgotPassword =
    """
import '../../../../../utils/extensions/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/routes.dart';
import '../controller/forgot_password_controller.dart';
import '../../../../../utils/helpers/text_styles.dart';
import '../../../../widgets/custom/custom_back_button.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_input.dart';

class ForgotPassword extends GetWidget<ForgotPasswordController> {
  ForgotPassword({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildBackButton(),
              buildForgotPasswordImage(),
              buildForgotPasswordTitle(),
              buildEmailInput(),
              buildSendButton(),
            ],
          ).pagePadding(),
        ),
      ),
    );
  }

  CustomBackButton buildBackButton() => const CustomBackButton();

  Container buildSendButton() => Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.01),
        child: CustomButton(
          text: 'Send',
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Get.toNamed(Routes.verifyCode);
            }
          },
        ),
      );

  Container buildEmailInput() => Container(
        margin: EdgeInsets.symmetric(
          vertical: App.buttonMargin,
        ),
        child: Form(
          key: formKey,
          child: CustomInput(
            controller: controller.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!GetUtils.isEmail(value)) {
                return 'This is not valid email';
              } else {
                return null;
              }
            },
          ),
        ),
      );

  Container buildForgotPasswordTitle() => Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
        child: Text(
          "Don't worry! Just text the email address and we will send you a code to change your password.",
          textAlign: TextAlign.center,
          style: Styles.regularFontStyle(fontSize: 16),
        ),
      );

  Container buildForgotPasswordImage() => Container(
        margin: EdgeInsets.only(
          bottom: Get.height * 0.03,
        ),
        child: SvgPicture.asset(
          Images.forgotPassword,
          height: Get.height * 0.35,
        ),
      );
}
    """;