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
  static const int transaction = 3;
  static const int portfolioAssetSummary = 4;
  static const int cachedCoins = 5;
  static const int dailyExchangeRates = 6;
}

