const profileController =
    """
import 'package:get/get.dart';
import '../../../../core/base/base_exception.dart';
import '../../../../core/constants/local_consts.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/init/services/get_it_service.dart';
import '../../../../core/init/services/local_service.dart';

class ProfileController extends GetxController with BaseException {
  final _localService = GetItService.getIt.get<LocalService>();

  Future<void> logout() async {
    try {
      await _localService.remove(AppLocalConsts.refreshToken);
      await _localService.remove(AppLocalConsts.accessToken);
      await Get.offAllNamed(Routes.login);
    } catch (error) {
      showError(error);
    }
  }
}
    """;