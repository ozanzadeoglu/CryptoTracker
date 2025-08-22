import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/daily_exchange_rates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'daily_exchange_rates_model.freezed.dart';
part 'daily_exchange_rates_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.dailyExchangeRates)
abstract class DailyExchangeRatesModel with _$DailyExchangeRatesModel {
  const DailyExchangeRatesModel._();

  const factory DailyExchangeRatesModel({
    @HiveField(0) required String date,

    @HiveField(1) required String base,

    @HiveField(2) required Map<String, double> rates,
  }) = _DailyExchangeRatesModel;

  factory DailyExchangeRatesModel.fromJson(Map<String, dynamic> json) =>
      _$DailyExchangeRatesModelFromJson(json);

  /// Creates a model from the CoinGecko /simple/price endpoint response.
  factory DailyExchangeRatesModel.fromCoinGecko(Map<String, dynamic> json) {
    if (json.isEmpty || json.values.first is! Map) {
      throw const FormatException('Invalid CoinGecko JSON structure');
    }
    final prices = json.values.first as Map<String, dynamic>;

    final usdPrice = double.tryParse(prices['usd'].toString());
    if (usdPrice == null || usdPrice == 0) {
      throw const FormatException(
        'CoinGecko response either doesnt have "usd" field or doesnt contain a valid non-zero "usd" price.',
      );
    }

    final supportedCurrencies = FiatCurrency.values
        .map((c) => c.name.toLowerCase())
        .toSet();
    final Map<String, double> calculatedRates = {};

    for (final entry in prices.entries) {
      final currencyCode = entry.key.toLowerCase();

      // Don't add usd convertion to rates map.
      if (currencyCode == 'usd') {
        continue;
      }

      if (supportedCurrencies.contains(currencyCode)) {
        final targetPrice = double.parse(entry.value.toString());
        final rate = targetPrice / usdPrice;

        calculatedRates[currencyCode.toUpperCase()] = rate;
      }
    }

    return DailyExchangeRatesModel(
      // Set the date to today in "yyyy-MM-dd" format.
      date: DateTime.now().toUtc().toIso8601String().split('T').first,
      base: FiatCurrency.usd.name.toUpperCase(),
      rates: calculatedRates,
    );
  }

  DailyExchangeRates toEntity() {
    final Map<FiatCurrency, double> entityRates = {};
    final Map<String, FiatCurrency> supportedCurrencies = {
      for (var currency in FiatCurrency.values)
        currency.name.toLowerCase(): currency,
    };
    for (final entry in rates.entries) {
      if (supportedCurrencies.containsKey(entry.key.toLowerCase())) {
        entityRates[supportedCurrencies[entry.key.toLowerCase()]!] =
            entry.value;
      }
    }

    return DailyExchangeRates(
      date: DateTime.parse(date),
      // base is always usd.
      base: FiatCurrency.usd,
      rates: entityRates,
    );
  }

  // Fiat currency names stored upper case, just like Frankfurter api.
  factory DailyExchangeRatesModel.fromEntity(DailyExchangeRates entity) {
    return DailyExchangeRatesModel(
      date: entity.date
          .toIso8601String()
          .split('T')
          .first, // Returns this format "yyyy-MM-dd"
      base: entity.base.name.toUpperCase(),
      rates: entity.rates.map(
        (key, value) => MapEntry(key.name.toUpperCase(), value),
      ),
    );
  }
}
