const newPassword =
    """
import '../../../../../utils/extensions/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/routes.dart';
import '../controller/new_password_controller.dart';
import '../../../../../utils/helpers/text_styles.dart';
import '../../../../widgets/custom/custom_back_button.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_input.dart';

class NewPassword extends GetWidget<NewPasswordController> {
  NewPassword({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBackButton(),
              buildNewPasswordText(),
              buildNewPasswordInput(),
              buildNewPasswordAgainInput(),
              buildChangePasswordButton()
            ],
          ).pagePadding(),
        ),
      ),
    );
  }

  Container buildNewPasswordText() => Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.02),
        child: Text(
          'Please text your new password',
          style: Styles.semiboldFontStyle(fontSize: 17),
        ),
      );

  CustomButton buildChangePasswordButton() {
    return CustomButton(
      text: 'Change Password',
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Get.offAllNamed(Routes.login);
        }
      },
    );
  }

  GetBuilder buildNewPasswordAgainInput() {
    return GetBuilder<NewPasswordController>(
        builder: (_) => Container(
              margin: EdgeInsets.only(
                  top: App.inputMargin, bottom: App.buttonMargin),
              child: CustomInput(
                controller: controller.newPasswordAgainController,
                hintText: 'New Password Again',
                validator: (value) {
                  if (value.length < 4) {
                    return "Password can't be less than 4 character";
                  } else if (value != controller.newPasswordController.text) {
                    return 'Passwords should be the same';
                  }
                  return null;
                },
                iconPressed: () => controller.changeObscureNewPasswordAgain(),
                obscureText: controller.newPasswordAgainObscureText,
              ),
            ));
  }

  GetBuilder buildNewPasswordInput() {
    return GetBuilder<NewPasswordController>(
        builder: (_) => CustomInput(
              controller: controller.newPasswordController,
              hintText: 'New Password',
              validator: (value) {
                if (value.length < 4) {
                  return "Password can't be less than 4 character";
                } else if (value !=
                    controller.newPasswordAgainController.text) {
                  return 'Passwords should be the same';
                }
                return null;
              },
              iconPressed: () => controller.changeObscureNewPassword(),
              obscureText: controller.newPasswordObscureText,
            ));
  }

  CustomBackButton buildBackButton() => const CustomBackButton();
}
    """;