import 'package:flutter/material.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:crypto_tracker/features/settings/data/datasources/i_settings_local_data_source.dart';

class SettingsRepositoryImpl implements ISettingsRepository {
  final ISettingsLocalDataSource _localDataSource;

  SettingsRepositoryImpl(this._localDataSource);

  @override
  Future<void> setThemeMode(ThemeMode mode) {
    return _localDataSource.cacheThemeMode(mode);
  }

  @override
  ThemeMode getThemeMode() {
    return _localDataSource.getThemeMode();
  }
}