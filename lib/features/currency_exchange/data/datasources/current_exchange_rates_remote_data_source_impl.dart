import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_endpoints.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_current_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

class CurrentExchangeRatesRemoteDataSourceImpl
    implements ICurrentExchangeRatesRemoteDatasource {
  final ApiClient _apiClient;
  final ILoggerService _logger;

  CurrentExchangeRatesRemoteDataSourceImpl(this._apiClient, this._logger);

  //TODO: Add error handling and logging.
  @override
  Future<ApiResult<DailyExchangeRatesModel>> getCurrentExchangeRates() {
    final path = ApiEndpoints.todaysExchangeRate();
    return _apiClient.get<DailyExchangeRatesModel>(
      path: path,
      fromJson: (json) => DailyExchangeRatesModel.fromCoinGecko(json),
    );
  }
}
