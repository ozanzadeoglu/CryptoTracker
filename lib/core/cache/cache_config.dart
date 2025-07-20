/// Contains the names of all Hive boxes used in the application.
abstract final class CacheBoxNames {
  /// The box for storing user-specific settings.
  static const String settings = 'settingsBox';
}

/// Contains the keys for all values stored in the Hive boxes.
abstract final class CacheKeys {
  /// The key for the saved theme mode ('light', 'dark', or 'system').
  /// Stored in the [CacheBoxNames.settings] box.
  static const String themeMode = 'themeMode';
}