const splashController =
    """
import 'package:get/get.dart';
import '../../../../../common/controllers/user_controller.dart';
import '../../../../../core/constants/local_consts.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/init/services/get_it_service.dart';
import '../../../../../core/init/services/local_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    routePage();
  }

  Future<void> routePage() async {
    final accessToken =
        GetItService.getIt.get<LocalService>().read(AppLocalConsts.accessToken);
    await Future.delayed(const Duration(seconds: 2));
    if (accessToken != null) {
      await Get.find<UserController>().getUser();
      await Get.offAllNamed(Routes.bottomNavigationBar);
    } else {
      await Get.offAllNamed(Routes.login);
    }
  }
}
    """;