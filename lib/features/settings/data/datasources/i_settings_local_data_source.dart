import 'package:crypto_tracker/core/models/theme_preference.dart';
import 'package:crypto_tracker/core/network/api_result.dart';

/// Defines the contract for the local data source that manages app settings.
abstract class ISettingsLocalDataSource {
  // Theme
  Future<ApiResult<ThemePreference?>> getThemePreference();
  Future<ApiResult<void>> setThemePreference(String pref);

  // Locale as tag e.g. 'en', 'tr'
  Future<ApiResult<String?>> getLocaleTag();
  Future<ApiResult<void>> setLocaleTag(String? tag);

  // Fiat currency string (e.g. 'usd', 'eur')
  Future<ApiResult<String?>> getPreferredFiat();
  Future<ApiResult<void>> setPreferredFiat(String fiat);
}
