import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_exchange_rates.freezed.dart';

@freezed
abstract class DailyExchangeRates with _$DailyExchangeRates {
  
  factory DailyExchangeRates({
    /// Date of exchange rates.
    required DateTime date,

    // Base fiat currency of all rates(usd)
    required FiatCurrency base,

    /// A map of target currencies to their conversion rate from the base currency.
    required Map<FiatCurrency, double> rates,
  }) = _DailyExchangeRates;
}
