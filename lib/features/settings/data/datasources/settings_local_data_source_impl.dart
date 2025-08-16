import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/models/theme_preference.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/settings/data/datasources/i_settings_local_data_source.dart';

class SettingsLocalDataSourceImpl implements ISettingsLocalDataSource {
  static const _kTheme = 'settings.theme';
  static const _kLocale = 'settings.locale';
  static const _kFiat = 'settings.fiat';

  final ICacheService<SettingsFeature> _cache;

  SettingsLocalDataSourceImpl(this._cache);

  ThemePreference _parseTheme(String? raw) {
    switch (raw) {
      case 'light':
        return ThemePreference.light;
      case 'dark':
        return ThemePreference.dark;
      default:
        return ThemePreference.system;
    }
  }

  // Theme
  @override
  Future<ApiResult<ThemePreference?>> getThemePreference() async {
    final response = await _cache.get<String>(
      _kTheme,
    );
    return response.when(
      success: (result) {
        if (result == null) {
          return const ApiResult<ThemePreference?>.success(null);
        }
        return ApiResult<ThemePreference?>.success(_parseTheme(result));
      },
      failure: (failure) => ApiResult<ThemePreference?>.failure(failure),
    );
  }

  @override
  Future<ApiResult<void>> setThemePreference(String pref) {
    final raw = pref; 
    return _cache.put<String>(_kTheme, raw);
  }

  // Locale
  @override
  Future<ApiResult<String?>> getLocaleTag() async {
    final apiRes = await _cache.get<String>(_kLocale);
    return apiRes.when(
      success: (raw) => ApiResult<String?>.success(raw),
      failure: (failure) => ApiResult<String?>.failure(failure),
    );
  }

  @override
  Future<ApiResult<void>> setLocaleTag(String? tag) {
    if (tag == null) return _cache.delete(_kLocale);
    return _cache.put<String>(_kLocale, tag);
  }

  // Fiat
  @override
  Future<ApiResult<String?>> getPreferredFiat() async {
    final apiRes = await _cache.get<String>(_kFiat);
    return apiRes.when(
      success: (raw) => ApiResult<String?>.success(raw),
      failure: (failure) => ApiResult<String?>.failure(failure),
    );
  }

  @override
  Future<ApiResult<void>> setPreferredFiat(String fiat) =>
      _cache.put<String>(_kFiat, fiat.toLowerCase());
}
