import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';

/// An implementation of [IMarketRemoteDataSource] that uses the [ApiClient].
class MarketRemoteDataSourceImpl implements IMarketRemoteDataSource {
  final ApiClient _apiClient;
  final ILoggerService _logger;

  MarketRemoteDataSourceImpl(this._apiClient, this._logger);

  @override
  Future<ApiResult<List<Coin>>> getMarketCoins({
    required String currency,
  }) async {
    // TODO: Revise logs when changing currency feature and pagination is added to app,
    _logger.logInfo(
      ".getMarketCoins: Attempting to fetch market coins, fiat currency: $currency",
      source: "MarketRemoteDataSourceImpl",
    );
    final result = await _apiClient.get(
      path: ApiEndpoints.marketCoins(vsCurrency: currency, perPage: 100),
      fromJson: (json) {
        final coinList = json as List<dynamic>;
        return coinList
            .map((e) => Coin.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );

    switch (result) {
      case Success<List<Coin>>():
        _logger.logInfo(
          ".getMarketCoins: Successfully fetched market coins",
          source: "MarketRemoteDataSourceImpl",
        );
        return result;

      case Failure<List<Coin>>(failure: final apiFailure):
        _logger.logError(
          ".getMarketCoins: Failed to fetch market coins, error type: ${apiFailure.runtimeType}",
          source: "MarketRemoteDataSourceImpl",
        );
        return ApiResult.failure(apiFailure);
    }
    
  }

  /// The CoinGecko `/search` endpoint returns a simplified model. To provide a
  /// consistent UI with full data (price, 24h change), this method performs a two-step fetch:
  /// 1. Get the list of coin IDs from the `/search` endpoint.
  /// 2. Use those IDs to fetch the full `Coin` models from the `/markets` endpoint.
  /// This entire complex operation is encapsulated here, so the rest of the
  /// app can simply call `searchCoins` and get a full `List<Coin>`.
  @override
  Future<ApiResult<List<Coin>>> searchCoins(String query) async {
    _logger.logInfo(
      ".searchCoins: Starting search for query: '$query'",
      source: "MarketRemoteDataSourceImpl",
    );

    // Step 1: Search for the coin IDs
    final idResult = await _apiClient.get(
      path: ApiEndpoints.search(query),
      fromJson: (json) {
        final coinList = json['coins'] as List<dynamic>;
        return coinList
            .map((e) => (e as Map<String, dynamic>)['id'] as String)
            .toList();
      },
    );

    // Handle the result of the first API call
    switch (idResult) {
      case Success<List<String>>(value: final ids):
        if (ids.isEmpty) {
          _logger.logInfo(
            ".searchCoins: No search results found for query: '$query'",
            source: "MarketRemoteDataSourceImpl",
          );
          // If the search returns no results, return list.
          return const ApiResult.success([]);
        }

        _logger.logInfo(
          ".searchCoins: Found ${ids.length} coin IDs for query: '$query', fetching full coin data",
          source: "MarketRemoteDataSourceImpl",
        );

        // Step 2: Fetch the full coin data for the retrieved IDs
        final coinResult = await _fetchCoinsByIds(ids);

        switch (coinResult) {
          case Success<List<Coin>>(value: final coins):
            _logger.logInfo(
              ".searchCoins: Successfully fetched ${coins.length} full coin records for query: '$query'",
              source: "MarketRemoteDataSourceImpl",
            );
            return coinResult;

          case Failure<List<Coin>>(failure: final apiFailure):
            _logger.logError(
              ".searchCoins: Failed to fetch full coin data for query: '$query', error type: ${apiFailure.runtimeType}",
              source: "MarketRemoteDataSourceImpl",
            );
            return coinResult;
        }

      case Failure<List<String>>(failure: final apiFailure):
        _logger.logError(
          ".searchCoins: Failed to search for query: '$query', error type: ${apiFailure.runtimeType}",
          source: "MarketRemoteDataSourceImpl",
        );
        return ApiResult.failure(apiFailure);
    }
  }

  /// A private helper method to fetch full coin data for a list of IDs.
  /// This is an implementation detail to support the `searchCoins` method.
  Future<ApiResult<List<Coin>>> _fetchCoinsByIds(List<String> ids) {
    return _apiClient.get(
      path: ApiEndpoints.marketCoins(vsCurrency: 'usd', ids: ids),
      fromJson: (json) {
        final coinList = json as List<dynamic>;

        // Filter out any entries missing required JSON keys
        final filteredCoinList = coinList.where((e) {
          final map = e as Map<String, dynamic>;
          return map['id'] != null &&
              map['symbol'] != null &&
              map['name'] != null &&
              map['image'] != null &&
              map['current_price'] != null &&
              map['price_change_percentage_24h'] != null &&
              map['market_cap_rank'] != null;
        });

        return filteredCoinList
            .map((e) => Coin.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
