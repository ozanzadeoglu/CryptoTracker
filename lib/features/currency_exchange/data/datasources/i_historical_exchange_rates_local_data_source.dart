import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

abstract class IHistoricalExchangeRatesLocalDataSource {
  /// Fetches the cached [DailyExchangeRatesModel] for a specific date.
  /// Returns `null` if no data is found for that date.
  Future<ApiResult<DailyExchangeRatesModel?>> getRateForDate(DateTime date);

  /// Caches a [DailyExchangeRatesModel]. The date within the model is used as the key.
  Future<ApiResult<void>> saveRateForDate(DailyExchangeRatesModel model);
}
