// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketChartData _$MarketChartDataFromJson(Map<String, dynamic> json) =>
    _MarketChartData(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => const ChartDataPointConverter().fromJson(e as List))
          .toList(),
      marketCaps: (json['market_caps'] as List<dynamic>)
          .map((e) => const ChartDataPointConverter().fromJson(e as List))
          .toList(),
      totalVolumes: (json['total_volumes'] as List<dynamic>)
          .map((e) => const ChartDataPointConverter().fromJson(e as List))
          .toList(),
    );

Map<String, dynamic> _$MarketChartDataToJson(_MarketChartData instance) =>
    <String, dynamic>{
      'prices': instance.prices
          .map(const ChartDataPointConverter().toJson)
          .toList(),
      'market_caps': instance.marketCaps
          .map(const ChartDataPointConverter().toJson)
          .toList(),
      'total_volumes': instance.totalVolumes
          .map(const ChartDataPointConverter().toJson)
          .toList(),
    };

_ChartDataPoint _$ChartDataPointFromJson(Map<String, dynamic> json) =>
    _ChartDataPoint(
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$ChartDataPointToJson(_ChartDataPoint instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
    };
