import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

abstract class ICurrentExchangeRatesRemoteDatasource {
  /// Fetches today's exchange rates.
  Future<ApiResult<DailyExchangeRatesModel>> getCurrentExchangeRates();
}
