/// Contains the names of all Hive boxes used in the application.
abstract final class CacheBoxNames {
  /// The box for storing user-specific settings.
  static const String settings = 'settingsBox';
  static const String marketCache = "marketCacheBox";
}

/// Contains the type id's of all Hive classes used in application.
abstract final class HiveTypeIds {
  static const int coin = 1;
  static const int sparkline = 2;
  static const int transactionType = 3;
  static const int transaction = 4;
}

/// Contains the keys for all values stored in the Hive boxes.
abstract final class CacheKeys {
  /// The key for the saved theme mode ('light', 'dark', or 'system').
  /// Stored in the [CacheBoxNames.settings] box.
  static const String themeMode = 'themeMode';
}
