const pageShowedController =
    """
import 'package:get/get.dart';
import '../consts/bottom_bar_consts.dart';

class PageShowedController extends GetxController {
  var pagesShowedMap = {};

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i <= BottomBarConsts.bottomBarLabels.length; i++) {
      pagesShowedMap['alreadyShowed\$i'] = false.obs;
    }
  }
}
    """;