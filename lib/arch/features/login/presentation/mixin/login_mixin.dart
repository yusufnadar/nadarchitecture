const loginMixin = """
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import '../view/login_view.dart';
import '../view_model/login_view_model.dart';

mixin LoginMixin on State<LoginView> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late final LoginViewModel model;

  @override
  void initState() {
    super.initState();
    initialize();
    removeSplash();
  }

  void initialize() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    model = context.read<LoginViewModel>();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      await model.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void removeSplash() => widget.firstOpen == true ? FlutterNativeSplash.remove() : null;

  void goForgotPassword() {
    emailController.clear();
    passwordController.clear();
    //getIt<RouteService>().go(path: AppRoutes.forgotPassword);
  }
}
""";