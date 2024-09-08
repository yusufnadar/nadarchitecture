import 'package:flutter/material.dart';

class RouteService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool Function(Route<dynamic> route) get removeAllOldRoutes =>
      (Route<dynamic> route) => false;

  Future<void> go({String? path, Object? data, bool? rootNavigator}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  Future<void> goRemoveUntil({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path!,
      removeAllOldRoutes,
      arguments: data,
    );
  }

  void pop({String? path, Object? data}) {
    navigatorKey.currentState!.pop();
  }

  void popUntil({String? path, Object? data}) {
    navigatorKey.currentState!.popUntil((route) => route.settings.name == path);
  }
}
