import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

abstract class IHistoricalExchangeRatesRemoteDataSource {
  /// Fetches a single historical exchange rate for a specific date from the remote API.
  Future<ApiResult<DailyExchangeRatesModel>> getHistoricalRate(
    DateTime date,
  );

}
