import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/repository/repository_helper_mixin.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';

/// An implementation of [IMarketRepository] that orchestrates data from
/// remote and local data sources.
class MarketRepositoryImpl
    with RepositoryHelperMixin
    implements IMarketRepository {
  final IMarketRemoteDataSource _remoteDataSource;
  final IMarketLocalDataSource _localDataSource;

  @override
  final IConnectivityService connectivityService;

  MarketRepositoryImpl({
    required IMarketRemoteDataSource remoteDataSource,
    required IMarketLocalDataSource localDataSource,
    required this.connectivityService,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<ApiResult<List<Coin>>> fetchMarketCoins() {
    return fetchData(
      remoteFetch: () => _remoteDataSource.getMarketCoins(),
      // For online-only phase, any attempt to fetch locally is a failure.
      localFetch: () async {
        return const ApiResult.failure(
          ApiFailure.unknown(
            "Offline functionality is not available yet. Please check your internet connection.",
          ),
        );
      },
    );
  }
}
