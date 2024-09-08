import '../../../../core/helper/extension/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/widget/app_logo.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_input.dart';
import '../../../../core/consts/color/app_colors.dart';
import '../../../../core/consts/text_style/app_text_styles.dart';
import '../../../../core/helper/extension/color.dart';
import '../../../../core/helper/extension/context.dart';
import '../mixin/login_mixin.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  final bool? firstOpen;

  const LoginView({super.key, this.firstOpen});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildAppLogo(),
                  buildLoginText(),
                  buildLoginDescription(),
                  buildEmailInputTitle(),
                  buildEmailInput(),
                  buildPasswordInputTitle(),
                  buildPasswordInput(),
                  buildForgotPassword(),
                  buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildLoginButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: CustomButton(
        title: 'Giriş Yap',
        onTap: () {}, //login,
        backgroundColor: context.theme.blackOrWhite,
      ),
    );
  }

  Align buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 48.h),
        child: GestureDetector(
          onTap: goForgotPassword,
          child: Text(
            'Şifremi Unuttum',
            style: AppStyles.semiBold(fontSize: 12, color: AppColors.lightGray),
          ),
        ),
      ),
    );
  }

  Padding buildEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 24.h),
      child: CustomInput(
        hintText: 'E-mail adresinizi giriniz',
        controller: emailController,
        validator: (value)=>value?.emailValidator(),
      ),
    );
  }

  Padding buildPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 24.h),
      child: Consumer<LoginViewModel>(
        builder: (BuildContext context, model, Widget? child) {
          return CustomInput(
            hintText: 'Şifrenizi giriniz',
            controller: passwordController,
            suffixIcon: '',
            obscureText: model.obscure,
            suffixOnTap: model.changeObscure,
            validator: (value)=>value?.passwordValidator(),
          );
        },
      ),
    );
  }

  Align buildEmailInputTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('E-mail Adresi', style: AppStyles.regular(fontSize: 12)),
    );
  }

  Align buildPasswordInputTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Şifre', style: AppStyles.regular(fontSize: 12)),
    );
  }

  Padding buildLoginDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 72.h),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur.',
        style: AppStyles.regular(fontSize: 16, color: AppColors.lightGray),
      ),
    );
  }

  Text buildLoginText() {
    return Text('Giriş Yap', style: AppStyles.semiBold(fontSize: 40));
  }

  Padding buildAppLogo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.h),
      child: const AppLogo(),
    );
  }
}
