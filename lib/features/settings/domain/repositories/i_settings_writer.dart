import 'package:crypto_tracker/core/models/theme_preference.dart';

/// This interfaces goal is to only make settings repository change from
/// settings feature.
abstract class ISettingsWriter {
  Future<void> setTheme(ThemePreference pref);
  Future<void> setLocaleTag(String? tag);
  Future<void> setPreferredFiat(String fiat);
}
