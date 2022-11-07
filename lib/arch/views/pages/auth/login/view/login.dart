const login =
    """
import '../../../../../utils/extensions/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../widgets/custom/custom_loading.dart';
import '../controller/login_controller.dart';
import '../../../../widgets/auth/have_an_account.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_input.dart';
import '../model/login_model.dart';

class Login extends GetWidget<LoginController> {
  Login({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(
          builder: (controller) => controller.loginLoading == true
              ? const CustomLoading()
              : SafeArea(
                  child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      // if we need spacer with scroll, should use Layout Builder
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          // min heights of page will be the all pages height
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: buildIntrinsicHeight(context),
                        ),
                      );
                    },
                  ),
                )),
    );
  }

  IntrinsicHeight buildIntrinsicHeight(context) {
    return IntrinsicHeight(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildLoginImage(),
            buildEmailInput(),
            buildPasswordInput(),
            buildForgotPassword(),
            buildLoginButton(),
            buildSpacer(),
            buildHaveAnAccount(),
          ],
        ).pagePadding(),
      ),
    );
  }

  buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.forgotPassword),
        child: const Text('Forgot Password?'),
      ),
    );
  }

  Spacer buildSpacer() => const Spacer();

  HaveAnAccount buildHaveAnAccount() => HaveAnAccount(
        title: "Don't you have an account?",
        subtitle: 'Register',
        onTap: () => Get.toNamed(Routes.register),
      );

  Container buildLoginButton() => Container(
        margin: EdgeInsets.symmetric(vertical: App.buttonMargin),
        child: CustomButton(
          text: 'Login',
          onTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              final loginModel = LoginModel(
                email: controller.emailController.text,
                password: controller.passwordController.text,
              );
              await controller.login(loginModel);
            }
          },
        ),
      );

  GetBuilder buildPasswordInput() => GetBuilder<LoginController>(
        builder: (_) => Container(
          margin: EdgeInsets.only(bottom: App.inputMargin),
          child: CustomInput(
            controller: controller.passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value.length < 4) {
                return "Password can't be less than 4 character";
              } else {
                return null;
              }
            },
            iconPressed: () => controller.changeObscureLoginPassword(),
            obscureText: controller.loginPasswordObscureText,
          ),
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

  SvgPicture buildLoginImage() => SvgPicture.asset(
        Images.login,
        height: Get.height * 0.4,
      );
}
    """;