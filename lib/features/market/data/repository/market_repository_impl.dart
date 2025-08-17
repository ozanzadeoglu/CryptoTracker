import 'dart:async';

import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/errors/app_errors.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/market/domain/models/cached_coins.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';

/// An implementation of [IMarketRepository] that orchestrates data from
/// remote and local data sources.
class MarketRepositoryImpl implements IMarketRepository {
  final IMarketRemoteDataSource _remoteDataSource;
  final IMarketLocalDataSource _localDataSource;
  final IConnectivityService connectivityService;
  final ILoggerService _logger;

  DateTime? _lastCacheDate;
  final Duration _cacheTTL = const Duration(minutes: 15);

  MarketRepositoryImpl({
    required IMarketRemoteDataSource remoteDataSource,
    required IMarketLocalDataSource localDataSource,
    required this.connectivityService,
    required loggerService,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _logger = loggerService;

  @override
  Future<ApiResult<List<Coin>>> fetchMarketCoins({
    required String currency,
  }) async {
    _logger.logInfo(
      ".fetchMarketCoins: Orchestrating market data fetch - will check connectivity and use appropriate data source",
      source: "MarketRepositoryImpl",
    );

    // Offline case, fetch from local
    if (!connectivityService.isOnline) {
      _logger.logInfo(
        ".fetchMarketCoins: Device offline - attempting cache retrieval",
        source: "MarketRepositoryImpl",
      );

      final local = await _localDataSource.getMarketCoins();
      switch (local) {
        case Success<CachedCoins>(value: final cache):
          return ApiResult.success(cache.cachedCoins);
        case Failure<CachedCoins>(failure: final error):
          return ApiResult.failure(error);
      }
    }

    // Online case
    _logger.logInfo(
      ".fetchMarketCoins: Device online - fetching from API with cache fallback",
      source: "MarketRepositoryImpl",
    );
    final remoteData = await _remoteDataSource.getMarketCoins(
      currency: currency,
    );
    switch (remoteData) {
      case Success<List<Coin>>(value: final coins):
        // Refresh cache if _lastCacheDate is null, or _lastCacheDate is older than _cacheTTL
        // This case could be expanded to checking latest cache's date, and take action depending
        // that date but it comes with a drawback, we would need to fetch from the local db.
        // With this logic, we might recache before TTL, but this case would happen only once
        // in a app session, so I don't think it's a big drawback.

        if (_lastCacheDate == null ||
            DateTime.now().difference(_lastCacheDate!) >= _cacheTTL ||
                _localDataSource.isCacheEmpty()) {

          _logger.logInfo(
            ".fetchMarketCoins: Updating cache (TTL expired)",
            source: "MarketRepositoryImpl",
          );
          unawaited(_localDataSource.cacheMarketCoins(coins));
          _lastCacheDate = DateTime.now();
        }
        return ApiResult.success(coins);

      //Failure case
      default:
        return remoteData;
    }
  }

  @override
  Future<ApiResult<List<Coin>>> searchCoins(String query) {
    _logger.logInfo(
      ".searchCoins: Orchestrating search data fetch - will check connectivity and use appropriate data source",
      source: "MarketRepositoryImpl",
    );
    if (!connectivityService.isOnline) {
      _logger.logWarning(
        ".searchCoins: Device offline - return an ApiFailure with an AppError that indicates that search is an offline only feature",
        source: "MarketRepositoryImpl",
      );
      return Future.value(
        const ApiResult.failure(
          ApiFailure.network(AppError.noNetworkConnection),
        ),
      );
    }
    _logger.logInfo(
      ".searchCoins: Device online - attempting to search data fetch from remote api",
      source: "MarketRepositoryImpl",
    );
    return _remoteDataSource.searchCoins(query);
  }
}
