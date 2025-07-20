import 'package:flutter/material.dart';
import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/cache/cache_config.dart'; // Import the new config file
import 'package:crypto_tracker/features/settings/data/datasources/i_settings_local_data_source.dart';

class SettingsLocalDataSourceImpl implements ISettingsLocalDataSource {
  final ICacheService _settingsCache;

  SettingsLocalDataSourceImpl(this._settingsCache);
  
  @override
  Future<void> cacheThemeMode(ThemeMode mode) {
    // Use the constant from CacheKeys
    return _settingsCache.put(CacheKeys.themeMode, mode.name);
  }
  
  @override
  ThemeMode getThemeMode() {
    // Use the constant from CacheKeys
    final themeName = _settingsCache.get<String>(CacheKeys.themeMode);
    
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }
}