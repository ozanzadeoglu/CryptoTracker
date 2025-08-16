import 'package:crypto_tracker/core/models/app_locales.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/models/theme_preference.dart';

abstract class ISettingsRepository {
  ThemePreference get themePreference;
  AppLocale get localeTag; // BCP-47 string like "en"
  FiatCurrency get preferredFiat;

  /// Reactive streams for subscribers who want updates.
  Stream<ThemePreference> get themePreferenceStream;
  Stream<AppLocale> get localeTagStream;
  Stream<FiatCurrency> get fiatStream;

  Future<void> init();

  void dispose();

}
