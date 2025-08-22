import 'dart:math';

import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_current_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/models/daily_exchange_rates_model.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/daily_exchange_rates.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/repository/i_currency_repository.dart';

class CurrencyRepositoryImpl implements ICurrencyRepository {
  final ICurrentExchangeRatesRemoteDatasource _currentRemoteDataSource;
  final IHistoricalExchangeRatesRemoteDataSource _historicalRemoteDataSource;
  final ILoggerService _logger;

  CurrencyRepositoryImpl(
    this._currentRemoteDataSource,
    this._historicalRemoteDataSource,
    this._logger,
  );

  // Placing log logic here would pollute debug console too much, same with datasources
  // because data is fetched one by one... Not sure how to handle this.
  @override
  Future<ApiResult<DailyExchangeRates>> getRateForDate({
    required DateTime date,
  }) async {
    ApiResult<DailyExchangeRatesModel> result;
    if (_isToday(date)) {
      result = await _currentRemoteDataSource.getCurrentExchangeRates();
    } else {
      result = await _historicalRemoteDataSource.getHistoricalRate(date);
    }

    return result.when(
      success: (model) => ApiResult.success(model.toEntity()),
      failure: (error) {
        return ApiResult.failure(error);
      },
    );
  }

  @override
  Future<ApiResult<Map<String, DailyExchangeRates>>> getHistoricalRatesMap({
    required Set<DateTime> dates,
  }) async {
    try {
      _logger.logInfo(
        "Attempting to fetch historical exchange rates.",
        source: "CurrencyRepositoryImpl",
      );
      final futures = dates
          .where((date) => !_isToday(date))
          .map((date) => getRateForDate(date: date))
          .toList();

      final results = await Future.wait(futures);

      final ratesMap = <String, DailyExchangeRates>{};

      for (final result in results) {
        result.when(
          success: (rateEntity) {
            final dateKey = rateEntity.date.toIso8601String().split('T').first;
            ratesMap[dateKey] = rateEntity;
          },
          failure: (error) {
            _logger.logError(
              "A ExchangeRate fetch failed.",
              error: e,
              source: "CurrencyRepositoryImpl",
            );
            // TODO: How to handle partial eror?
          },
        );
      }
      _logger.logInfo(
        "Historical exchange rates are fetched succesfully",
        source: "CurrencyRepositoryImpl",
      );
      return ApiResult.success(ratesMap);
    } catch (e) {
      _logger.logWarning(
        "An error occured when fetching historical exchange rates",
        error: e,
        source: "CurrencyRepositoryImpl",
      );
      return const ApiResult.failure(ApiFailure.network());
    }
  }

  /// Helper to check if a date is today in UTC
  bool _isToday(DateTime date) {
    final now = DateTime.now().toUtc();
    final utcDate = DateTime.utc(date.year, date.month, date.day);
    final utcNow = DateTime.utc(now.year, now.month, now.day);
    return utcDate.isAtSameMomentAs(utcNow);
  }
}
