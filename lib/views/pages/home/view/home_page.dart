import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/routes.dart';
import '../../bottomBar/consts/bottom_bar_consts.dart';
import '../../bottomBar/widgets/page_showed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageShowed(
      index: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await Get.toNamed(
                Routes.detail,
                id: BottomBarConsts.navigatorIdHomePage,
              );
            },
            child: const Text('Go Detail'),
          ),
        ),
      ),
    );
  }
}
    