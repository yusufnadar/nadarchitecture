const pageShowed = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/page_showed_controller.dart';

class PageShowed extends StatelessWidget {
  final Widget child;
  final int index;

  const PageShowed({Key? key, required this.child, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PageShowedController>(
      builder: (controller) =>
          controller.pagesShowedMap['alreadyShowed\$index'] == true
              ? child
              : Container(),
    );
  }
}
    """;
