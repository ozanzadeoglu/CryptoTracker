import 'dart:async';

import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
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

  DateTime? _lastCacheDate;
  final Duration _cacheTTL = const Duration(minutes: 15);

  MarketRepositoryImpl({
    required IMarketRemoteDataSource remoteDataSource,
    required IMarketLocalDataSource localDataSource,
    required this.connectivityService,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<ApiResult<List<Coin>>> fetchMarketCoins({
    required String currency,
    String? sortOrder,
  }) async {
    // Offline case, fetch from local
    if (!connectivityService.isOnline) {
      final local = await _localDataSource.getMarketCoins();
      switch (local) {
        case Success<CachedCoins>(value: final cache):
          return ApiResult.success(cache.cachedCoins);
        case Failure<CachedCoins>(failure: final error):
          return ApiResult.failure(error);
      }
    }

    // Online case
    final remoteData = await _remoteDataSource.getMarketCoins(currency: currency);
    switch (remoteData) {
      case Success<List<Coin>>(value: final coins):
        // Refresh cache if _lastCacheDate is null, or _lastCacheDate is older than _cacheTTL
        // This case could be expanded to checking latest cache's date, and take action depending
        // that date but it comes with a drawback, we would need to fetch from the local db.
        // With this logic, we might recache before TTL, but this case would happen only once
        // in a app session, so I don't think it's a big drawback.
        if (_lastCacheDate == null ||
            DateTime.now().difference(_lastCacheDate!) >= _cacheTTL) {
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
    // We will implement the full logic for search later.
    // For now, it will only work when online.
    if (!connectivityService.isOnline) {
      return Future.value(
        const ApiResult.failure(
          ApiFailure.network("Search requires an internet connection."),
        ),
      );
    }
    return _remoteDataSource.searchCoins(query);
  }
}
