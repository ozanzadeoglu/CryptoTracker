import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';

/// A use case that encapsulates the business logic for searching for coins.
class SearchCoinsUseCase {
  final IMarketRepository _repository;

  SearchCoinsUseCase(this._repository);

  /// Executes the search with a given [query].
  Future<ApiResult<List<Coin>>> execute(String query) {
    if (query.isEmpty) {
      return Future.value(const ApiResult.success([]));
    }
    // It simply delegates the call to the repository.
    // The repository's implementation will handle the complex fetch.
    return _repository.searchCoins(query);
  }
}