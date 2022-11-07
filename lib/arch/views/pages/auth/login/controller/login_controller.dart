const loginController =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/controllers/user_controller.dart';
import '../../../../../common/models/token_model.dart';
import '../../../../../core/constants/end_points.dart';
import '../../../../../core/constants/enums/http_type_enums.dart';
import '../../../../../core/constants/local_consts.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/init/services/get_it_service.dart';
import '../../../../../core/init/services/local_service.dart';
import '../../../../../core/init/services/network_service.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginPasswordObscureText = true.obs;

  bool get loginPasswordObscureText => _loginPasswordObscureText.value;

  set loginPasswordObscureText(bool obscureText) =>
      _loginPasswordObscureText.value = obscureText;

  final _networkService = GetItService.getIt.get<NetworkService>();
  final _localService = GetItService.getIt.get<LocalService>();

  final _loginLoading = false.obs;

  bool get loginLoading => _loginLoading.value;

  set loginLoading(bool loginLoading) => _loginLoading.value = loginLoading;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeObscureLoginPassword() {
    loginPasswordObscureText = !loginPasswordObscureText;
    update();
  }

  Future<void> login(LoginModel loginModel) async {
    loginLoading = true;
    TokenModel? token = await _networkService
        .setBody(loginModel.toJson())
        .setEndPoint(EndPoints.login)
        .fetch<TokenModel>(
          HttpTypes.post,
          token: TokenModel(),
        );
    if (token != null) {
      _localService.write(AppLocalConsts.accessToken, token.accessToken);
      _localService.write(AppLocalConsts.refreshToken, token.refreshToken);
      await Get.find<UserController>().getUserForAuth();
      await Get.offAllNamed(Routes.bottomNavigationBar);
    }
    loginLoading = false;
  }
}
    """;