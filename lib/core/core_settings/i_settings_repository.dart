import 'package:crypto_tracker/core/models/theme_preference.dart';

abstract class ISettingsRepository {
  ThemePreference get themePreference;
  String? get localeTag; // BCP-47 string like "en"
  String get preferredFiat;

  /// Reactive streams for subscribers who want updates.
  Stream<ThemePreference> get themePreferenceStream;
  Stream<String?> get localeTagStream;
  Stream<String> get fiatStream;

  Future<void> init();

  void dispose();

}
