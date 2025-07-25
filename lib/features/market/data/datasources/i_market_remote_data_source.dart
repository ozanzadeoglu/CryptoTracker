import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';

/// Defines the contract for the remote data source that fetches market data.
abstract class IMarketRemoteDataSource {
  /// Fetches the list of top coins from the remote API.
  Future<ApiResult<List<Coin>>> getMarketCoins({
    required String currency,
  });
  
  /// Searches for coins based on a query.
  Future<ApiResult<List<Coin>>> searchCoins(String query);
}
