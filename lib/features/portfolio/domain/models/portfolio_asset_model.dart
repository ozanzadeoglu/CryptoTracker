import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';

part 'portfolio_asset_model.freezed.dart';

/// A computed **ViewModel** representing a user's total holding of a single asset.
///
/// This is NOT a stored domain model. It is created on-the-fly by a UseCase or ViewModel
/// by combining the user's [Transaction] history with the live market data from a [Coin] object.
@freezed
abstract class PortfolioAsset with _$PortfolioAsset {
  const factory PortfolioAsset({
    /// The full [Coin] object containing live market data (name, image, price, etc.).
    required Coin coin,

    /// The total amount of this coin the user currently holds (sum of all buys and sells).
    required double amountHeld,

    /// The total fiat value the user has spent to acquire the currently held amount (cost basis).
    required double totalInvested,

    /// The current total fiat value of the user's holding (`amountHeld` * `coin.currentPrice`).
    required double currentValue,

    /// The total profit or loss in fiat currency (`currentValue` - `totalInvested`).
    required double profitOrLoss,
    
    /// The total profit or loss as a percentage.
    required double profitOrLossPercentage,
  }) = _PortfolioAsset;
}