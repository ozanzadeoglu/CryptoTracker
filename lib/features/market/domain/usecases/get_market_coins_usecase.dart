import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';

/// A use case that encapsulates the business logic for fetching the list of market coins.
class GetMarketCoinsUseCase {
  final IMarketRepository _repository;

  GetMarketCoinsUseCase(this._repository);

  /// Executes the use case.
  ///
  /// In the future, this is where business logic like filtering, sorting,
  /// or combining data from multiple repositories would go.
  Future<ApiResult<List<Coin>>> execute() {
    return _repository.fetchMarketCoins();
  }
}