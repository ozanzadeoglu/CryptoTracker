import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/entities/exchange_rate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'exchange_rate_model.freezed.dart';
part 'exchange_rate_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.exchangeRate)
abstract class ExchangeRateModel with _$ExchangeRateModel {
  const ExchangeRateModel._();

  const factory ExchangeRateModel({
    @HiveField(0) required String from,
    @HiveField(1) required String to,
    @HiveField(2) required DateTime date,
    @HiveField(3) required double rate,
  }) = _ExchangeRateModel;

  /// Generates a predictable, unique key for storing this rate in Hive.
  /// e.g. "2024-01-15_USD_TRY"
  static String generateKey(DateTime date, FiatCurrency from, FiatCurrency to) {
    final dateString =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    return '${dateString}_${from.name}_${to.name}';
  }

  ExchangeRate toEntity() {
    return ExchangeRate(
      from: FiatCurrency.values.firstWhere((e) => e.name.toLowerCase() == from.toLowerCase()),
      to: FiatCurrency.values.firstWhere((e) => e.name.toLowerCase() == to.toLowerCase()),
      date: date,
      rate: rate,
    );
  }

  factory ExchangeRateModel.fromEntity(ExchangeRate entity) {
    return ExchangeRateModel(
      from: entity.from.name,
      to: entity.to.name,
      date: entity.date,
      rate: entity.rate,
    );
  }

  factory ExchangeRateModel.fromFrankfurterJson(
    Map<String, dynamic> json,
    FiatCurrency to,
  ) {
    try {
      final rates = json['rates'] as Map<String, dynamic>?;
      if (rates == null) {
        throw const FormatException('Missing "rates" key in API response.');
      }
      final rateValue = rates[to.name.toUpperCase()] as num?;
      if (rateValue == null) {
        throw FormatException(
          'Rate for "${to.name.toUpperCase()}" not found in API response.',
        );
      }
      final fromCurrency = json['base'] as String?;
      final dateString = json['date'] as String?;

      if (fromCurrency == null || dateString == null) {
        throw const FormatException(
          'Missing "base" or "date" key in API response.',
        );
      }
      return ExchangeRateModel(
        from: fromCurrency,
        to: to.name,
        date: DateTime.parse(dateString),
        rate: rateValue.toDouble(),
      );
    } on Exception catch (e) {
      throw FormatException('Failed to parse historical ExchangeRateModel: $e');
    }
  }

  factory ExchangeRateModel.fromCoinGeckoJson(
    Map<String, dynamic> json,
    FiatCurrency from,
    FiatCurrency to,
  ) {
    try {
      final btcData = json['bitcoin'] as Map<String, dynamic>?;
      if (btcData == null) {
        throw const FormatException('Missing "bitcoin" key in API response.');
      }

      final fromPrice = btcData[from.name.toLowerCase()] as num?;
      final toPrice = btcData[to.name.toLowerCase()] as num?;

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
        date: DateTime.now().toUtc(),
        rate: calculatedRate,
      );
    } on Exception catch (e) {
      throw FormatException('Failed to parse ExchangeRateModel: $e');
    }
  }
}
