import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/features/portfolio/domain/entities/portfolio_asset_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'portfolio_asset_summary_model.freezed.dart';
part 'portfolio_asset_summary_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.portfolioAssetSummary)
abstract class PortfolioAssetSummaryModel with _$PortfolioAssetSummaryModel {
  const PortfolioAssetSummaryModel._();

  const factory PortfolioAssetSummaryModel({
    @HiveField(0) required String coinId,
    @HiveField(1) required double currentAmount,
    @HiveField(2) required double averageBuyPriceInBaseCurrency,
    @HiveField(3) required double totalCostBasisInBaseCurrency,
    @HiveField(4) required double realizedPnlInBaseCurrency,
  }) = _PortfolioAssetSummaryModel;

  /// Converts this Data-layer Model to a pure Domain-layer Entity.
  PortfolioAssetSummary toEntity() {
    return PortfolioAssetSummary(
      coinId: coinId,
      currentAmount: currentAmount,
      averageBuyPriceInBaseCurrency: averageBuyPriceInBaseCurrency,
      totalCostBasisInBaseCurrency: totalCostBasisInBaseCurrency,
      realizedPnlInBaseCurrency: realizedPnlInBaseCurrency,
    );
  }

  /// Creates a Data-layer Model from a pure Domain-layer Entity for saving.
  factory PortfolioAssetSummaryModel.fromEntity(PortfolioAssetSummary entity) {
    return PortfolioAssetSummaryModel(
      coinId: entity.coinId,
      currentAmount: entity.currentAmount,
      averageBuyPriceInBaseCurrency: entity.averageBuyPriceInBaseCurrency,
      totalCostBasisInBaseCurrency: entity.totalCostBasisInBaseCurrency,
      realizedPnlInBaseCurrency: entity.realizedPnlInBaseCurrency,
    );
  }
}
