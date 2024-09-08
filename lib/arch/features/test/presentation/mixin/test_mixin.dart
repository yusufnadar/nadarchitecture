const testMixin = """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/test_view.dart';
import '../view_model/test_view_model.dart';

mixin TestMixin on State<TestView> {
  late TestViewModel model;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    model = context.read<TestViewModel>()..getDataPaginate();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.offset >= scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          model.getDataPaginate();
        }
      });
    });
  }
}
""";