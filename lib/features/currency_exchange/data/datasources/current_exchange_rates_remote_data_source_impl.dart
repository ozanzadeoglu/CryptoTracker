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
      fromJson: (json) {
        try {
          final btcData = json['bitcoin'] as Map<String, dynamic>?;
          if (btcData == null) {
            throw const FormatException(
              'Missing "bitcoin" key in API response.',
            );
          }

          final fromPrice = btcData[from.name] as num?;
          final toPrice = btcData[to.name] as num?;

          if (fromPrice == null || toPrice == null) {
            throw FormatException(
              'Missing required currency price in response. Required: "${from.name}" and "${to.name}".',
            );
          }

          if (fromPrice == 0) {
            throw FormatException(
              'Cannot calculate exchange rate: "${from.name}" currency price is zero.',
            );
          }

          final calculatedRate = toPrice.toDouble() / fromPrice.toDouble();

          return ExchangeRateModel(
            from: from.name,
            to: to.name,
            date: DateTime.now(),
            rate: calculatedRate,
          );
        } on Exception catch (e) {
          throw FormatException('Failed to parse ExchangeRateModel: $e');
        }
      },
    );
  }
  
}
