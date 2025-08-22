import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/daily_exchange_rates.dart';

abstract class ICurrencyRepository {
  Future<ApiResult<DailyExchangeRates>> getRateForDate({required DateTime date});

  Future<ApiResult<Map<String, DailyExchangeRates>>> getHistoricalRatesMap({
    required Set<DateTime> dates,
  });
}
