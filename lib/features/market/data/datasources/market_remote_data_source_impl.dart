import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';

/// An implementation of [IMarketRemoteDataSource] that uses the [ApiClient].
class MarketRemoteDataSourceImpl implements IMarketRemoteDataSource {
  final ApiClient _apiClient;

  MarketRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<Coin>>> getMarketCoins({required String currency}) {
    return _apiClient.get(
      path: ApiEndpoints.marketCoins(vsCurrency: currency, perPage: 100),
      fromJson: (json) {
        final coinList = json as List<dynamic>;
        return coinList
            .map((e) => Coin.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  /// The CoinGecko `/search` endpoint returns a simplified model. To provide a
  /// consistent UI with full data (price, 24h change), this method performs a two-step fetch:
  /// 1. Get the list of coin IDs from the `/search` endpoint.
  /// 2. Use those IDs to fetch the full `Coin` models from the `/markets` endpoint.
  /// This entire complex operation is encapsulated here, so the rest of the
  /// app can simply call `searchCoins` and get a full `List<Coin>`.
  @override
  Future<ApiResult<List<Coin>>> searchCoins(String query) async {
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
    if (idResult is Success<List<String>>) {
      final ids = idResult.value;
      if (ids.isEmpty) {
        // If the search returns no results, return an empty success list.
        return const ApiResult.success([]);
      }
      // Step 2: Fetch the full coin data for the retrieved IDs
      return _fetchCoinsByIds(ids);
    } else if (idResult is Failure<List<String>>) {
      // If the initial search for IDs fails, propagate the failure.
      return ApiResult.failure(idResult.failure);
    }

    // This case should not be reachable, but is a safety net.
    return const ApiResult.failure(
      ApiFailure.unknown("An unexpected error occurred during search."),
    );
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
