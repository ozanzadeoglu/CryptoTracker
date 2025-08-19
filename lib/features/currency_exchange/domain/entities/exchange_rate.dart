import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate.freezed.dart';

@freezed
abstract class ExchangeRate with _$ExchangeRate {
  const factory ExchangeRate({
    /// The currency we are converting from.
    required FiatCurrency from,

    /// The currency we are converting to.
    required FiatCurrency to,

    /// The date for which this rate is valid.
    required DateTime date,

    /// The conversion factor (e.g., if from=USD and to=TRY, rate might be 32.5).
    required double rate,
  }) = _ExchangeRate;
}