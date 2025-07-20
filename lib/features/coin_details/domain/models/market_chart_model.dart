import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_chart_model.freezed.dart';
part 'market_chart_model.g.dart';

/// Represents the historical time-series data for a coin's market chart.
///
/// This data is fetched from the `/coins/{id}/market_chart` endpoint and is
/// **not cached locally**. It's fetched on-demand whenever the user views a
/// coin's detail page or changes the time interval.
@freezed
abstract class MarketChartData with _$MarketChartData {
  const factory MarketChartData({
    /// A list of price data points over the selected time interval.
    @ChartDataPointConverter() required List<ChartDataPoint> prices,

    /// A list of market cap data points over the selected time interval.
    @JsonKey(name: 'market_caps')
    @ChartDataPointConverter()
    required List<ChartDataPoint> marketCaps,

    /// A list of total volume data points over the selected time interval.
    @JsonKey(name: 'total_volumes')
    @ChartDataPointConverter()
    required List<ChartDataPoint> totalVolumes,
  }) = _MarketChartData;

  /// Creates a [MarketChartData] instance from a JSON map.
  factory MarketChartData.fromJson(Map<String, dynamic> json) =>
      _$MarketChartDataFromJson(json);
}

/// Represents a single data point in a time-series chart, consisting of a date and a value.
///
/// Its JSON conversion is handled by the custom [ChartDataPointConverter] to
/// accommodate the API's array format.
@freezed
abstract class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    /// The specific date and time for this data point.
    required DateTime date,

    /// The value at this point in time (can be price, volume, or market cap).
    required double value,
  }) = _ChartDataPoint;

  /// Creates a [ChartDataPoint] instance from a JSON map.
  ///
  /// This factory is required by `freezed` for serialization but will be superseded
  /// by the [ChartDataPointConverter] when used within [MarketChartData].
  factory ChartDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartDataPointFromJson(json);
}

/// A custom [JsonConverter] to handle the non-standard `[timestamp, value]`
/// array format for a [ChartDataPoint] provided by the CoinGecko API.
///
/// This allows us to convert the raw API data into a rich, type-safe [ChartDataPoint]
/// object with a proper [DateTime] field.
class ChartDataPointConverter
    implements JsonConverter<ChartDataPoint, List<dynamic>> {
  const ChartDataPointConverter();

  /// Converts a `[timestamp, value]` JSON array into a [ChartDataPoint] object.
  @override
  ChartDataPoint fromJson(List<dynamic> json) {
    if (json.length != 2) {
      throw FormatException('Invalid ChartDataPoint format: $json');
    }
    return ChartDataPoint(
      date: DateTime.fromMillisecondsSinceEpoch(json[0] as int),
      value: (json[1] as num).toDouble(),
    );
  }

  /// Converts a [ChartDataPoint] object back into a `[timestamp, value]` JSON array.
  @override
  List<dynamic> toJson(ChartDataPoint object) {
    return [object.date.millisecondsSinceEpoch, object.value];
  }
}