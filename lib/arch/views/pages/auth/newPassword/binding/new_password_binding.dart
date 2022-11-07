const newPasswordBinding =
    """
import 'package:get/get.dart';
import '../controller/new_password_controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController());
  }
}
    """;