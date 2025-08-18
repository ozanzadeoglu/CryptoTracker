import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/features/portfolio/domain/entities/transaction.dart';
import 'package:crypto_tracker/features/portfolio/domain/entities/transaction_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.transaction)
abstract class TransactionModel with _$TransactionModel {
  // A private constructor is still good practice with freezed
  const TransactionModel._();

  const factory TransactionModel({
    @HiveField(0) required String id,
    @HiveField(1) required String coinId,
    @HiveField(2) required String type,
    @HiveField(3) required double amount,
    @HiveField(4) required double pricePerCoin,
    @HiveField(5) required String fiatCurrency,
    @HiveField(6) required double conversionRateToBase,
    @HiveField(7) required DateTime transactionDate,
  }) = _TransactionModel;

  /// Converts this Data-layer Model to a pure Domain-layer Entity.
  Transaction toEntity() {
    return Transaction(
      id: id,
      coinId: coinId,
      type: TransactionType.values.firstWhere((e) => e.name == type),
      amount: amount,
      pricePerCoin: pricePerCoin,
      fiatCurrency: FiatCurrency.values.firstWhere(
        (e) => e.name == fiatCurrency,
      ),
      conversionRateToBase: conversionRateToBase,
      transactionDate: transactionDate,
    );
  }

  /// Creates a Data-layer Model from a pure Domain-layer Entity for saving.
  factory TransactionModel.fromEntity(Transaction entity) {
    return TransactionModel(
      id: entity.id,
      coinId: entity.coinId,
      type: entity.type.name,
      amount: entity.amount,
      pricePerCoin: entity.pricePerCoin,
      fiatCurrency: entity.fiatCurrency.name,
      conversionRateToBase: entity.conversionRateToBase,
      transactionDate: entity.transactionDate,
    );
  }
}
