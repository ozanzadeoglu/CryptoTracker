import 'package:crypto_tracker/core/models/app_locales.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/models/theme_preference.dart';

/// This interfaces goal is to only make settings repository change from
/// settings feature.
abstract class ISettingsWriter {
  Future<void> setTheme(ThemePreference pref);
  Future<void> setLocaleTag(AppLocale tag);
  Future<void> setPreferredFiat(FiatCurrency fiat);
}
