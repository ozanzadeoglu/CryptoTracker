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
      from: FiatCurrency.values.firstWhere((e) => e.name == from),
      to: FiatCurrency.values.firstWhere((e) => e.name == to),
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
}
