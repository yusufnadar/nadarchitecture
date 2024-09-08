import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get top => mediaQuery.viewPadding.top;

  double get bottom => mediaQuery.viewPadding.bottom;
}
