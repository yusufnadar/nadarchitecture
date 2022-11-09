const pagePaddingExtension = """
import 'package:flutter/material.dart';
import '../../core/constants/app.dart';

extension CustomPadding on Widget {
  Padding pagePadding() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: App.verticalPadding,
        horizontal: App.horizontalPadding,
      ),
      child: this,
    );
  }
}
    """;
