import 'package:flutter/services.dart';

// Cihazın yatay ya da diket olarak kullanılacağını belirlediğimiz kısım
mixin DeviceOrientationSettings {
  static Future screenVertical() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  static Future screenHorizontal() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );
  }

  static Future screenRight() async {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight],
    );
  }

  static Future screenLeft() async {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft],
    );
  }
}

