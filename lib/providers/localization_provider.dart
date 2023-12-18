import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier {
  Locale? _locale;

  LocalizationsProvider.defaultLocale({required String localeCode})
      : _locale = Locale(localeCode),
        super();

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
