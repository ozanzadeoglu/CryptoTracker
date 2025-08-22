import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/daily_exchange_rates.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/repository/i_currency_repository.dart';

class GetHistoricalRatesUsecase {
  final ICurrencyRepository _currencyRepository;

  GetHistoricalRatesUsecase(this._currencyRepository);

  Future<ApiResult<DailyExchangeRates>> execute({
    required DateTime date,
  }) async {
    return await _currencyRepository.getRateForDate(date: date);
  }
}
