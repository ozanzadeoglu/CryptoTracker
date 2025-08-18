import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/features/portfolio/domain/entities/transaction_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  // A private constructor is needed to add custom getters.
  const Transaction._();

  const factory Transaction({
    /// ULID string
    required String id,

    /// Coin id, e.g. bitcoin, etherium
    required String coinId,

    /// The type of the transaction (buy or sell).
    required TransactionType type,

    /// The quantity of the crypto asset transacted.
    required double amount,

    /// The price of a single unit of the crypto asset in the specified [fiatCurrency].
    required double pricePerCoin,

    /// The fiat currency in which the transaction was made.
    required FiatCurrency fiatCurrency,

    /// The exchange rate to the app's base currency (e.g., USD) on the transaction date.
    /// Example: If 1 EUR = 1.08 USD, this value is 1.08. For a USD transaction, it's 1.0.
    required double conversionRateToBase,

    /// The exact date and time of the transaction.
    required DateTime transactionDate,

  }) = _Transaction;

  /// A computed property for the transaction's total value in its original currency.
  double get originalTotalValue => amount * pricePerCoin;

  /// A computed property for the transaction's total value converted to the app's base currency.
  /// This value is stable and historically accurate.
  double get totalValueInBaseCurrency => originalTotalValue * conversionRateToBase;
}
