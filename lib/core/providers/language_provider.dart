import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier {
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  void setLanguage(String languageCode) {
    _currentLanguage = languageCode;
    notifyListeners();
  }

  String getTranslatedText(Map<String, String> translations) {
    return translations[_currentLanguage] ?? translations['en'] ?? '';
  }
}