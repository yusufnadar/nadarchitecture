const registerController = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/controllers/user_controller.dart';
import '../../../../../common/models/token_model.dart';
import '../../../../../core/base/base_exception.dart';
import '../../../../../core/constants/end_points.dart';
import '../../../../../core/constants/enums/http_type_enums.dart';
import '../../../../../core/constants/local_consts.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/init/services/get_it_service.dart';
import '../../../../../core/init/services/local_service.dart';
import '../../../../../core/init/services/network_service.dart';
import '../model/register_model.dart';

class RegisterController extends GetxController with BaseException {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _registerPasswordObscureText = true.obs;

  bool get registerPasswordObscureText => _registerPasswordObscureText.value;

  set registerPasswordObscureText(bool obscureText) =>
      _registerPasswordObscureText.value = obscureText;

  final _registerLoading = false.obs;

  bool get registerLoading => _registerLoading.value;

  set registerLoading(bool registerLoading) =>
      _registerLoading.value = registerLoading;

  final _networkService = GetItService.getIt.get<NetworkService>();
  final _localService = GetItService.getIt.get<LocalService>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeObscureRegisterPassword() {
    registerPasswordObscureText = !registerPasswordObscureText;
    update();
  }

  Future<void> register(RegisterModel registerModel) async {
    try {
      registerLoading = true;
      TokenModel? tokenModel = await _networkService
          .setBody(registerModel.toJson())
          .setEndPoint(EndPoints.register)
          .fetch<TokenModel>(
            HttpTypes.post,
            model: TokenModel(),
          );
      if (tokenModel != null) {
        await _localService.write(
            AppLocalConsts.accessToken, tokenModel.accessToken);
        await _localService.write(
            AppLocalConsts.refreshToken, tokenModel.refreshToken);
        await Get.find<UserController>().getUserForAuth();
        registerLoading = false;
        await Get.offAllNamed(Routes.bottomNavigationBar);
      }
    } on Exception catch (error) {
      showExceptionError(error);
    } catch (error) {
      showError(error);
    } finally {
      registerLoading = false;
    }
  }
}
    """;
