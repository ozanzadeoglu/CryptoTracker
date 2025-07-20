import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

/// Represents the type of a user transaction.
@HiveType(typeId: 3)
enum TransactionType {
  @HiveField(0)
  buy,
  @HiveField(1)
  sell,
}

/// Represents a single user-generated buy or sell transaction.
///
/// This is a core domain model for the portfolio feature, and it is the
/// single source of truth for the user's holdings.
@freezed
@HiveType(typeId: 4)
abstract class Transaction with _$Transaction {
  const factory Transaction({
    /// A unique identifier for the transaction (e.g., a UUID).
    @HiveField(0) required String id,

    /// The ID of the coin being transacted, linking to a [Coin].id.
    @HiveField(1) required String coinId,

    /// The type of transaction, either [TransactionType.buy] or [TransactionType.sell].
    @HiveField(2) required TransactionType type,

    /// The quantity of the coin that was bought or sold.
    @HiveField(3) required double amount,

    /// The price of a single coin at the time of the transaction.
    /// This should be stored in a consistent base currency (e.g., USD).
    @HiveField(4) required double pricePerCoin,

    /// The date and time the transaction occurred.
    @HiveField(5) required DateTime date,
  }) = _Transaction;
}