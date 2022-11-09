import 'package:flutter/material.dart';
import '../../useCases/checkNetwork/view/no_network.dart';

class InitMain {
  static Widget builder(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        NoNetworkWidget()
      ],
    );
  }
}
    