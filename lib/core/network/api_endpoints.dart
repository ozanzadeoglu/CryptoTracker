/// A centralized place for all API endpoint paths and parameter builders.
/// This helps to avoid magic strings and keep the API configuration in one place.
abstract final class ApiEndpoints {
  // --- Base URL ---
  // The base URL is configured in the ApiClient, but it's good practice
  // to document it here as well for clarity.
  // static const String baseUrl = "https://api.coingecko.com/api/v3/";

  static const String _coins = 'coins';

  /// Endpoint for fetching the list of top coins by market cap.
  static String marketCoins({
    required String vsCurrency,
    int perPage = 100,
    int page = 1,
    bool sparkline = true,
  }) {
    return '$_coins/markets?vs_currency=$vsCurrency&per_page=$perPage&page=$page&sparkline=$sparkline';
  }

  /// Endpoint for fetching detailed data for a single coin.
  static String coinDetails(String coinId) {
    return '$_coins/$coinId';
  }

  /// Endpoint for fetching historical market chart data for a single coin.
  static String coinChart({
    required String coinId,
    required String vsCurrency,
    required int days,
  }) {
    return '$_coins/$coinId/market_chart?vs_currency=$vsCurrency&days=$days';
  }

  /// Endpoint for fetching the list of all supported fiat currencies.
  static String supportedVSCurrencies() {
    return 'simple/supported_vs_currencies';
  }
}