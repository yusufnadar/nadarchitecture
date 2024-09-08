const userViewModel = """
import '../../../core/consts/local/app_locals.dart';
import '../../../core/consts/route/app_routes.dart';
import '../../../core/services/local/local_service.dart';
import '../../../core/services/route/route_service.dart';
import '../../model/user/user_model.dart';

class UserViewModel {
  UserViewModel(this._routeService, this._localService);

  final RouteService _routeService;
  final LocalService _localService;
  UserModel? user;

  Future<void> logout() async {
    await Future.wait(
      [
        _localService.remove(AppLocals.accessToken),
        _localService.remove(AppLocals.refreshToken),
      ],
    );
    user = null;
    await _routeService.goRemoveUntil(path: AppRoutes.login);
  }
}

""";
