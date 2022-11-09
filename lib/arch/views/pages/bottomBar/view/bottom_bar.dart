const bottomNavigationBars = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../consts/bottom_bar_consts.dart';
import '../../../../core/constants/colors.dart';
import '../controller/bottom_navigation_bar_controller.dart';

class BottomNavigationBars extends GetWidget<BottomNavigationBarController> {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index,
            selectedFontSize: 8,
            selectedLabelStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppColors.red,
              fontSize: 12,
            ),
            selectedItemColor: AppColors.red,
            unselectedItemColor: AppColors.black,
            unselectedFontSize: 16,
            onTap: controller.changeIndex,
            items: BottomBarConsts.bottomBarItemList,
          ),
          body: IndexedStack(
            index: controller.index,
            children: BottomBarConsts.allNavigators,
          ),
        ),
      ),
    );
  }
}
    """;
