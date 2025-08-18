// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_asset_summary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioAssetSummaryModelAdapter
    extends TypeAdapter<PortfolioAssetSummaryModel> {
  @override
  final typeId = 4;

  @override
  PortfolioAssetSummaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortfolioAssetSummaryModel(
      coinId: fields[0] as String,
      currentAmount: (fields[1] as num).toDouble(),
      averageBuyPriceInBaseCurrency: (fields[2] as num).toDouble(),
      totalCostBasisInBaseCurrency: (fields[3] as num).toDouble(),
      realizedPnlInBaseCurrency: (fields[4] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, PortfolioAssetSummaryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.coinId)
      ..writeByte(1)
      ..write(obj.currentAmount)
      ..writeByte(2)
      ..write(obj.averageBuyPriceInBaseCurrency)
      ..writeByte(3)
      ..write(obj.totalCostBasisInBaseCurrency)
      ..writeByte(4)
      ..write(obj.realizedPnlInBaseCurrency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioAssetSummaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
