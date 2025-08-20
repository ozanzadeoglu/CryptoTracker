import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/exchange_rate_model.dart';

abstract class ICurrentExchangeRatesRemoteDatasource {
  /// Fetches a single current exchange rate.
  Future<ApiResult<ExchangeRateModel>> getCurrentExchangeRate(
    FiatCurrency from,
    FiatCurrency to,
  );
}
