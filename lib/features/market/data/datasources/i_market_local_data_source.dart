import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/cached_coins.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';

/// Defines the contract for the local data source that caches market data.
abstract class IMarketLocalDataSource {
  /// Retrieves the list of top coins from the local cache.
  /// Throws a [CacheException] if the data is not found or is stale.
  Future<ApiResult<CachedCoins>> getMarketCoins();

  /// Saves a list of coins to the local cache.
  Future<ApiResult<void>> cacheMarketCoins(List<Coin> coins);
}