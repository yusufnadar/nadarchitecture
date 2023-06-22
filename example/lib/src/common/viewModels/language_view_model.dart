import 'package:flutter/material.dart';
import '../../core/services/language/language_service.dart';

// Uygulamanın dilini değiştirdiğimiz kısım
class LanguageViewModel extends ChangeNotifier {
  final languageService = LanguageService.instance;

  Locale get locale => languageService.getLanguage();

  set locale(Locale locale) => this.locale = locale;

  Future<void> changeLanguage(String languageCode) async{
    await languageService.changeLanguage(languageCode);
    notifyListeners();
  }
}
