import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';

/// Defines the contract for a repository that handles cryptocurrency market data.
///
/// This abstraction is the single source of truth for market data for the
/// rest of the application. The Domain and Presentation layers will depend
/// on this interface.
abstract class IMarketRepository {
  /// Fetches the list of top coins from the market.
  ///
  /// Requires a [currency] for pricing and an optional [sortOrder] for API-side sorting.
  Future<ApiResult<List<Coin>>> fetchMarketCoins({
    required String currency,
  });

  /// Searches for coins based on a query.
  Future<ApiResult<List<Coin>>> searchCoins(String query);
}
