import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../consts/bottom_bar_consts.dart';
import 'page_showed_controller.dart';

class BottomNavigationBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _index = RxInt(0);

  int get index => _index.value;

  set index(int index) => _index.value = index;

  late TabController tabController;

  List<int> pageList = [0];

  // change bottom bar index
  void changeIndex(int itemIndex) {
    bottomPagesOpeningFirstTime(itemIndex);
    if (itemIndex == index) {
      Get.nestedKey(index)?.currentState?.popUntil(
            (route) => route.isFirst,
          );
    } else {
      index = itemIndex;
      if (pageList.length <= 2) {
        if (pageList.contains(index)) {
          pageList.remove(index);
          pageList.add(index);
        } else {
          pageList.add(index);
        }
      } else {
        pageList.removeAt(1);
        pageList.add(index);
      }
    }
  }

  void bottomPagesOpeningFirstTime(itemIndex) {
    final pageShowedController = Get.find<PageShowedController>();
    var isShowed =
        pageShowedController.pagesShowedMap['alreadyShowed$itemIndex'];
    if (isShowed.value != true) {
      isShowed.value = true;
    }
  }

  @override
  void onInit() async {
    tabController = TabController(
      length: BottomBarConsts.bottomBarLabels.length,
      vsync: this,
    );
    bottomPagesOpeningFirstTime(0);
    BottomBarConsts.bottomBarItemList = List.generate(
      BottomBarConsts.bottomBarLabels.length,
      (index) => BottomNavigationBarItem(
        icon: Container(
          height: Get.height * 0.04,
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Icon(BottomBarConsts.bottomBarIcons[index]),
        ),
        label: BottomBarConsts.bottomBarLabels[index].values.last,
      ),
    );
    super.onInit();
  }

  Future<bool> onWillPop() async {
    var goBack = !await Get.nestedKey(index)!.currentState!.maybePop();
    if (pageList.length == 1 && pageList.contains(0)) {
      if (goBack) {
        // if home page didn't go any page yet close app
        SystemNavigator.pop();
      }
    } else if (pageList.length == 1) {
      // ana sayfa dışında bir sekme varsa ana sayfaya git
      index = 0;
      pageList = [0];
    } else {
      if (goBack) {
        // sonuncu elemanı çıkar ve ondan bir önceki sekmeye git
        pageList.removeLast();
        index = pageList.last;
      }
    }
    return Future.value(false);
  }
}
    