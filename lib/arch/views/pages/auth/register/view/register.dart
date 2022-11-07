const register =
    """
import '../../../../../utils/extensions/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/routes.dart';
import '../controller/register_controller.dart';
import '../../../../widgets/auth/have_an_account.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_input.dart';
import '../model/register_model.dart';

class Register extends GetWidget<RegisterController> {
  Register({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<RegisterController>(
          builder: (controller) {
            if (controller.registerLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  // if we need spacer with scroll, should use Layout Builder
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      // min heights of page will be the all pages height
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: buildIntrinsicHeight(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  IntrinsicHeight buildIntrinsicHeight() {
    return IntrinsicHeight(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildRegisterImage(),
            buildEmailInput(),
            buildUserNameInput(),
            buildPasswordInput(),
            buildRegisterButton(),
            const Spacer(),
            buildHaveAnAccount(),
          ],
        ).pagePadding(),
      ),
    );
  }

  HaveAnAccount buildHaveAnAccount() => HaveAnAccount(
        title: 'Do you have an account? ',
        subtitle: 'Login',
        onTap: () => Get.toNamed(Routes.login),
      );

  Container buildRegisterButton() => Container(
        margin: EdgeInsets.symmetric(vertical: App.buttonMargin),
        child: CustomButton(
          text: 'Register',
          onTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              RegisterModel registerModel = RegisterModel(
                email: controller.emailController.text,
                name: controller.usernameController.text,
                password: controller.passwordController.text,
              );
              await controller.register(registerModel);
            }
          },
        ),
      );

  GetBuilder buildPasswordInput() => GetBuilder<RegisterController>(
        builder: (_) => CustomInput(
          controller: controller.passwordController,
          hintText: 'Password',
          validator: (value) {
            if (value.length < 4) {
              return "Password can't be less than 4 character";
            } else {
              return null;
            }
          },
          iconPressed: () => controller.changeObscureRegisterPassword(),
          obscureText: controller.registerPasswordObscureText,
        ),
      );

  Container buildEmailInput() => Container(
        margin: EdgeInsets.symmetric(vertical: App.inputMargin),
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
      );

  Container buildUserNameInput() => Container(
        margin: EdgeInsets.only(bottom: App.inputMargin),
        child: CustomInput(
          controller: controller.usernameController,
          hintText: 'User Name',
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return 'This field can not be empty';
            }
            return null;
          },
        ),
      );

  SvgPicture buildRegisterImage() => SvgPicture.asset(
        Images.register,
        height: Get.height * 0.4,
      );
}
    """;