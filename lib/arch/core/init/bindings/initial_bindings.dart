const initialBindings = """
import 'package:get/get.dart';
import '../../../common/controllers/user_controller.dart';
import '../../useCases/checkNetwork/controller/network_cache_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(NetworkCacheController());
  }
}
    """;
