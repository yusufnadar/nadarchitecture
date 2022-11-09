import 'package:get/get.dart';
import '../controller/bottom_navigation_bar_controller.dart';
import '../controller/page_showed_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageShowedController());
    Get.lazyPut(() => BottomNavigationBarController());
  }
}
    