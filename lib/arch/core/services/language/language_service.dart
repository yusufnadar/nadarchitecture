const languageService = """
import 'dart:io';

import 'package:flutter/material.dart';
import '../../exports/constants_exports.dart';
import '../local/local_service.dart';

// Uygulama içerisinde dil değişimini kontrol ettiğimiz kısım
class LanguageService {
  LanguageService._init();

  static final LanguageService _instance = LanguageService._init();

  static LanguageService get instance => _instance;

  final localService = LocalService.instance;

  Locale getLanguage() => Locale(
        localService.read(LocalConstants.language) ??
            Platform.localeName.split('_')[0],
      );

  Future<void> changeLanguage(ln) async {
    await localService.write(LocalConstants.language, ln);
  }
}
""";