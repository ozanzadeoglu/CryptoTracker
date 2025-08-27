import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

class HistoricalExchangeRatesRemoteDataSourceImpl
    implements IHistoricalExchangeRatesRemoteDataSource {
  final ApiClient _apiClient;
  final ILoggerService _logger;

  HistoricalExchangeRatesRemoteDataSourceImpl(this._apiClient, this._logger);

  //TODO: Error handling and logging, logging might cause excessive pollution on debug console.
  @override
  Future<ApiResult<DailyExchangeRatesModel>> getHistoricalRate(
    DateTime date,
  ) {
    final path = ApiEndpoints.historicalDailyExchangeRate(date: date);

    return _apiClient.get<DailyExchangeRatesModel>(
      path: path,
      fromJson: (json) => DailyExchangeRatesModel.fromJson(json, date)
    );
  }

}
