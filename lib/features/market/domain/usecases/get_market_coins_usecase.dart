import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';


/// A use case that encapsulates the business logic for fetching and sorting the list of market coins.
class GetMarketCoinsUseCase {
  final IMarketRepository _repository;

  GetMarketCoinsUseCase(this._repository);

  /// Executes the use case.
  Future<ApiResult<List<Coin>>> execute({
    required String currency,
  }) async {
    final result = await _repository.fetchMarketCoins(
      currency: currency,
    );
    return result;
  }


}