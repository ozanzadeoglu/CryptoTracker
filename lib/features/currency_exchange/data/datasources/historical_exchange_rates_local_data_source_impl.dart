import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_local_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';

class HistoricalExchangeRatesLocalDataSourceImpl
    implements IHistoricalExchangeRatesLocalDataSource {
  final ICacheService _cacheService;
  final ILoggerService _logger;

  HistoricalExchangeRatesLocalDataSourceImpl(this._cacheService, this._logger);

  @override
  Future<ApiResult<DailyExchangeRatesModel?>> getRateForDate(DateTime date) {
    final key = date.toUtc().toIso8601String().split('T').first;
    return _cacheService.get<DailyExchangeRatesModel>(key);
  }

  @override
  Future<ApiResult<void>> saveRateForDate(DailyExchangeRatesModel model) {
    return _cacheService.put(model.date, model);
  }
}
