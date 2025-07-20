import 'package:flutter/material.dart';

/// Defines the contract for the local data source that manages app settings.
abstract class ISettingsLocalDataSource {
  /// Caches the user's selected [ThemeMode].
  Future<void> cacheThemeMode(ThemeMode mode);

  /// Retrieves the user's selected [ThemeMode] from the cache.
  /// Returns the system default if no choice has been saved.
  ThemeMode getThemeMode();
}