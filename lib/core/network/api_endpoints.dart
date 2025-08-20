/// A centralized place for all API endpoint paths and parameter builders.
/// This helps to avoid magic strings and keep the API configuration in one place.
abstract final class ApiEndpoints {
  static const String _coins = 'coins';

  /// Endpoint for fetching coin market data.
  ///
  /// Can be used to get a list of top coins (default) or to fetch
  /// specific coins by providing a list of [ids].
  static String marketCoins({
    required String vsCurrency,
    int perPage = 100,
    int page = 1,
    bool sparkline = true,
    String? order,
    List<String>? ids,
  }) {
    // Start with the base path and required parameters
    String path =
        '$_coins/markets?vs_currency=$vsCurrency&per_page=$perPage&page=$page&sparkline=$sparkline';

    // Append the order parameter if it's provided.
    if (order != null && ids == null) {
      path += '&order=$order';
    }

    // Append the ids parameter if it's provided
    if (ids != null && ids.isNotEmpty) {
      path += '&ids=${ids.join(',')}';
    }

    return path;
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

  /// Endpoint for searching for coins by a query string.
  static String search(String query) {
    return 'search?query=$query';
  }

  /// Endpoint for fetching historical exchange rates for a specific date from Frankfurter API.
  ///
  /// Corresponds to the API path: `/{YYYY-MM-DD}`
  static String historicalExhangeRate({
    required DateTime date,
    required String from,
    required String to,
  }) {
    final dateString = _formatDate(date);
    return '$dateString${"?from=$from&to=$to"}';
  }

  /// Helper to format a DateTime object into 'YYYY-MM-DD' string required by the Frankfurter API.
  static String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  /// Endpoint for deriving today's real-time exchange rate via CoinGecko.
  ///
  /// This works by fetching the price of Bitcoin in two different fiat
  /// currencies to calculate the exchange rate and it's used for addressing
  ///  shortcoming of Frankfurter API.
  static String todaysExchangeRate({
    required String fromCurrency,
    required String toCurrency,
  }) {
    
    const idsParam = 'bitcoin';
    final vsCurrenciesParam =
        '${fromCurrency.toLowerCase()},${toCurrency.toLowerCase()}';
    return 'simple/price?ids=$idsParam&vs_currencies=$vsCurrenciesParam';
  }
}
