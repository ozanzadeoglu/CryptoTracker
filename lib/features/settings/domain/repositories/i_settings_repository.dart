import 'package:flutter/material.dart';

/// Defines the contract for a repository that handles app settings.
abstract class ISettingsRepository {
  /// Persists the user's selected [ThemeMode].
  Future<void> setThemeMode(ThemeMode mode);

  /// Retrieves the user's selected [ThemeMode].
  ThemeMode getThemeMode();
}