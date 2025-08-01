import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/errors/app_errors.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/market/domain/models/cached_coins.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';

class MarketLocalDataSourceImpl implements IMarketLocalDataSource {
  final ICacheService _cacheService;
  final ILoggerService _logger;
  final String _cacheKey = "cachedMarketList";

  MarketLocalDataSourceImpl(this._cacheService, this._logger);

  @override
  Future<ApiResult<CachedCoins>> getMarketCoins() async {
    _logger.logInfo(
      ".getMarketCoins: Retrieving cached entry from '$_cacheKey' key",
      source: "MarketLocalDataSourceImpl",
    );

    final result = await _cacheService.get<CachedCoins?>(_cacheKey);
    switch (result) {
      case Success<CachedCoins?>(value: final data):
        if (data == null) {
          _logger.logWarning(
            ".getMarketCoins: no cache entry found from '$_cacheKey' key",
            source: "MarketLocalDataSourceImpl",
          );
          // TODO: Might create a specific AppError for this case, give it another look
          return const ApiResult.failure(
            ApiFailure.cache(AppError.noNetworkConnection),
          );
        }
        _logger.logInfo(
          ".getMarketCoins: retrieved cachedCoins from '$_cacheKey' key",
          source: "MarketLocalDataSourceImpl",
        );
        return ApiResult.success(data);
      case Failure<CachedCoins?>(failure: final apiFailure):
        _logger.logWarning(
          ".getMarketCoins: no cache entry found from '$_cacheKey' key, error type: ${apiFailure.runtimeType}",
          source: "MarketLocalDataSourceImpl",
        );
        return const ApiResult.failure(
          ApiFailure.cache(AppError.noNetworkConnection),
        );
    }
  }

  @override
  Future<ApiResult<void>> cacheMarketCoins(List<Coin> coins) async {
    _logger.logInfo(
      ".cacheMarketCoins: Attempting to cache coins list to '$_cacheKey' key",
      source: "MarketLocalDataSourceImpl",
    );

    final cachedCoins = CachedCoins(date: DateTime.now(), cachedCoins: coins);
    final result = await _cacheService.put<CachedCoins>(_cacheKey, cachedCoins);
    switch (result) {
      case Success<void>():
        _logger.logInfo(
          ".cacheMarketCoins: Coins list cached succesfully to '$_cacheKey' key",
          source: "MarketLocalDataSourceImpl",
        );
        return const ApiResult.success(null);
      case Failure<void>(failure: final apiFailure):
        _logger.logError(
          ".cacheMarketCoins: Caching coins list operation failed to '$_cacheKey' key",
          source: "MarketLocalDataSourceImpl",
        );
        return ApiResult.failure(apiFailure);
    }
  }
}
