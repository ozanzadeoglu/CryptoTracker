import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_bundle.freezed.dart';

@freezed
abstract class ExchangeRateBundle with _$ExchangeRateBundle {
  const factory ExchangeRateBundle({
    /// The most up-to-date exchange rate for the user's display currency.
    /// This rate will be used to calculate current value of the portfolio.
    required double currentRate,
    
    /// A map of all the historical rates needed for the user's transactions.
    /// Key: The date of the transaction.
    /// Value: The exchange rate on that date.
    required Map<DateTime, double> historicalRates,
  }) = _ExchangeRateBundle;
}