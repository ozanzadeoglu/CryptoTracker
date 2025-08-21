import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_current_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/exchange_rate_model.dart';

class CurrentExchangeRatesRemoteDataSourceImpl
    implements ICurrentExchangeRatesRemoteDatasource {
  final ApiClient _apiClient;
  final ILoggerService _logger;

  CurrentExchangeRatesRemoteDataSourceImpl(this._apiClient, this._logger);

  //TODO: Add error handling and logging
  @override
  Future<ApiResult<ExchangeRateModel>> getCurrentExchangeRate(
    FiatCurrency from,
    FiatCurrency to,
  ) {

    final path = ApiEndpoints.todaysExchangeRate(
      fromCurrency: from.name,
      toCurrency: to.name,
    );

    return _apiClient.get<ExchangeRateModel>(
      path: path,
      fromJson: (json) => ExchangeRateModel.fromCoinGeckoJson(json, from, to)
    );
  }

}
