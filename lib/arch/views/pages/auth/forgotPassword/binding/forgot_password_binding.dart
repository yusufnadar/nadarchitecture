const forgotPasswordBinding =
    """
import 'package:get/get.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
    """;