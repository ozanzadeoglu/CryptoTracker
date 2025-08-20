import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/exchange_rate_model.dart';

abstract class IHistoricalExchangeRatesRemoteDataSource {
  /// Fetches a single historical exchange rate for a specific date from the remote API.
  Future<ApiResult<ExchangeRateModel>> getHistoricalRate(
    DateTime date,
    FiatCurrency from,
    FiatCurrency to,
  );

}
