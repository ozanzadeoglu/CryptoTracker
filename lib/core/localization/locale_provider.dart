import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  ///Get current locale of the app. Null if it's not ever changed.
  Locale? get locale => _locale;


  ///A helper method to change app's locale.
  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  ///A helper method to clear the locale and return to the device default.
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}