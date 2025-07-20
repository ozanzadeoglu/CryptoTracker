import 'package:flutter/material.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';

/// A [ChangeNotifier] that manages the application's current theme.
class ThemeProvider extends ChangeNotifier {
  final ISettingsRepository _settingsRepository;
  
  late ThemeMode _themeMode;

  ThemeProvider(this._settingsRepository) {
    // Load the initial theme from the repository when the provider is created.
    _themeMode = _settingsRepository.getThemeMode();
  }

  /// The current [ThemeMode] of the application.
  ThemeMode get themeMode => _themeMode;

  /// Sets the application's theme to the new [mode], persists the choice,
  /// and notifies listeners to rebuild the UI.
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return; // No change, do nothing.

    _themeMode = mode;
    await _settingsRepository.setThemeMode(mode);
    notifyListeners();
  }
}