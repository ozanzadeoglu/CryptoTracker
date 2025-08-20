import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/exchange_rate_model.dart';

class HistoricalExchangeRatesRemoteDataSourceImpl
    implements IHistoricalExchangeRatesRemoteDataSource {
  final ApiClient _apiClient;
  final ILoggerService _logger;

  HistoricalExchangeRatesRemoteDataSourceImpl(this._apiClient, this._logger);

  //TODO: Error handling and logging
  @override
  Future<ApiResult<ExchangeRateModel>> getHistoricalRate(
    DateTime date,
    FiatCurrency from,
    FiatCurrency to,
  ) {
    final path = ApiEndpoints.historicalExhangeRate(
      date: date,
      from: from.name,
      to: to.name,
    );

    return _apiClient.get<ExchangeRateModel>(
      path: path,
      fromJson: (json) {
        try {
          // The Frankfurter API response looks like:
          // {"amount": 1.0, "base": "USD", "date": "2024-05-10", "rates": {"TRY": 32.228}}
          final rates = json['rates'] as Map<String, dynamic>?;
          if (rates == null) {
            throw const FormatException('Missing "rates" key in API response.');
          }
          
          // Note: Frankfurter API uses uppercase currency codes in its response.
          final rateValue = rates[to.name.toUpperCase()] as num?;
          if (rateValue == null) {
            throw FormatException(
              'Rate for "${to.name.toUpperCase()}" not found in API response.',
            );
          }
          
          return ExchangeRateModel(
            from: from.name,
            to: to.name,
            date: date, 
            rate: rateValue.toDouble(),
          );
          
        } on Exception catch (e) {
          throw FormatException('Failed to parse historical ExchangeRateModel: $e');
        }
      },
    );
  }

}
