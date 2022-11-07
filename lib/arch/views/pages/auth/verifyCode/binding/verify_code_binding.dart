const verifyCodeBinding =
    """
import 'package:get/get.dart';
import '../controller/verify_code_controller.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyCodeController());
  }
}
    """;