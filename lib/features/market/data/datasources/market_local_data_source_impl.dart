import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/cached_coins.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';

class MarketLocalDataSourceImpl implements IMarketLocalDataSource {
  final ICacheService _cacheService;
  final String _cacheKey = "cachedMarketList";
  final String _unknownPutCacheError =
      "Error on MarketLocalDataSourceImpl cacheMarketCoins";

  MarketLocalDataSourceImpl(this._cacheService);

  @override
  Future<ApiResult<CachedCoins>> getMarketCoins() async {
    final result = await _cacheService.get<CachedCoins?>(_cacheKey);
    switch (result) {
      case Success<CachedCoins?>(value: final data):
        if (data == null) {
          return const ApiResult.failure(ApiFailure.cache());
        }
        return ApiResult.success(data);
      case Failure<CachedCoins?>(failure: final error):
        return ApiResult.failure(error);
    }
  }

  @override
  Future<ApiResult<void>> cacheMarketCoins(List<Coin> coins) async {
    final cachedCoins = CachedCoins(date: DateTime.now(), cachedCoins: coins);
    final result = await _cacheService.put<CachedCoins>(_cacheKey, cachedCoins);
    switch (result) {
      case Success<void>():
        return const ApiResult.success(null);
      case Failure<void>():
        return ApiResult.failure(ApiFailure.cache(_unknownPutCacheError));
    }
  }
}
