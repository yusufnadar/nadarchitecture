import 'package:flutter/material.dart';

import '../../../../core/consts/local/app_locals.dart';
import '../../../../core/consts/route/app_routes.dart';
import '../../../../core/services/local/local_service.dart';
import '../../../../core/services/route/route_service.dart';
import '../../data/models/login_request/login_request_model.dart';
import '../../domain/repositories/login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._localService, this._routeService, this._loginRepository);

  final LocalService _localService;
  final RouteService _routeService;
  final LoginRepository _loginRepository;

  bool obscure = true;
  bool isLoading = false;

  void changeObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    if (isLoading == true) return;
    changeLoading(true);
    final loginRequestModel = LoginRequestModel(email: email, password: password);
    final result = await _loginRepository.login(loginRequestModel);
    result.fold(
      (error) {
        /// SHOW ERROR BAR
        changeLoading(false);
      },
      (response) async {
        await _localService.write(AppLocals.accessToken, response.accessToken);
        await _localService.write(AppLocals.refreshToken, response.refreshToken);
        changeLoading(false);
        await _routeService.goRemoveUntil(path: AppRoutes.test);
      },
    );
  }
}
