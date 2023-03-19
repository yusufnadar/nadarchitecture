import 'package:flutter/material.dart';
import 'no_network_widget.dart';

class BuilderWidget extends StatelessWidget {
  final Widget? child;

  const BuilderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        const NoNetworkWidget(),
      ],
    );
  }
}
