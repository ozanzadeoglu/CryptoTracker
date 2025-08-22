import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/daily_exchange_rates.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/repository/i_currency_repository.dart';

class GetRateForDateUsecase {
  final ICurrencyRepository _currencyRepository;

  GetRateForDateUsecase(this._currencyRepository);

  Future<ApiResult<Map<String, DailyExchangeRates>>> execute({
    required Set<DateTime> dates,
  }) async {
    return await _currencyRepository.getHistoricalRatesMap(dates: dates);
  }
}