const profileBinding = """
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
    """;
