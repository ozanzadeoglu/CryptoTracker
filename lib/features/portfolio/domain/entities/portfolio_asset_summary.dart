import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_asset_summary.freezed.dart';

@freezed
abstract class PortfolioAssetSummary with _$PortfolioAssetSummary {
  const factory PortfolioAssetSummary({
    /// The unique identifier for the crypto asset (e.g., "bitcoin").
    required String coinId,

    /// The current total quantity of the asset held by the user.
    required double currentAmount,

    /// NOTE: All financial values below are ALWAYS stored in the app's
    /// single, consistent base currency (e.g., USD) to ensure data integrity.

    /// The average price paid for the assets currently held, in the base currency(USD).
    required double averageBuyPriceInBaseCurrency,

    /// The total money spent on the assets currently held, in the base currency(USD).
    required double totalCostBasisInBaseCurrency,

    /// The total profit or loss that has been "locked in" from all historical sales of this asset(USD).
    required double realizedPnlInBaseCurrency,
  }) = _PortfolioAssetSummary;
}