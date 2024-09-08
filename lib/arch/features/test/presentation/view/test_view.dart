const testView = """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mixin/test_mixin.dart';
import '../view_model/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> with TestMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer<TestViewModel>(
        builder: (BuildContext context, model, Widget? child) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (model.isError) {
            return const Center(child: Text('ERROR'));
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: model.list.length,
              itemBuilder: (context, index) {
                final item = model.list[index];
                return Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(item.name ?? ""),
                );
              },
            );
          }
        },
      ),
    );
  }
}
""";