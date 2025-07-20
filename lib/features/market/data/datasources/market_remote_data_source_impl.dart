import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';

/// An implementation of [IMarketRemoteDataSource] that uses the [ApiClient].
class MarketRemoteDataSourceImpl implements IMarketRemoteDataSource {
  final ApiClient _apiClient;

  MarketRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<Coin>>> getMarketCoins() {
    return _apiClient.get(
      path: ApiEndpoints.marketCoins(perPage: 100, vsCurrency: 'usd'),
      fromJson: (json) {
        final coinList = json as List<dynamic>;
        return coinList.map((e) => Coin.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }
}